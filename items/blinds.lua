SMODS.Atlas {
    key = "fyublinds",
    path = "blindsatlas.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind { name = "boss_raffu",
    key = "boss_raffu",
    atlas = "fyublinds",
    mult = 2,
    discovered = true,
    pos = { y = 0 },
    dollars = 10,
    boss = {  min = 1 },
    boss_colour = HEX('c50003'),

    recalc_debuff = function(self, card)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Fyureshi_stuff then
                G.jokers.cards[i]:set_debuff(true)
            end
        end
    end,

    disable = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,

    defeat = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,
}

SMODS.Blind({ name = 'the_shadow',
    key = 'the_shadow',
    atlas = 'fyublinds',
    pos = { y = 1 }, -- Position of the Blind in the atlas (second row)
    -- The text that appears on the Blind selection screen
    dollars = 5,
    mult = 2, -- Standard Boss Blind score multiplier
    boss = {min = 1, max = 10}, -- Can appear in any Ante
    boss_colour = HEX('8b0000'), -- A deep Persona red

    -- This function runs when the player presses "Play Hand"
    debuff_hand = function(self, cards, hand, handname, check)
        -- 1. Find the player's most used hand globally
        local favorite_hand = "High Card"
        local max_plays = -1
        
        for k, v in pairs(G.GAME.hands) do
            if v.played > max_plays then
                max_plays = v.played
                favorite_hand = k
            end
        end

        -- 2. If the hand they are trying to play is NOT their favorite, debuff it
        if handname ~= favorite_hand then
            return true -- True means the hand is debuffed (scores 0)
        end
        
        return false -- False means the hand scores normally
    end,

    -- This triggers when the blind is selected/enters the screen
    set_blind = function(self, blind)
        -- Call custom music function (see section 2)
        play_random_persona_track()
    end,

    -- Inside the SMODS.Blind({ ... }) definition:
defeat = function(self, blind)
    G.persona_track = nil -- Clear the variable to restore default music
end,

withdraw = function(self, blind)
    G.persona_track = nil -- In case of skip or leave the blind
end
})