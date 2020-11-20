-- EmoteLDB by Cilraaz/Allisu of Rexxar-US

-- Basic addon info
local addonName, addon = ...

EmoteLDB = LibStub("AceAddon-3.0"):NewAddon("EmoteLDB")

-- Initialize localization
local L = nil
local AL = LibStub:GetLibrary("AceLocale-3.0", true)
if AL then
  if type(addon.LoadTranslations) == "function" then
    addon:LoadTranslations(AL)
    addon.LoadTranslations = nil
  end
  L = AL:GetLocale(addonName)
  AL = nil
else
  L = setmetatable({}, {__index = function(t,k) t[k] = k return k end })
end
addon.L = L

-- Set up environment variables
local string = _G.string
local pairs = _G.pairs
local gsub = string.gsub

local emoteVer = "v2020.11.20-2"

-- Debug setting
addon.debug = false

-- Declare Libs
local self = EmoteLDB
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local QTC = LibStub('LibQTipELDB-1.0')
local icon = LibStub("LibDBIcon-1.0")

-- Variables for tooltip and Data Object
local ELDBTip
local options
local EmoteLDBObj
local tipcfg = {
  bgFile = "Interface/Tooltips/UI-Tooltip-Background-Azerite",
  edgeFile = "Interface/Tooltips/UI-Tooltip-Border-Azerite",
  tile = false,
  tileEdge = false,
  tileSize = 16,
  edgeSize = 16,
  insets = {left=3, right=3, top=3, bottom=3}
}

-- Variables/Tables for emote compilation/output
local info = nil
local key = nil
local infoArray = {}
local keyArray = {}
local emoteTable = {}

-- DB Defaults
local defaults = {
  profile = {
    showSlashCommand = true,
    hideDetails = true
  },
  global = {
    LibDBIcon = { hide = false }
  }
}

-- Create and colorize text for emote list
function EmoteLDB:GetOnDemandText(v,hasTarget)
  local color
  local flag = nil
  local returnCode
  local emoteText
  local firstType = EL_Types[v["types"][1]]

  if (hasTarget) then emoteText = v.target else emoteText = v.none end
  
  if (firstType == "Custom") then
    emoteText = UnitName("player").." "..emoteText
  end

  if (EL_React[v.react] == "") then -- None
    color = "fffefefe"
  elseif (EL_React[v.react] == "Action") then -- Animated, Purple
    color = "ff9482c9"
    flag = L["Action"]
  elseif (EL_React[v.react] == "Vocal") then -- Voice, Orange
    color = "ffff8000"
    flag = L["Vocal"]
  elseif (EL_React[v.react] == "AV") then -- Both, Green
    color = "ff1eff00"
    flag = L["AV"]
  else -- Shouldn't happen, Grey
    color = "ff9d9d9d"
  end

  returnCode = "|c" .. color .. emoteText .. FONT_COLOR_CODE_CLOSE
  if (flag) then returnCode = returnCode.." ["..flag.."]" end
  return returnCode
end

-- Handles clicking of the object itself (minimap icon, rather than within tooltip)
function HandleModClick(_, k)
  -- Handle a return to category list click
  if (k and k == "catList") then
    ELDBTip:Clear()
    key = nil
    keyArray = {}
    info = nil
    infoArray = {}
    emoteTable = {}
    -- Call the method to build the tooltip
    EmoteLDB:BuildTooltip(key, info)
    -- Actually display the tooltip
    ELDBTip:Show()
  end

  -- Handle an emote click
  if (k and k ~= "catList") then
    -- Custom emote
    local firstType = EL_Types[EL_Emotes[k]["types"][1]]
    if (firstType == "Custom") then
      local emoteText
      local hasTarget = UnitName("target")
      local genderCode = UnitSex("player")
      local genderHe = nil
      local genderHis = nil
      local genderhe = nil
      local genderhis = nil
      if (genderCode == 2) then -- male
        genderHe = L["He"]
        genderHis = L["His"]
        genderhe = L["he"]
        genderhis = L["his"]
      else -- female (we hope)
        genderHe = L["She"]
        genderHis = L["Her"]
        genderhe = L["she"]
        genderhis = L["her"]
      end

      if (hasTarget) then
        emoteText = EL_Emotes[k].target
        emoteText = gsub(emoteText,"<Target>",hasTarget)
      else
        emoteText = EL_Emotes[k].none
      end
      
      emoteText = gsub(emoteText,"<He>",genderHe)
      emoteText = gsub(emoteText,"<His>",genderHis)
      emoteText = gsub(emoteText,"<he>",genderhe)
      emoteText = gsub(emoteText,"<his>",genderhis)

      EmoteLDBObj.text = "/"..k
      SendChatMessage(emoteText,"EMOTE")
      HideTooltip()
    else
      -- Alter token for emotes that share tokens, but can only be activated by one
      emoteToken = string.upper(k)
      if (emoteToken == "LAVISH") then
        emoteToken = "PRAISE";
      end
      if (emoteToken == "EXCITED") then
        emoteToken = "TALKEX";
      end
      if (emoteToken == "DOOM") then
        emoteToken = "THREATEN";
      end
      if (emoteToken == "SILLY") then
        emoteToken = "JOKE";
      end
      if (emoteToken == "LAY") then
        emoteToken = "LAYDOWN";
      end
      if (emoteToken == "REAR") then
        emoteToken = "SHAKE";
      end
      if (emoteToken == "BELCH") then
        emoteToken = "BURP";
      end
      if (emoteToken == "SMELL") then
        emoteToken = "STINK";
      end
      if (emoteToken == "GOODBYE") then
        emoteToken = "BYE";
      end
      if (emoteToken == "FOLLOWME") then
        emoteToken = "FOLLOW";
      end
      if (emoteToken == "ATTACKTARGET") then
        emoteToken = "ATTACKMYTARGET";
      end
      if (emoteToken == "CONGRATS") then
        emoteToken = "CONGRATULATE";
      end
      if (emoteToken == "PUZZLED") then
        emoteToken = "PUZZLE";
      end
      if (emoteToken == "QUESTION") then
        emoteToken = "TALKQ";
      end
      EmoteLDBObj.text = "/"..k
      DoEmote(emoteToken);
      HideTooltip()
    end
  end
end

-- Handle clicks within the tooltip
function HandlerFunc(_, name, button, ...)
  debugPrint("name = " .. name)
  -- If we clicked option for showing slash command
  if name == "showSlash" then
    self.db.profile.showSlashCommand = not self.db.profile.showSlashCommand
    EmoteLDB:BuildTooltip(nil, nil)
  -- If we clicked option to toggle minimap icon
  elseif name == "miniToggle" then
    debugPrint(format("before hide = %s", self.db.global.LibDBIcon.hide and "true" or "false"))
    self.db.global.LibDBIcon.hide = not self.db.global.LibDBIcon.hide
    debugPrint(format("after hide = %s", self.db.global.LibDBIcon.hide and "true" or "false"))
    if self.db.global.LibDBIcon.hide then
      icon:Hide("EmoteLDB")
    else
      icon:Show("EmoteLDB")
    end
    EmoteLDB:BuildTooltip(nil, nil)
  -- If we clicked an emote category
  else
    local hasTarget = UnitName("target")
    local genderCode = UnitSex("player")
    local genderHe = nil
    local genderHis = nil
    local genderhe = nil
    local genderhis = nil
    if (genderCode == 2) then -- male
      genderHe = "He"
      genderHis = "His"
      genderhe = "he"
      genderhis = "his"
    else -- female (we hope)
      genderHe = "She"
      genderHis = "Her"
      genderhe = "she"
      genderhis = "her"
    end
    
    -- Set up an empty emoteTable for sorting emotes by in-game effects
    emoteTable[0] = {}
    emoteTable[1] = {}
    emoteTable[2] = {}
    emoteTable[3] = {}
    
    -- Iterate EL_Emotes from EmoteData.lua
    for k, v in pairs(EL_Emotes) do
      for k2, v2 in pairs(v.types) do
        if (name == v2) then
          info = nil
          if (hasTarget) then
            info = EmoteLDB:GetOnDemandText(v,true)
            info = gsub(info,"<Target>",hasTarget)
          else
            info = EmoteLDB:GetOnDemandText(v,false)
          end

          info = gsub(info,"<He>",genderHe)
          info = gsub(info,"<His>",genderHis)
          info = gsub(info,"<he>",genderhe)
          info = gsub(info,"<his>",genderhis)

          for k3, v3 in pairs(v.custom) do
            if (v3 == 1) then
              slshCmd = L["Custom:  "]
            else
              slshCmd = "/"..k..":  "
            end
          end
          
          -- Insert emote information into table, using reaction type as key
          table.insert(emoteTable[v.react], { slshCmd, info, k })
        end
      end
    end
    local sort_func = function( a,b ) return a[3] < b[3] end
    table.sort( emoteTable[0], sort_func )
    table.sort( emoteTable[1], sort_func )
    table.sort( emoteTable[2], sort_func )
    table.sort( emoteTable[3], sort_func )
    EmoteLDB:BuildTooltip(keyArray,infoArray)
  end
end

-- Create the Data Object
EmoteLDBObj = ldb:NewDataObject("EmoteLDB", {
  type = "data source",
  icon = "Interface\\Icons\\Spell_Shadow_Charm",
  label = "EmoteLDB",
  text = L["Last Emote Used"],
})
  
-- Initialization
function EmoteLDB:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("EmoteLDBDB", defaults)
  icon:Register("EmoteLDB", EmoteLDBObj, self.db.global.LibDBIcon) -- Minimap
  if self.db.global.LibDBIcon.hide then
    icon:Hide("EmoteLDB")
  end
end

-- Hide tooltip when mousing out of data object
-- If the tooltip is being moused over, does nothing
function HideTooltip()
  if not ELDBTip then return end
  if MouseIsOver(ELDBTip) then return end
  debugPrint("In HideTooltip, destroying tooltip")
  if QTC:IsAcquired("EmoteLDBTooltip") then
    ELDBTip:Clear()
  end
  QTC:Release(ELDBTip)
  ELDBTip = nil
  info = nil
  infoArray = {}
  key = nil
  keyArray = {}
  emoteTable = {}
end

-- Handle mouseover of the data object
function EmoteLDBObj:OnEnter()
  debugPrint("Entered Object")
  ELDBTip = QTC:Acquire("EmoteLDBTooltip", 2, "LEFT", "LEFT", "LEFT")
  EmoteLDB.ELDBTip = ELDBTip
  ELDBTip:SmartAnchorTo(self)
  ELDBTip:SetAutoHideDelay(0.1, self)
  -- Since we should only be receiving a fresh category menu on mouseover, we clear all data
  ELDBTip:Clear()
  key = nil
  keyArray = {}
  info = nil
  infoArray = {}
  emoteTable = {}
  -- Call the method to build the tooltip
  EmoteLDB:BuildTooltip(key, info)
  -- Actually display the tooltip
  ELDBTip:Show()
end

-- Handle mousing out of the data object
function EmoteLDBObj:OnLeave()
  debugPrint("Leaving Object")
  HideTooltip()
end

-- Handle clicking of the object itself (re-using the same emote as last selected)
function EmoteLDBObj.OnClick(self, button)
  emoteToUse = gsub(EmoteLDBObj.text, "/", "")
  if button == "LeftButton" then
    if EmoteLDBObj.text == L["Last Emote Used"] then return end
    HandleModClick(_, emoteToUse)
  else
    debugPrint(button.." clicked")
  end
end

-- Build the tooltip!
function EmoteLDB:BuildTooltip(key, info)
  debugPrint("Inside BuildTooltip")
  ELDBTip:Clear()
  ELDBTip:SetScale(1)
  
  -- Make a larger header
  local headerFont = CreateFont("EmoteLDBHeaderFont")
  EmoteLDBHeaderFont:CopyFontObject(GameTooltipHeaderText)
  EmoteLDBHeaderFont:SetFont(EmoteLDBHeaderFont:GetFont(), 15)
  
  -- Create the tooltip background
  ELDBTip:SetBackdrop(tipcfg)
  ELDBTip:SetBackdropColor(0, 0, 0, 1)
  ELDBTip:SetBackdropBorderColor(255, 223, 0)

  -- Dump the header into the tooltip
  local y = ELDBTip:AddLine()
  ELDBTip:SetCell(y, 1, "EmoteLDB", EmoteLDBHeaderFont, "CENTER", 2)
  ELDBTip:AddLine(" ")

  -- local next for speed increase
  local next = next
  
  -- If we have an empty emoteTable, then display categories
  if next(emoteTable) == nil then
    -- Display category menu
    for k, v in ipairs(EL_Types) do
      local elType = k
      local label = v
      local y = ELDBTip:AddLine()
    
      ELDBTip:SetCell(y, 1, v, "CENTER", 2)
      ELDBTip:SetCellScript(y, 1, "OnMouseDown", HandlerFunc, k)	
    end
    
    -- Count total emotes if debugging
    -- This may not be working, but not too worried since it's a debug item
    if (addon.debug) then
      local emoteCount = 0
      for k, v in pairs(EL_Emotes) do
        if ( v.custom[0] == "0" ) then
          emoteCount = emoteCount + 1
        end
      end
    end
    
    -- Display toggle option for slash commands
    ELDBTip:AddLine(" ")
    local y = ELDBTip:AddLine()
    ELDBTip:SetCell(y, 1, L["Toggle the display of slash commands."], "CENTER", 2)
    ELDBTip:SetCellScript(y, 1, "OnMouseDown", HandlerFunc, "showSlash")
    local y = ELDBTip:AddLine()
    ELDBTip:SetCell(y, 1, L["Currently: "], "RIGHT")
    ELDBTip:SetCell(y, 2, format("%s", self.db.profile.showSlashCommand and "|c0000FF00Shown" or "|c00FF0000Hidden"), "LEFT")
    ELDBTip:AddLine(" ")
    
    -- Display toggle option for minimap icon
    local y = ELDBTip:AddLine()
    ELDBTip:SetCell(y, 1, L["Toggle the display of the minimap button"], "CENTER", 2)
    ELDBTip:SetCellScript(y, 1, "OnMouseDown", HandlerFunc, "miniToggle")
    local y = ELDBTip:AddLine()
    ELDBTip:SetCell(y, 1, L["Currently: "], "RIGHT")
    ELDBTip:SetCell(y, 2, format("%s", self.db.global.LibDBIcon.hide and "|c00FF0000Hidden" or "|c0000FF00Shown"), "LEFT")
    ELDBTip:AddLine(" ")
    
    -- Display EmoteLDB version
    local y = ELDBTip:AddLine()
    ELDBTip:SetCell(y, 1, L["EmoteLDB version: "], "RIGHT")
    ELDBTip:SetCell(y, 2, format("%s", "|c00FF00FF" .. emoteVer), "LEFT")
    
    -- Display emote count from earlier, if debugging
    if (addon.debug) then
      ELDBTip:AddLine(" ")
      local y = ELDBTip:AddLine()
      ELDBTip:SetCell(y, 1, "Total Emotes: ", "RIGHT")
      ELDBTip:SetCell(y, 2, format("%d", emoteCount), "LEFT")
    end
  -- If we have emoteTable data
  else
        -- Go back to category list
        local y = ELDBTip:AddLine()
        ELDBTip:SetCell(y, 1, "Return to Category List", "CENTER")
        ELDBTip:SetCellScript(y, 1, "OnMouseDown", HandleModClick, "catList")
        ELDBTip:AddLine(" ")
        
    local emoteLineText
    local emoteCommand
    local emoteCount = #emoteTable[0] + #emoteTable[1] + #emoteTable[2] + #emoteTable[3]
    -- Reverse iterate through emoteTable keys, which are equivalent to the emote's reaction type
    -- This sorts emotes as AV, then Vocal, then Action, then chat only
    for i=3,0,-1 do
      debugPrint("i = "..i)
      for k, v in ipairs(emoteTable[i]) do
        debugPrint("k = "..k)
        debugPrint("v[1] = "..v[1])
        debugPrint("v[2] = "..v[2])
        debugPrint("v[3] = "..v[3])
        if (self.db.profile.showSlashCommand) then
          emoteLineText = v[1]..v[2]
        else
          emoteLineText = v[2]
        end
        emoteCommand = v[3]
        local y = ELDBTip:AddLine()
        ELDBTip:SetCell(y, 1, emoteLineText, "LEFT")
        ELDBTip:SetCellScript(y, 1, "OnMouseDown", HandleModClick, emoteCommand)
      end
    end
        debugPrint("emoteCount = "..emoteCount)
    
    -- If we have less than the count of emotes of the largest category in this category, add some filler lines
    -- This stops the tooltip from shrinking, forcing the user's mouse off of the tooltip, and ultimately closing the tooltip
        -- Current Largest Category: Reactions - 30 emotes
    if emoteCount < 30 then
      local fillerLines = 30 - emoteCount
      for i=1,fillerLines do
        ELDBTip:AddLine(" ")
      end
    end
  end
end

-- Create slash commands 
SLASH_EMOTELDB1, SLASH_EMOTELDB2 = '/emoteldb', '/eldb'
function SlashCmdList.EMOTELDB(msg, editbox)
  if msg == nil or msg == '' then
    print("EmoteLDB Command List (/emoteldb or /eldb):")
    print("/emoteldb toggleicon: Toggle the minimap icon")
    print("/emoteldb showslash: Toggle the showing of emote slash commands")
  elseif msg == 'toggleicon' then
    local onOff = "ERROR"
    if self.db.global.LibDBIcon.hide == false then
      onOff = "|c00FF0000HIDDEN"
    else
      onOff = "|c0000FF00VISIBLE"
    end
    self.db.global.LibDBIcon.hide = not self.db.global.LibDBIcon.hide
    print("EmoteLDB: Making the minimap icon "..onOff)
    if self.db.global.LibDBIcon.hide then
      icon:Hide("EmoteLDB")
    else
      icon:Show("EmoteLDB")
    end
  elseif msg == 'showslash' then
    local onOff = "ERROR"
    if self.db.profile.showSlashCommand == false then 
      onOff = "|c0000FF00ON"
    else
      onOff = "|c00FF0000OFF"
    end
    print("EmoteLDB: Toggled visibility of slash commands "..onOff)
    self.db.profile.showSlashCommand = not self.db.profile.showSlashCommand
  else
    print("Invalid Command!")
    print("EmoteLDB Command List (/emoteldb or /eldb):")
    print("/emoteldb toggleicon: Toggle the minimap icon")
    print("/emoteldb showslash: Toggle the showing of emote slash commands")
  end
end

-- Function for easy debugging
function debugPrint(text)
  if (addon.debug) then
    DEFAULT_CHAT_FRAME:AddMessage(text)
  end
end
