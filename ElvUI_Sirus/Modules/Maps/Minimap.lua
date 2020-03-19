local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local M = E:GetModule("Minimap")

--Lua functions
--WoW API / Variables

local menuList = {
	{text = CHARACTER_BUTTON,
	func = function() ToggleCharacter("PaperDollFrame") end},
	{text = SPELLBOOK_ABILITIES_BUTTON,
	func = function() ToggleFrame(SpellBookFrame) end},
	{text = TALENTS_BUTTON,
	func = ToggleTalentFrame},
	{text = ACHIEVEMENT_BUTTON,
	func = ToggleAchievementFrame},
	{text = QUESTLOG_BUTTON,
	func = function() ToggleFrame(QuestLogFrame) end},
	{text = SOCIAL_BUTTON,
	func = function() ToggleFriendsFrame(1) end},
	{text = L["Calendar"],
	func = function() GameTimeFrame:Click() end},
	{text = L["Farm Mode"],
	func = FarmMode},
	{text = BATTLEFIELD_MINIMAP,
	func = ToggleBattlefieldMinimap},
	{text = TIMEMANAGER_TITLE,
	func = ToggleTimeManager},
	{text = PLAYER_V_PLAYER,
	func = TogglePVPUIFrame},
	{text = LFG_TITLE,
	func = function() ToggleFrame(LFDParentFrame) end},
	{text = LOOKING_FOR_RAID,
	func = function() ToggleFrame(LFRParentFrame) end},
	{text = MAINMENU_BUTTON,
	func = function()
		if not GameMenuFrame:IsShown() then
			if VideoOptionsFrame:IsShown() then
				VideoOptionsFrameCancel:Click()
			elseif AudioOptionsFrame:IsShown() then
				AudioOptionsFrameCancel:Click()
			elseif InterfaceOptionsFrame:IsShown() then
				InterfaceOptionsFrameCancel:Click()
			end

			CloseMenus()
			CloseAllWindows()
			PlaySound("igMainMenuOpen")
			ShowUIPanel(GameMenuFrame)
		else
			PlaySound("igMainMenuQuit")
			HideUIPanel(GameMenuFrame)
			MainMenuMicroButton_SetNormal()
		end
	end},
	{text = HELP_BUTTON,
	func = ToggleHelpFrame}
}

function M:Minimap_OnMouseUp(btn)
	local position = self:GetPoint()
	if btn == "MiddleButton" or (btn == "RightButton" and IsShiftKeyDown()) then
		if position:match("LEFT") then
			EasyMenu(menuList, MinimapRightClickMenu, "cursor", 0, 0, "MENU", 2)
		else
			EasyMenu(menuList, MinimapRightClickMenu, "cursor", -160, 0, "MENU", 2)
		end
	elseif btn == "RightButton" then
		ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, "cursor")
	else
		Minimap_OnClick(self)
	end
end

local isResetting
local function ResetZoom()
	Minimap:SetZoom(0)
	isResetting = nil
end
local function SetupZoomReset(self, zoomLevel)
	if not isResetting and zoomLevel > 0 and E.db.general.minimap.resetZoom.enable then
		isResetting = true
		E:Delay(E.db.general.minimap.resetZoom.time, ResetZoom)
	end
end

local function MinimapPostDrag()
	MinimapCluster:ClearAllPoints()
	MinimapCluster:SetAllPoints(Minimap)
	MinimapBackdrop:ClearAllPoints()
	MinimapBackdrop:SetAllPoints(Minimap)
end

function M:Initialize()
	menuFrame:SetTemplate("Transparent", true)

	self:UpdateSettings()

	if not E.private.general.minimap.enable then
		Minimap:SetMaskTexture("Textures\\MinimapMask")
		return
	end

	--Support for other mods
	function GetMinimapShape()
		return "SQUARE"
	end

	local mmholder = CreateFrame("Frame", "MMHolder", Minimap)
	mmholder:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", -3, -3)
	mmholder:Width((Minimap:GetWidth() + 29) + E.RBRWidth)
	mmholder:Height(Minimap:GetHeight() + 53)
	Minimap:ClearAllPoints()
	if E.db.general.reminder.position == "LEFT" then
		Minimap:Point("TOPRIGHT", mmholder, "TOPRIGHT", -E.Border, -E.Border)
	else
		Minimap:Point("TOPLEFT", mmholder, "TOPLEFT", E.Border, -E.Border)
	end
	Minimap:SetMaskTexture("Interface\\ChatFrame\\ChatFrameBackground")
	Minimap:CreateBackdrop()
	Minimap:SetFrameLevel(Minimap:GetFrameLevel() + 2)
	Minimap:HookScript("OnEnter", function(mm)
		if E.db.general.minimap.locationText ~= "MOUSEOVER" or not E.private.general.minimap.enable then return end
		mm.location:Show()
	end)

	Minimap:HookScript("OnLeave", function(self)
		if E.db.general.minimap.locationText ~= "MOUSEOVER" or not E.private.general.minimap.enable then return end
		self.location:Hide()
	end)

	Minimap.location = Minimap:CreateFontString(nil, "OVERLAY")
	Minimap.location:FontTemplate(nil, nil, "OUTLINE")
	Minimap.location:Point("TOP", Minimap, "TOP", 0, -2)
	Minimap.location:SetJustifyH("CENTER")
	Minimap.location:SetJustifyV("MIDDLE")
	if E.db.general.minimap.locationText ~= "SHOW" or not E.private.general.minimap.enable then
		Minimap.location:Hide()
	end

	MinimapBorder:Hide()
	MinimapBorderTop:Hide()
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	MiniMapVoiceChatFrame:Hide()
	MinimapNorthTag:Kill()
	MinimapZoneTextButton:Hide()
	MiniMapTracking:Kill()
	MiniMapMailBorder:Hide()
	MiniMapMailIcon:SetTexture(E.Media.Textures.Mail)

	MiniMapLFGFrameBorder:Hide()

	MiniMapWorldMapButton:Hide()

	MiniMapInstanceDifficulty:SetParent(Minimap)

	if TimeManagerClockButton then
		TimeManagerClockButton:Kill()
	else
		self:RegisterEvent("ADDON_LOADED")
	end

	E:CreateMover(MMHolder, "MinimapMover", L["Minimap"], nil, nil, MinimapPostDrag, nil, nil, "maps,minimap")

	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", M.Minimap_OnMouseWheel)
	Minimap:SetScript("OnMouseUp", M.Minimap_OnMouseUp)

	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "Update_ZoneText")
	self:RegisterEvent("ZONE_CHANGED", "Update_ZoneText")
	self:RegisterEvent("ZONE_CHANGED_INDOORS", "Update_ZoneText")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "Update_ZoneText")

	hooksecurefunc(Minimap, "SetZoom", SetupZoomReset)

	self:CreateFarmModeMap()

	self.Initialized = true
end

Minimap:SetScript("OnMouseUp", M.Minimap_OnMouseUp)
if FarmModeMap then
	FarmModeMap:SetScript("OnMouseUp", M.Minimap_OnMouseUp)
end