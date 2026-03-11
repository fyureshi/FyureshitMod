SMODS.Atlas({
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
})

--Sounds, needed for the Shadow boss.
SMODS.Sound({ key = 'music_mass_destruction', path = 'music_mass_destruction.ogg', pitch = 1.0, volume = 1.0, loop = true })
SMODS.Sound({ key = 'music_reach_truth', path = 'music_reach_truth.ogg', pitch = 1.0, volume = 1.0, loop = true })
-- SMODS.Sound({ key = 'music_time_to_make_history', path = 'time_to_make_history.ogg' })
-- SMODS.Sound({ key = 'music_rivers_in_the_desert', path = 'rivers_in_the_desert.ogg' })
-- SMODS.Sound({ key = 'music_burn_my_dread_last_battle', path = 'burn_my_dread_last_battle.ogg' })

assert(SMODS.load_file("globals.lua"))()

-- Scan the 'items' folder instead!
local item_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "items")
for _, file in ipairs(item_src) do
    assert(SMODS.load_file("items/" .. file))()
end

function play_random_persona_track()
    -- Change 'sj_mass_destruction' to 'sj_music_mass_destruction'
    local tracks = {'sj_music_mass_destruction', 'sj_music_reach_truth'} -- Add more track keys as needed
    
    -- We save the choice to a global variable so the game can see it constantly
    G.persona_track = tracks[math.random(#tracks)]
    
    if G.ARGS.bg_music then
        G.ARGS.bg_music:stop()
    end
end

-- This overrides the function that decides which music key to play 
function SMODS.Sound:get_current_music()
    -- FAILSAFE: If we are not in a run, or not actively fighting a boss, clear the custom track.
    -- This handles Game Overs, returning to the Main Menu, or entering the Shop.
    if G.STAGE ~= G.STAGES.RUN or not G.GAME or not G.GAME.blind or not G.GAME.blind.boss then
        G.persona_track = nil
    end

    -- Check if our Persona variable is set
    if G.persona_track then
        return G.persona_track
    end

    -- Otherwise, proceed with vanilla logic (music1, music4, etc.)
    if G.STAGE == G.STAGES.RUN then
        if G.GAME.blind and G.GAME.blind.boss then return 'music5' end -- Boss music
        return 'music1' -- Default music
    elseif G.STAGE == G.STAGES.SHOP then
        return 'music4' -- Shop music
    end
    
    return 'music1' -- Catch-all for the Main Menu and other screens
end