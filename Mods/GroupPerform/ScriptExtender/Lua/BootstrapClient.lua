local function ModCompatibility()
    -- Instruments of the Bard (https://www.nexusmods.com/baldursgate3/mods/4998)
    if Ext.Mod.IsModLoaded("b5dc323a-19b8-4174-8aa1-004306a6abb3") then
        local instruments = {
            IB_SB_Doss = "Lute",
            IB_SB_Cli = "Lyre",
            IB_SB_Mac = "Violin",
            IB_SB_Anstruth = "Violin",
            IB_SB_Canaith = "Flute",
            IB_SB_Fochlucan = "Drum"
        }
        for name, instrument in pairs(instruments) do
            local stat = Ext.Stats.Get(name)
            local groupBoost = string.format(" UnlockSpell(Shout_Bard_Perform_%s_Group);", instrument)
            local index = string.find(stat.Boosts, ";")
            local firstPart = string.sub(stat.Boosts, 1, index)
            local secondPart = string.sub(stat.Boosts, index + 1)
            stat.Boosts = firstPart .. groupBoost .. secondPart
        end
    end

    -- Useful Music Instruments (https://www.nexusmods.com/baldursgate3/mods/3933)
    if Ext.Mod.IsModLoaded("6784cee9-7aca-4db4-bd96-3a222803abad") or Ext.Mod.IsModLoaded("9ec724ce-37f3-47ad-815c-5c709315326c") then
        local instruments = {
            UNI_LOW_AlfiraRewardLute = "Lute",
            UNI_LOW_MintharaBoxLyre = "Lyre",
            UNI_LOW_KiamGodasKilatDrum = "Drum",
            UNI_LOW_DostrealtsPiccolo = "Flute",
            UNI_LOW_StolyarofsTableLute = "Lute",
            UNI_LOW_FalataericCliLyre = "Lyre",
            UNI_LOW_GlimmergadSelgauntFiddle = "Violin",
            UNI_LOW_TroubadourLute = "Lute",
            UNI_LOW_DeekinScalesingerLute = "Lute",
            UNI_LOW_MyrkulViolin = "Violin",
            UNI_LOW_IrisLyre = "Lyre",
            UNI_LOW_GnollPiccolo = "Flute",
            UNI_LOW_SolielFiddle = "Violin",
            UNI_LOW_MorwelDrum = "Drum",
            UNI_LOW_ZaKrugGoblinDrum = "Drum",
            UNI_LOW_StyxGoblinPiccolo = "Flute",
            UNI_LOW_GrobnarGnomehandsLute = "Lute",
            UNI_LOW_GrobnarGnomeKazoo = "Flute"
        }
        for name, instrument in pairs(instruments) do
            local stat = Ext.Stats.Get(name)
            local groupBoost = string.format(
                ";IF(HasProficiency('MusicalInstrument',context.Source)):UnlockSpell(Shout_Bard_Perform_%s_Group)",
                instrument)
            stat.Boosts = stat.Boosts .. groupBoost
        end
    end

    -- DLC Green Version (https://www.nexusmods.com/baldursgate3/mods/2653)
    -- Legendary Lute of the Merryweather Bard (https://www.nexusmods.com/baldursgate3/mods/3628)
    if Ext.Mod.IsModLoaded("7b4c6993-61b3-4aa8-bf47-ed76798414ce") or Ext.Mod.IsModLoaded("4aefa31f-d4e5-42a2-aac8-b3d39140b74b") then
        local stat = Ext.Stats.Get("DLC_DD_Lohses_Lute")
        local groupBoost = "UnlockSpell(Shout_Bard_Perform_Lute_Group);"
        local index = string.find(stat.Boosts, ";")
        local firstPart = string.sub(stat.Boosts, 1, index)
        local secondPart = string.sub(stat.Boosts, index + 1)
        stat.Boosts = firstPart .. groupBoost .. secondPart
    end

    -- Instruments of Controlled Chaos (https://www.nexusmods.com/baldursgate3/mods/1909)
    if Ext.Mod.IsModLoaded("43dce693-a404-4284-98cf-4b56bab2022b") then
        local instruments = {
            GABE_Pied_Piper_Drum = "Drum",
            GABE_Pied_Piper_Flute = "Flute",
            GABE_Pied_Piper_Lute = "Lute",
            GABE_Pied_Piper_Lyre = "Lyre",
            GABE_Pied_Piper_Violin = "Violin"
        }
        for name, instrument in pairs(instruments) do
            local stat = Ext.Stats.Get(name)
            local groupBoost = string.format(
                "; UnlockSpell(Shout_Bard_Perform_%s_Group)", instrument)
            stat.Boosts = stat.Boosts .. groupBoost
        end
    end

    -- Ring of Convenience (https://www.nexusmods.com/baldursgate3/mods/1942)
    if Ext.Mod.IsModLoaded("a29c4b72-a2ea-48ff-8ec3-8f5814d4c8db") then
        local stat = Ext.Stats.Get("LuteOfConvenience")
        local groupBoost =
        ";IF(HasProficiency('MusicalInstrument',context.Source)):UnlockSpell(Shout_Bard_Perform_Lute_Group)"
        stat.Boosts = stat.Boosts .. groupBoost
    end

    -- Weapons of Olympus (https://www.nexusmods.com/baldursgate3/mods/2455)
    if Ext.Mod.IsModLoaded("dcac7271-ee4e-48b4-97fb-f0ebe7bfe10c") or Ext.Mod.IsModLoaded("9fd4d153-e900-4a20-a53b-0f4d5fa6976b") then
        local stat = Ext.Stats.Get("Asclepios, the Golden Lyre")
        local groupBoost = "UnlockSpell(Shout_Bard_Perform_Lyre_Group);"
        local index = string.find(stat.Boosts, ";")
        local firstPart = string.sub(stat.Boosts, 1, index)
        local secondPart = string.sub(stat.Boosts, index + 1)
        stat.Boosts = firstPart .. groupBoost .. secondPart
    end

    -- Skald Drum (https://www.nexusmods.com/baldursgate3/mods/5984)
    if Ext.Mod.IsModLoaded("179f1d6f-45aa-492a-9c72-7f2ff8f3feee") then
        local instruments = {
            SkaldDrum = "Drum"
        }
        for name, instrument in pairs(instruments) do
            local stat = Ext.Stats.Get(name)
            local groupBoost = string.format("; UnlockSpell(Shout_Bard_Perform_%s_Group)", instrument)
            stat.Boosts = stat.Boosts .. groupBoost
        end
    end

    -- Amulet of Rituals (https://www.nexusmods.com/baldursgate3/mods/4156)
    if Ext.Mod.IsModLoaded("842fd505-28b9-407b-95cc-e881c4989e2b") or Ext.Mod.IsModLoaded("91c71877-8da4-4c5d-93ac-29804eba2889") then
        local instruments = {
            LuteOfRituals = "Lute",
            FluteOfRituals = "Flute",
            DrumOfRituals = "Drum",
            LyreOfRituals = "Lyre",
            ViolinOfRituals = "Violin"
        }
        for name, instrument in pairs(instruments) do
            local stat = Ext.Stats.Get(name)
            if stat then
                local groupBoost = string.format(
                    "; UnlockSpell(Shout_Bard_Perform_%s_Group)", instrument)
                stat.Boosts = stat.Boosts .. groupBoost
            end
        end
    end

    -- Bard Gear (https://www.nexusmods.com/baldursgate3/mods/3008)
    if Ext.Mod.IsModLoaded("b79bb1f3-992f-4d3b-869f-0b0b4b0442d9") then
        local instruments = {
            MAG_Instrument_Drum_1 = "Drum",
            MAG_Instrument_Flute_1 = "Flute",
            MAG_Instrument_Lute_1 = "Lute",
            MAG_Instrument_Lyre_1 = "Lyre",
            MAG_Instrument_Violin_1 = "Violin"
        }
        for name, instrument in pairs(instruments) do
            local stat = Ext.Stats.Get(name)
            local groupBoost = string.format(" UnlockSpell(Shout_Bard_Perform_%s_Group);", instrument)
            local index = string.find(stat.Boosts, ";")
            local firstPart = string.sub(stat.Boosts, 1, index)
            local secondPart = string.sub(stat.Boosts, index + 1)
            stat.Boosts = firstPart .. groupBoost .. secondPart
        end
    end
end


local function OnStatsLoaded()
    ModCompatibility()
end
Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
