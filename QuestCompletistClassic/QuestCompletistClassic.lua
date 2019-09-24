-- Author      : Troy L. Marshall
-- Create Date : 9/12/2019 10:01:11 AM
-- Since       : 1.0.0

QuestCompletistClassic_Settings = {
	MinimapPos = 10 -- default position of the minimap icon in degrees
}

function QuestCompletistClassic_MinimapButton_OnEnter(self)
	GameTooltip:SetOwner(self or UIParent, "ANCHOR_LEFT")
	QuestCompletistClassic_MinimapButton_Details(GameTooltip)
end

function QuestCompletistClassic_MinimapButton_Details(tooltip)
	-- TODO: localize the text
	tooltip:SetText("Quest Completist Classic")
end

function QuestCompletistClassic_MinimapButton_Reposition()
	QuestCompletistClassic_MinimapButton:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		52 - (80 * cos(QuestCompletistClassic_Settings.MinimapPos)),
		(80 * sin(QuestCompletistClassic_Settings.MinimapPos)) - 52
	)
end

function QuestCompletistClassic_MinimapButton_OnClick()
	qcToggleQuestCompletistUI(self)
end
