-- EmoteLDB by Cilraaz of Aerie Peak US
local addonName, EmoteLDB = ...

-- Create the addon object using Ace3
LibStub("AceAddon-3.0"):NewAddon(EmoteLDB, addonName, "AceEvent-3.0")
_G.EmoteLDB = EmoteLDB

-- Local references to globals for performance
local string = string
local pairs = pairs
local ipairs = ipairs
local format = string.format
local gsub = string.gsub
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------
local ADDON_VERSION = GetAddOnMetadata("EmoteLDB", "Version") or "Unknown"

local COLOR_CODES = {
	none = "fffefefe",
	action = "ff9482c9",
	vocal = "ffff8000",
	av = "ff1eff00",
	error = "ff9d9d9d",
	green = "0000FF00",
	red = "00FF0000",
	purple = "00FF00FF"
}

local EMOTE_REACTION_TYPES = {
	NONE = 0,
	ACTION = 1,
	VOCAL = 2,
	AV = 3
}

-- Largest category size for tooltip padding
local MAX_CATEGORY_SIZE = 30

--------------------------------------------------------------------------------
-- Debug Setting
--------------------------------------------------------------------------------
EmoteLDB.debug = false

--------------------------------------------------------------------------------
-- Database Defaults
--------------------------------------------------------------------------------
local defaults = {
	profile = {
		showSlashCommand = true,
		hideDetails = true
	},
	global = {
		LibDBIcon = {hide = false}
	}
}

--------------------------------------------------------------------------------
-- Localization Setup
--------------------------------------------------------------------------------
EmoteLDB.L = EmoteLDB.L or {}
local L = EmoteLDB.L

if not getmetatable(L) then
	setmetatable(L, {
		__index = function(t, key)
			-- Only show warnings if debug mode is enabled
			if EmoteLDB.debug then
				print(string.format("|cFFFF0000EmoteLDB Warning:|r Missing translation: %s", tostring(key)))
			end
			-- Cache and return the key as fallback
			rawset(t, key, key)
			return key
		end
	})
end

--------------------------------------------------------------------------------
-- Lib References
--------------------------------------------------------------------------------
local LibDataBroker = LibStub:GetLibrary("LibDataBroker-1.1")
local LibDBIcon = LibStub("LibDBIcon-1.0")

--------------------------------------------------------------------------------
-- Custom Tooltip
--------------------------------------------------------------------------------
local tooltip = EmoteLDB.Tooltip

--------------------------------------------------------------------------------
-- Module Variables
--------------------------------------------------------------------------------
local dataObject

-- State management
local currentCategory = nil
local emotesByReaction = {}

--------------------------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------------------------
local function DebugPrint(message)
	if EmoteLDB.debug then
		DEFAULT_CHAT_FRAME:AddMessage("[EmoteLDB Debug] " .. tostring(message))
	end
end

-- Get gender-appropriate pronouns for the player
local function GetPlayerPronouns()
	local gender = UnitSex("player")
	
	if gender == 2 then -- Male
		return {
			He = L["He"],
			His = L["His"],
			he = L["he"],
			his = L["his"]
		}
	elseif gender == 3 then -- Female
		return {
			He = L["She"],
			His = L["Her"],
			he = L["she"],
			his = L["her"]
		}
  else -- Unknown
    return {
      He = L["It"],
      His = L["Its"],
      he = L["it"],
      his = L["its"]
    }
	end
end

-- Replace template tags in emote text
local function ProcessEmoteText(text, targetName, pronouns)
	if not text then return "" end
	
	-- Replace target
	if targetName then
		text = gsub(text, "<Target>", targetName)
	end
	
	-- Replace pronouns
	if pronouns then
		text = gsub(text, "<He>", pronouns.He)
		text = gsub(text, "<His>", pronouns.His)
		text = gsub(text, "<he>", pronouns.he)
		text = gsub(text, "<his>", pronouns.his)
	end
	
	return text
end

-- Get colored emote text based on reaction type
local function GetColoredEmoteText(emoteData, hasTarget)
	if not emoteData then return "" end
	
	local emoteText = hasTarget and emoteData.target or emoteData.none
	local firstType = EL_Types[emoteData.types[1]]
	
	-- Add player name for custom emotes
	if firstType == L["Custom"] then
		emoteText = UnitName("player") .. " " .. emoteText
	end
	
	-- Determine color and flag based on reaction type
	local color = COLOR_CODES.none
	local flag = nil
	local reactionType = EL_React[emoteData.react]
	
	if reactionType == L["Action"] then
		color = COLOR_CODES.action
		flag = L["Action"]
	elseif reactionType == L["Vocal"] then
		color = COLOR_CODES.vocal
		flag = L["Vocal"]
	elseif reactionType == L["AV"] then
		color = COLOR_CODES.av
		flag = L["AV"]
	elseif reactionType ~= "" then
		-- Unknown reaction type
		color = COLOR_CODES.error
	end
	
	local result = "|c" .. color .. emoteText .. FONT_COLOR_CODE_CLOSE
	if flag then
		result = result .. " [" .. flag .. "]"
	end
	
	return result
end

-- Execute an emote command
local function ExecuteEmote(emoteKey)
	if not emoteKey or not EL_Emotes[emoteKey] then return end
	
	local emoteData = EL_Emotes[emoteKey]
	local firstType = EL_Types[emoteData.types[1]]
	
	-- Handle custom emotes
	if firstType == L["Custom"] then
		local targetName = UnitName("target")
		local pronouns = GetPlayerPronouns()
		
		local emoteText = targetName and emoteData.target or emoteData.none
		emoteText = ProcessEmoteText(emoteText, targetName, pronouns)
		
		DoEmote(emoteText, "EMOTE")
	else
		-- Standard emote command
		DoEmote(emoteKey)
	end
end

-- Clear tooltip state
local function ClearTooltipState()
	currentCategory = nil
	emotesByReaction = {
		[EMOTE_REACTION_TYPES.NONE] = {},
		[EMOTE_REACTION_TYPES.ACTION] = {},
		[EMOTE_REACTION_TYPES.VOCAL] = {},
		[EMOTE_REACTION_TYPES.AV] = {}
	}
end

--------------------------------------------------------------------------------
-- Tooltip Building
--------------------------------------------------------------------------------
-- Build category list for tooltip
local function BuildCategoryList()
	DebugPrint("Building category list")
	
	for categoryId, categoryName in ipairs(EL_Types) do
		tooltip:AddLine(categoryName, "CENTER", nil, function()
			EmoteLDB:OnCategoryClick(categoryId)
		end)
	end
end

-- Build emote list for selected category
local function BuildEmoteList()
	DebugPrint("Building emote list for category: " .. tostring(currentCategory))
	
	-- Add back button
	tooltip:AddLine(L["Return to Category List"] or "Return to Category List", "CENTER", nil, function()
		EmoteLDB:ReturnToCategoryList()
	end)
	tooltip:AddSpacer()
	
	-- Display emotes sorted by reaction type (AV -> Vocal -> Action -> None)
	local emoteCount = 0
	for i = EMOTE_REACTION_TYPES.AV, EMOTE_REACTION_TYPES.NONE, -1 do
		for _, emoteInfo in ipairs(emotesByReaction[i]) do
			local displayText = EmoteLDB.db.profile.showSlashCommand 
				and (emoteInfo.command .. emoteInfo.text)
				or emoteInfo.text
			
			tooltip:AddLine(displayText, "LEFT", nil, function()
				ExecuteEmote(emoteInfo.key)
			end)
			
			emoteCount = emoteCount + 1
		end
	end
	
	DebugPrint("Displayed " .. emoteCount .. " emotes")
	
	-- Add filler lines to prevent tooltip resizing
	if emoteCount < MAX_CATEGORY_SIZE then
		for i = 1, (MAX_CATEGORY_SIZE - emoteCount) do
			tooltip:AddSpacer()
		end
	end
end

-- Build settings section for tooltip
local function BuildSettingsSection()
	tooltip:AddSpacer()
	
	-- Slash command toggle
	tooltip:AddLine(L["Toggle the display of slash commands."], "CENTER", nil, function()
		EmoteLDB:ToggleSlashCommands()
	end)
	
	local slashStatus = EmoteLDB.db.profile.showSlashCommand 
		and ("|c" .. COLOR_CODES.green .. "Shown|r")
		or ("|c" .. COLOR_CODES.red .. "Hidden|r")
	tooltip:AddLine((L["Currently: "] or "Currently: ") .. slashStatus, "LEFT")
	tooltip:AddSpacer()
	
	-- Minimap icon toggle
	tooltip:AddLine(L["Toggle the display of the minimap button"], "CENTER", nil, function()
		EmoteLDB:ToggleMinimapIcon()
	end)
	
	local iconStatus = EmoteLDB.db.global.LibDBIcon.hide 
		and ("|c" .. COLOR_CODES.red .. "Hidden|r")
		or ("|c" .. COLOR_CODES.green .. "Shown|r")
	tooltip:AddLine((L["Currently: "] or "Currently: ") .. iconStatus, "LEFT")
	tooltip:AddSpacer()
	
	-- Version display
	local versionText = (L["EmoteLDB version: "] or "EmoteLDB version: ") .. "|c" .. COLOR_CODES.purple .. ADDON_VERSION .. "|r"
	tooltip:AddLine(versionText, "LEFT")
end

-- Main tooltip builder
function EmoteLDB:BuildTooltip()
	if not tooltip then return end
	
	tooltip:ClearLines()
	
	-- Add header
	tooltip:AddHeader("EmoteLDB")
	tooltip:AddSpacer()
	
	-- Build content based on current state
	if not currentCategory then
		BuildCategoryList()
		BuildSettingsSection()
	else
		BuildEmoteList()
	end
	
	tooltip:Show()
end

--------------------------------------------------------------------------------
-- Event Handlers
--------------------------------------------------------------------------------
function EmoteLDB:OnCategoryClick(categoryId)
	DebugPrint("Category clicked: " .. categoryId)
	
	currentCategory = categoryId
	
	-- Clear and rebuild emote lists
	for i = EMOTE_REACTION_TYPES.NONE, EMOTE_REACTION_TYPES.AV do
		emotesByReaction[i] = {}
	end
	
	local targetName = UnitName("target")
	local pronouns = GetPlayerPronouns()
	local categoryName = EL_Types[categoryId]
	
	-- Collect all emotes in this category
	for emoteKey, emoteData in pairs(EL_Emotes) do
		for _, typeId in pairs(emoteData.types) do
			if typeId == categoryId then
				local coloredText = GetColoredEmoteText(emoteData, targetName)
				coloredText = ProcessEmoteText(coloredText, targetName, pronouns)
				
				local command
				if emoteData.custom and emoteData.custom[1] == 1 then
					command = L["Custom:  "]
				else
					command = "/" .. emoteKey .. ":  "
				end
				
				local reactionType = emoteData.react or EMOTE_REACTION_TYPES.NONE
				table.insert(emotesByReaction[reactionType], {
					command = command,
					text = coloredText,
					key = emoteKey
				})
				
				break
			end
		end
	end
	
	-- Sort emotes alphabetically by key
	local sortFunc = function(a, b) return a.key < b.key end
	for i = EMOTE_REACTION_TYPES.NONE, EMOTE_REACTION_TYPES.AV do
		table.sort(emotesByReaction[i], sortFunc)
	end
	
	self:BuildTooltip()
end

function EmoteLDB:ReturnToCategoryList()
	DebugPrint("Returning to category list")
	ClearTooltipState()
	self:BuildTooltip()
end

function EmoteLDB:ToggleSlashCommands()
	self.db.profile.showSlashCommand = not self.db.profile.showSlashCommand
	self:BuildTooltip()
end

function EmoteLDB:ToggleMinimapIcon()
	self.db.global.LibDBIcon.hide = not self.db.global.LibDBIcon.hide
	
	if self.db.global.LibDBIcon.hide then
		LibDBIcon:Hide("EmoteLDB")
	else
		LibDBIcon:Show("EmoteLDB")
	end
	
	self:BuildTooltip()
end

--------------------------------------------------------------------------------
-- Slash Commands
--------------------------------------------------------------------------------
SLASH_EMOTELDB1, SLASH_EMOTELDB2 = "/emoteldb", "/eldb"

function SlashCmdList.EMOTELDB(msg)
	msg = msg and msg:trim():lower() or ""
	
	if msg == "" then
		print("EmoteLDB Command List (/emoteldb or /eldb):")
		print("/emoteldb toggleicon - Toggle the minimap icon")
		print("/emoteldb showslash - Toggle the showing of emote slash commands")
		return
	end
	
	if msg == "toggleicon" then
		EmoteLDB:ToggleMinimapIcon()
		
		local status = EmoteLDB.db.global.LibDBIcon.hide 
			and "|cFFFF0000HIDDEN|r"
			or "|cFF00FF00VISIBLE|r"
		print("EmoteLDB: Minimap icon is now " .. status)
		
	elseif msg == "showslash" then
		EmoteLDB:ToggleSlashCommands()
		
		local status = EmoteLDB.db.profile.showSlashCommand 
			and "|cFF00FF00ON|r"
			or "|cFFFF0000OFF|r"
		print("EmoteLDB: Slash commands are now " .. status)
		
	else
		print("EmoteLDB: Invalid command!")
		print("Use /emoteldb or /eldb for help")
	end
end

--------------------------------------------------------------------------------
-- Addon Initialization
--------------------------------------------------------------------------------
function EmoteLDB:OnInitialize()
	-- Initialize database
	self.db = LibStub("AceDB-3.0"):New("EmoteLDBDB", defaults, true)
	
	-- Initialize state
	ClearTooltipState()
	
	-- Create LibDataBroker object
	dataObject = LibDataBroker:NewDataObject("EmoteLDB", {
		type = "launcher",
		text = "EmoteLDB",
		icon = "Interface\\Icons\\Spell_Holy_PrayerOfHealing",
		OnClick = function(frame, button)
			EmoteLDB:OnDataObjectClick(frame, button)
		end,
		OnTooltipShow = function(tooltip)
			EmoteLDB:OnTooltipShow(tooltip)
		end,
	})
	
	-- Register with LibDBIcon for minimap button
	LibDBIcon:Register("EmoteLDB", dataObject, self.db.global.LibDBIcon)
	
	DebugPrint("EmoteLDB initialized")
end

function EmoteLDB:OnEnable()
	DebugPrint("EmoteLDB enabled")
end

function EmoteLDB:OnDataObjectClick(frame, button)
	if button == "LeftButton" then
		if tooltip:IsShown() then
			tooltip:Hide()
		else
			tooltip:SmartAnchorTo(frame)
			self:BuildTooltip()
		end
	end
end

function EmoteLDB:OnTooltipShow(tt)
	tt:AddLine("EmoteLDB")
	tt:AddLine(L["Last Emote Used"] or "Click to access emotes", 1, 1, 1)
end