local function OnSavegameLoaded()
    -- Song DLC
    if Osi.QRY_CharacterHasSongDLC(Osi.DB_Players:Get(nil)[1][1]) then
        for _, instrument in ipairs({ "Drum", "Flute", "Lute", "Lyre", "Violin" }) do
            local stat = Ext.Stats.Get("Shout_Bard_Perform_" .. instrument .. "_Group")
            local dlc_spells = string.format(
                ";Shout_Bard_Perform_DOS2_1_%s_Group;Shout_Bard_Perform_DOS2_2_%s_Group;Shout_Bard_Perform_DOS2_3_%s_Group",
                instrument, instrument, instrument)
            stat.ContainerSpells = stat.ContainerSpells .. dlc_spells
            stat:Sync()
        end
    end
end
Ext.Osiris.RegisterListener("SavegameLoaded", 0, "after", OnSavegameLoaded)
