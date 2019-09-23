-- Author      : Troy L. Marshall
-- Create Date : 9/12/2019 10:01:11 AM
-- Since       : 1.0.0

QuestCompletistClassic_Settings = {
	MinimapPos = 10 -- default position of the minimap icon in degrees
}

function QuestCompletistClassic_MinimapButton_OnEnter(self)
	if (self.dragging) then
		return
	end
	GameTooltip:SetOwner(self or UIParent, "ANCHOR_LEFT")
	QuestCompletistClassic_MinimapButton_Details(GameTooltip)
end

function QuestCompletistClassic_MinimapButton_Details(tooltip)
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

function QuestCompletistClassic_MinimapButton_DraggingFrame_OnUpdate()
	DEFAULT_CHAT_FRAME:AddMessage("dragging frame")
	local xpos, ypos = GetCursorPosition()
	local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()

	xpos = xmin - xpos / UIParent.GetScale() + 70 -- get coordinates as differences from the center of the minimap
	ypos = ypos / UIParent:GetScale() - ymin - 70

	QuestCompletistClassic_Settings.MinimapPos = math.deg(math.atan2(ypos, xpos))
	QuestCompletistClassic_MinimapButton_Reposition()
end

function QuestCompletistClassic_MinimapButton_OnClick()
	qcToggleQuestCompletistUI(self)
end
