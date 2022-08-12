local CLASS_COLOR_BY_NAME = {
	["Druid"] = "FF7C0A",
	["Warlock"] = "8788EE",
	["Warrior"] = "C69B6D",
	["Mage"] = "3FC7EB",
	["Hunter"] = "AAD372",
	["Priest"] = "FFFFFF",
	["Shaman"] = "0070DD",
	["Paladin"] = "F48CBA",
	["Rogue"] = "FFF468",
	["General"] = "FFFFFF",
}
local AceGUI = LibStub("AceGUI-3.0")
local ICON_SIZE = 39
local TabName = "DummyHCTab"
local TabID = CharacterFrame.numTabs + 1
local Tab = CreateFrame("Button", "$parentTab" .. TabID, CharacterFrame, "CharacterFrameTabButtonTemplate", TabID)
PanelTemplates_SetNumTabs(CharacterFrame, TabID)
Tab:SetPoint("LEFT", "$parentTab" .. (TabID - 1), "RIGHT", -50000, 0) -- Offscreen; we need to have this tab as a dummy
Tab:SetText(TabName)
Tab:Show()
_G["CharacterFrameTab3Text"]:SetText("Rep.")

local Panel = CreateFrame("Frame", nil, CharacterFrame)
Panel:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", -50, -200)
Panel:SetPoint("BOTTOMRIGHT", CharacterFrame, "BOTTOMRIGHT", -200, 0)
local f = CreateFrame("Frame", "YourFrameName", Panel)
f:SetSize(400, 400)
f:SetPoint("CENTER")
f:Hide()

local t = f:CreateTexture(nil, "BACKGROUND")
t:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopLeft")
t:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 2, -1)
t:SetWidth(256)
t:SetHeight(256)

local tr = f:CreateTexture(nil, "BACKGROUND")
tr:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopRight")
tr:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 258, -1)
tr:SetWidth(128)
tr:SetHeight(256)

local bl = f:CreateTexture(nil, "BACKGROUND")
bl:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomLeft")
bl:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 2, -257)
bl:SetWidth(256)
bl:SetHeight(256)

local br = f:CreateTexture(nil, "BACKGROUND")
br:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomRight")
br:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 258, -257)
br:SetWidth(128)
br:SetHeight(256)

Panel:SetPoint("CENTER", 0, 0)
Panel:Hide()

local f2 = AceGUI:Create("HardcoreFrameEmpty")
f2:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 8, -60)
f2:SetWidth(360)
f2:SetHeight(350)
f2:Hide()

hooksecurefunc(CharacterFrame, "Hide", function(self, button)
	HideCharacterHC()
end)

local TabGUI = CreateFrame("Button", "nwtab" .. TabID, CharacterFrame)
_G["HardcoreCharacterTab"] = TabGUI
TabGUI:SetPoint("LEFT", "CharacterFrameTab5", "RIGHT", -16, 0)
TabGUI.text = TabGUI:CreateFontString(nil, "ARTWORK")
TabGUI.text:SetFontObject(GameFontNormalSmall)
TabGUI.text:SetPoint("CENTER", 0, 1)
TabGUI.text:SetText("HC")
local tab_gui_left = TabGUI:CreateTexture(nil, "TOOLTIP")
tab_gui_left:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
tab_gui_left:SetSize(25, 32)
tab_gui_left:SetRotation(3.14)
tab_gui_left:SetTexCoord(0.8, 1.0, 1.0, 0.0)
tab_gui_left:SetPoint("TOPLEFT", 0, -5)
local tab_gui_middle = TabGUI:CreateTexture(nil, "TOOLTIP")
tab_gui_middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
tab_gui_middle:SetSize(25, 32)
tab_gui_middle:SetRotation(3.14)
tab_gui_middle:SetTexCoord(0.8, 0.20, 1.0, 0.0)
tab_gui_middle:SetPoint("TOP", 0, -5)
local tab_gui_right = TabGUI:CreateTexture(nil, "TOOLTIP")
tab_gui_right:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
tab_gui_right:SetSize(25, 32)
tab_gui_right:SetRotation(3.14)
tab_gui_right:SetTexCoord(0.0, 0.20, 1.0, 0.0)
tab_gui_right:SetPoint("TOPRIGHT", 0, -5)
tab_gui_left:Hide()
tab_gui_middle:Hide()
tab_gui_right:Hide()

local inactive_tab_gui_left = TabGUI:CreateTexture(nil, "TOOLTIP")
inactive_tab_gui_left:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InactiveTab")
inactive_tab_gui_left:SetSize(25, 32)
inactive_tab_gui_left:SetRotation(3.14)
inactive_tab_gui_left:SetTexCoord(0.8, 1.0, 1.0, 0.0)
inactive_tab_gui_left:SetPoint("TOPLEFT", 0, -9)
local inactive_tab_gui_middle = TabGUI:CreateTexture(nil, "TOOLTIP")
inactive_tab_gui_middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InactiveTab")
inactive_tab_gui_middle:SetSize(25, 32)
inactive_tab_gui_middle:SetRotation(3.14)
inactive_tab_gui_middle:SetTexCoord(0.8, 0.20, 1.0, 0.0)
inactive_tab_gui_middle:SetPoint("TOP", 0, -9)
local inactive_tab_gui_right = TabGUI:CreateTexture(nil, "TOOLTIP")
inactive_tab_gui_right:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InactiveTab")
inactive_tab_gui_right:SetSize(25, 32)
inactive_tab_gui_right:SetRotation(3.14)
inactive_tab_gui_right:SetTexCoord(0.0, 0.20, 1.0, 0.0)
inactive_tab_gui_right:SetPoint("TOPRIGHT", 0, -9)

local tab_higlight = TabGUI:CreateTexture(nil, "TOOLTIP")
tab_higlight:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-RealHighlight")
tab_higlight:SetSize(46, 43)
tab_higlight:SetRotation(3.14)
tab_higlight:SetTexCoord(1.0, 0.0, 1.0, 0.0)
tab_higlight:SetPoint("TOP", 0, 0)
TabGUI:SetHighlightTexture(tab_higlight, "ADD")

TabGUI:SetScript("OnClick", function(self, arg1)
	print(arg1)
end)

TabGUI:SetWidth(60)
TabGUI:SetHeight(50)
TabGUI:Show()

hooksecurefunc(CharacterFrame, "Show", function(self, button)
	TabGUI:Show()
end)

hooksecurefunc(CharacterFrame, "Hide", function(self, button)
	TabGUI:Hide()
end)

function UpdateCharacterHC(_hardcore_character, _player_name, _version, frame_to_update, _player_class, _player_level)
	frame_to_update:ReleaseChildren()
	if _hardcore_character == nil then
		return
	end

	local title = AceGUI:Create("HardcoreClassTitleLabel")
	title:SetRelativeWidth(1.0)
	title:SetHeight(60)
	title:SetText("Classic Hardcore")
	title:SetFont("Interface\\Addons\\Hardcore\\Media\\BreatheFire.ttf", 22)
	frame_to_update:AddChild(title)

	local character_meta_data_container = AceGUI:Create("SimpleGroup")
	character_meta_data_container:SetRelativeWidth(1.0)
	character_meta_data_container:SetHeight(200)
	character_meta_data_container:SetLayout("List")
	frame_to_update:AddChild(character_meta_data_container)

	local character_name = AceGUI:Create("HardcoreClassTitleLabel")
	character_name:SetRelativeWidth(1.0)
	character_name:SetHeight(60)
	character_name:SetText("\n" .. _player_name .. "\n")
	character_name:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
	character_meta_data_container:AddChild(character_name)

	local level_title_text = AceGUI:Create("HardcoreClassTitleLabel")
	level_title_text:SetRelativeWidth(1.0)
	level_title_text:SetHeight(60)
	local level_text = _player_level or "?"
	local class_text
	if _player_class ~= nil then
	  class_text = "|c00" .. CLASS_COLOR_BY_NAME[_player_class] .. _player_class .. "|r"
	else
	  class_text = "?"
	end
	level_title_text:SetText("Level " .. level_text .. " " .. class_text)
	level_title_text:SetFont("Fonts\\FRIZQT__.TTF", 10)
	character_meta_data_container:AddChild(level_title_text)

	local team_title = AceGUI:Create("HardcoreClassTitleLabel")
	team_title:SetRelativeWidth(1.0)
	team_title:SetHeight(60)
	local mode_type_str = "unknown"
	local teammate_1 = "missing_team"
	local teammate_2 = "unknown"

	if _hardcore_character.team ~= nil then
		teammate_1 = _hardcore_character.team[1] or "unknown"
		teammate_2 = _hardcore_character.team[2] or "unknown"
	end
	if _hardcore_character.party_mode ~= nil then
		if _hardcore_character.party_mode == "Solo" then
			mode_type_str = "Solo"
		elseif _hardcore_character.party_mode == "Duo" then
			mode_type_str = "Duo with " .. teammate_1
		elseif _hardcore_character.party_mode == "Trio" then
			mode_type_str = "Trio with " .. teammate_1 .. " and " .. teammate_2
		else
			mode_type_str = "|c00FF0000" .. _hardcore_character.party_mode .. "|r"
		end
	end
	team_title:SetText(mode_type_str)
	team_title:SetFont("Fonts\\FRIZQT__.TTF", 10)
	character_meta_data_container:AddChild(team_title)

	local creation_date_label = AceGUI:Create("HardcoreClassTitleLabel")
	creation_date_label:SetRelativeWidth(1.0)
	creation_date_label:SetHeight(60)
	local start_date = "?"
	if _hardcore_character.first_recorded ~= nil and _hardcore_character.first_recorded ~= -1 then
		start_date = date("%m/%d/%y", _hardcore_character.first_recorded)
		if start_date == nil then
		  start_date = "?"
		end
	end
	creation_date_label:SetText("Started on " .. start_date)
	creation_date_label:SetFont("Fonts\\FRIZQT__.TTF", 10)
	character_meta_data_container:AddChild(creation_date_label)

	local version_name = AceGUI:Create("HardcoreClassTitleLabel")
	version_name:SetRelativeWidth(1.0)
	version_name:SetHeight(60)
	local version = _version
	version_name:SetText("Addon version: " .. version)
	version_name:SetFont("Fonts\\FRIZQT__.TTF", 10)
	character_meta_data_container:AddChild(version_name)


	local v_buffer = AceGUI:Create("Label")
	v_buffer:SetRelativeWidth(1.0)
	v_buffer:SetHeight(100)
	v_buffer:SetText("\n\n\n\n\n")
	frame_to_update:AddChild(v_buffer)

	local achievements_container = AceGUI:Create("SimpleGroup")
	achievements_container:SetRelativeWidth(1.0)
	achievements_container:SetHeight(50)
	achievements_container:SetLayout("Flow")
	frame_to_update:AddChild(achievements_container)

	local achievements_title = AceGUI:Create("HardcoreClassTitleLabel")
	achievements_title:SetRelativeWidth(1.0)
	achievements_title:SetHeight(40)
	achievements_title:SetText("Active Achievements")
	achievements_title:SetFont("Interface\\Addons\\Hardcore\\Media\\BreatheFire.ttf", 16)
	achievements_container:AddChild(achievements_title)
	if _hardcore_character.achievements ~= nil then
		for i, v in ipairs(_hardcore_character.achievements) do
			if _G.achievements[v] ~= nil then
				local achievement_icon = AceGUI:Create("Icon")
				achievement_icon:SetWidth(ICON_SIZE)
				achievement_icon:SetHeight(ICON_SIZE)
				achievement_icon:SetImage(_G.achievements[v].icon_path)
				achievement_icon:SetImageSize(ICON_SIZE, ICON_SIZE)
				achievement_icon.image:SetVertexColor(1, 1, 1)
				achievement_icon:SetCallback("OnEnter", function(widget)
					GameTooltip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
					GameTooltip:AddLine(_G.achievements[v].title)
					GameTooltip:AddLine(_G.achievements[v].description, 1, 1, 1, true)
					GameTooltip:Show()
				end)
				achievement_icon:SetCallback("OnLeave", function(widget)
					GameTooltip:Hide()
				end)
				achievements_container:AddChild(achievement_icon)
			end
		end
	end
	if _hardcore_character.party_mode ~= nil then
		if _hardcore_character.party_mode == "Duo" or _hardcore_character.party_mode == "Trio" then
			local partner_up_achievement = _G.extra_rules.Duo
			local achievement_icon = AceGUI:Create("Icon")
			achievement_icon:SetWidth(ICON_SIZE)
			achievement_icon:SetHeight(ICON_SIZE)
			achievement_icon:SetImage(partner_up_achievement.icon_path)
			achievement_icon:SetImageSize(ICON_SIZE, ICON_SIZE)
			achievement_icon.image:SetVertexColor(1, 1, 1)
			achievement_icon:SetCallback("OnEnter", function(widget)
			GameTooltip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
			GameTooltip:AddLine("Partner Up!")
			GameTooltip:AddLine("Complete the Hardcore challenge in a group of two. Read the rules, if you want to know more about Hardcore Duos. For all Achievements within the General category, your duo is considered one character (i.e. the achievement’s rules apply to both of you as if you were one character).", 1, 1, 1, true)
			GameTooltip:Show()
			end)
			achievement_icon:SetCallback("OnLeave", function(widget)
				GameTooltip:Hide()
			end)
			achievements_container:AddChild(achievement_icon)
		end
	end
end

function ShowCharacterHC(_hardcore_character)
	tab_gui_left:Show()
	tab_gui_middle:Show()
	tab_gui_right:Show()
	inactive_tab_gui_left:Hide()
	inactive_tab_gui_middle:Hide()
	inactive_tab_gui_right:Hide()
	TabGUI.text:SetFontObject(GameFontHighlightSmall)
	TabGUI.text:SetPoint("CENTER", 0, 3)
	TabGUI:SetFrameStrata("HIGH")

	f2:ReleaseChildren()

	local class, _, _ = UnitClass("player")
	UpdateCharacterHC(_hardcore_character, UnitName("player"), GetAddOnMetadata("Hardcore", "Version"), f2, class, UnitLevel("player"))
	Panel:Show()
	f:Show()
	f2:Show()
end

function HideCharacterHC()
	tab_gui_left:Hide()
	tab_gui_middle:Hide()
	tab_gui_right:Hide()
	inactive_tab_gui_left:Show()
	inactive_tab_gui_middle:Show()
	inactive_tab_gui_right:Show()
	TabGUI.text:SetFontObject(GameFontNormalSmall)
	TabGUI.text:SetPoint("CENTER", 0, 1)
	TabGUI:SetFrameStrata("HIGH")
	Panel:Hide()
	f:Hide()
	f2:Hide()
	f2:ReleaseChildren()
end
