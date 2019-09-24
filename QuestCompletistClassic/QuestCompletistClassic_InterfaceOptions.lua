-- Author      : Troy L. Marshall
-- Create Date : 9/18/2019 11:15:38 AM
-- Since       : 1.0.0

function QuestCompletistClassic_OptionsFrame_OnLoad(panel)
	-- TODO: localize the text
	panel.name = "Quest Completist Classic"

	panel.okay = function (self)
		QuestCompletistClassic_OptionsFrame_Close()
	end

	panel.cancel = function (self)
		QuestCompletistClassic_Options_Frame_CancelOrLoad()
	end

	InterfaceOptions_AddCategory(panel);
end
