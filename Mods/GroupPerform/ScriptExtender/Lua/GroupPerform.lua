----------------------------------------
-- Queries

local function IsPerforming(character)
    return Osi.HasActiveStatus(character, "PERFORM_POSITIVE") == 1
end

local function HasInstrumentEquipped(character)
    return Osi.GetEquippedItem(character, "MusicalInstrument")
end

local function HasInstrumentProficiency(character)
    local entity = Ext.Entity.Get(character)
    local boostTypes = entity.BoostsContainer.Boosts
    local proficiencies = nil
    -- Get proficiency boost table
    for _, boosts in ipairs(boostTypes) do
        if boosts.Type == "Proficiency" then
            proficiencies = boosts
        end
    end

    -- Return false if proficiency boosts table doesn't exist
    if not proficiencies then
        return false
    end

    -- Search for musical instrument proficiency
    for _, proficiency in pairs(proficiencies.Boosts) do
        proficiency = proficiency:GetAllComponents()
        for _, name in pairs(proficiency.ProficiencyBoost.Flags) do
            if name == "MusicalInstrument" then
                return true
            end
        end
    end
    return false
end


----------------------------------------
-- Helpers

local function StopPerforming(character)
    local entity = Ext.Entity.Get(character)
    local statuses = entity.ServerCharacter.StatusManager.Statuses
    for _, status in ipairs(statuses) do
        local id = status.StatusId
        if string.match(id, "PERFORM_POSITIVE") then
            Osi.RemoveStatus(character, id)
        end
    end
end

local function StartPartyPerform(song, character)
    local players = Osi.DB_Players:Get(nil)
    local pwm = Ext.Mod.IsModLoaded("362546ac-055c-4140-a4d0-ab3f15c0a91a") -- Play With Me compatibility
    for _, player in pairs(players) do
        if player[1] ~= character and Osi.GetDistanceTo(character, player[1]) <= Osi.GetPerformGroupJoinRadius() and (HasInstrumentProficiency(player[1]) or pwm) and HasInstrumentEquipped(player[1]) then
            if IsPerforming(player[1]) then
                StopPerforming(player[1])
            end
            Osi.TimerLaunch(string.format("GP|%s|%s", player[1], song), 1)
        end
    end
end


----------------------------------------
-- Listeners

Ext.Osiris.RegisterListener("TimerFinished", 1, "after", function(str)
    local pattern = "^GP|(.*)|(.*)$"
    local player, song = string.match(str, pattern)
    if player and song then
        Osi.UseSpell(player, song, player)
    end
end)

Ext.Osiris.RegisterListener("CastedSpell", 5, "after", function(character, spell, type, school, int)
    local pattern = "^Shout_Bard_Perform.*Group$"
    if string.match(spell, pattern) then
        StartPartyPerform(string.sub(spell, 1, -7), character)
    end
end)

-- Osi.RemoveStatus("Dragonborn_Red_Male_Player_c349a46e-9808-0d05-90d4-732e8da38d8a", "PERFORM_POSITIVE_BARDDANCE")
-- Osi.HasActiveStatusWithGroup()
-- Osi.DB_CRIME_MusicalPerformance:Get(nil,nil,nil)
