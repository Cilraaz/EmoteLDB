-- Custom Tooltip System for EmoteLDB
local addonName, EmoteLDB = ...

--------------------------------------------------------------------------------
-- Tooltip Frame Creation
--------------------------------------------------------------------------------
local EmoteTooltip = CreateFrame("Frame", "EmoteLDBTooltip", UIParent, "BackdropTemplate")
EmoteTooltip:SetSize(300, 400)
EmoteTooltip:SetFrameStrata("TOOLTIP")
EmoteTooltip:SetClampedToScreen(true)
EmoteTooltip:EnableMouse(true)
EmoteTooltip:SetMovable(false)
EmoteTooltip:Hide()

-- Backdrop
EmoteTooltip:SetBackdrop({
	bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
	tile = true,
	tileEdge = true,
	tileSize = 16,
	edgeSize = 16,
	insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
EmoteTooltip:SetBackdropColor(0, 0, 0, 0.95)
EmoteTooltip:SetBackdropBorderColor(1, 0.82, 0, 1)

-- Close on escape
EmoteTooltip:SetScript("OnHide", function(self)
	self:ClearLines()
end)

-- Auto-hide when mouse leaves
EmoteTooltip:SetScript("OnUpdate", function(self, elapsed)
	if not self:IsMouseOver() and not self.anchor:IsMouseOver() then
		self.hideTimer = (self.hideTimer or 0) + elapsed
		if self.hideTimer > 0.5 then
			self:Hide()
			self.hideTimer = 0
		end
	else
		self.hideTimer = 0
	end
end)

--------------------------------------------------------------------------------
-- Line Management
--------------------------------------------------------------------------------
EmoteTooltip.lines = {}
EmoteTooltip.linePool = {}
EmoteTooltip.lineHeight = 20
EmoteTooltip.padding = 10

function EmoteTooltip:ClearLines()
	for _, line in ipairs(self.lines) do
		line:Hide()
		line:ClearAllPoints()
		line.onClick = nil
		table.insert(self.linePool, line)
	end
	wipe(self.lines)
end

function EmoteTooltip:GetLine()
	local line = table.remove(self.linePool)
	
	if not line then
		line = CreateFrame("Button", nil, self)
		line:SetHeight(self.lineHeight)
		
		line.text = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		line.text:SetPoint("LEFT", line, "LEFT", 5, 0)
		line.text:SetPoint("RIGHT", line, "RIGHT", -5, 0)
		line.text:SetJustifyH("LEFT")
		line.text:SetWordWrap(false)
		
		-- Hover effect
		line:SetScript("OnEnter", function(self)
			if self.onClick then
				self.text:SetTextColor(1, 1, 0.5)
			end
		end)
		
		line:SetScript("OnLeave", function(self)
			self.text:SetTextColor(1, 1, 1)
		end)
		
		line:SetScript("OnClick", function(self, button)
			if self.onClick and button == "LeftButton" then
				self.onClick()
			end
		end)
	end
	
	line:SetWidth(self:GetWidth() - (self.padding * 2))
	line:Show()
	table.insert(self.lines, line)
	
	return line
end

function EmoteTooltip:AddLine(text, align, color, onClick)
	local line = self:GetLine()
	
	line.text:SetText(text or " ")
	line.text:SetJustifyH(align or "LEFT")
	
	if color then
		line.text:SetTextColor(color.r or 1, color.g or 1, color.b or 1)
	else
		line.text:SetTextColor(1, 1, 1)
	end
	
	line.onClick = onClick
	
	if onClick then
		line:EnableMouse(true)
		line:SetScript("OnEnter", function(self)
			self.text:SetTextColor(1, 1, 0.5)
		end)
		line:SetScript("OnLeave", function(self)
			if color then
				self.text:SetTextColor(color.r, color.g, color.b)
			else
				self.text:SetTextColor(1, 1, 1)
			end
		end)
	else
		line:EnableMouse(false)
	end
	
	return line
end

function EmoteTooltip:AddHeader(text)
	local line = self:GetLine()
	line.text:SetFontObject(GameFontNormalLarge)
	line.text:SetText(text)
	line.text:SetJustifyH("CENTER")
	line.text:SetTextColor(1, 0.82, 0)
	line:EnableMouse(false)
	return line
end

function EmoteTooltip:AddSpacer()
	local line = self:GetLine()
	line.text:SetText(" ")
	line:EnableMouse(false)
	return line
end

function EmoteTooltip:LayoutLines()
	local yOffset = -self.padding
	
	for i, line in ipairs(self.lines) do
		line:ClearAllPoints()
		line:SetPoint("TOPLEFT", self, "TOPLEFT", self.padding, yOffset)
		line:SetPoint("TOPRIGHT", self, "TOPRIGHT", -self.padding, yOffset)
		
		-- Check if text needs more height
		local textHeight = line.text:GetStringHeight()
		if textHeight > self.lineHeight then
			line:SetHeight(textHeight + 4)
		else
			line:SetHeight(self.lineHeight)
		end
		
		yOffset = yOffset - line:GetHeight()
	end
	
	local totalHeight = math.abs(yOffset) + self.padding
	self:SetHeight(totalHeight)
end

function EmoteTooltip:Show()
	self:LayoutLines()
	getmetatable(self).__index.Show(self)
end

function EmoteTooltip:SmartAnchorTo(anchor)
	self.anchor = anchor
	self:ClearAllPoints()
	
	local scale = UIParent:GetEffectiveScale()
	local x, y = GetCursorPosition()
	x = x / scale
	y = y / scale
	
	local screenWidth = UIParent:GetWidth()
	local screenHeight = UIParent:GetHeight()
	
	-- Default: show below and to the right of cursor
	local point = "TOPLEFT"
	local relPoint = "BOTTOMLEFT"
	local xOffset = 0
	local yOffset = -5
	
	-- If too close to right edge, show to the left
	if x + self:GetWidth() > screenWidth then
		point = "TOPRIGHT"
		relPoint = "BOTTOMRIGHT"
	end
	
	-- If too close to bottom edge, show above
	if y - self:GetHeight() < 0 then
		if point == "TOPLEFT" then
			point = "BOTTOMLEFT"
			relPoint = "TOPLEFT"
		else
			point = "BOTTOMRIGHT"
			relPoint = "TOPRIGHT"
		end
		yOffset = 5
	end
	
	self:SetPoint(point, anchor, relPoint, xOffset, yOffset)
end

--------------------------------------------------------------------------------
-- Export to EmoteLDB
--------------------------------------------------------------------------------
EmoteLDB.Tooltip = EmoteTooltip

return EmoteTooltip