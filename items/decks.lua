-- 1. Define the Atlas for your custom deck box
SMODS.Atlas({
    key = "fyureshi_deck_atlas",
    path = "b_fyureshi_deck.png", -- The name of the image file!
    px = 710,
    py = 950,
})

SMODS.Atlas({
    key = "israel_deck_atlas",
    path = "b_israel_deck.png", -- The name of the image file!
    px = 710,
    py = 950,
})

-- 2. Define the Deck
SMODS.Back{
    key = "fyureshi_deck",
    atlas = "fyureshi_deck_atlas", -- Pointing to the new atlas above!
    pos = {x = 0, y = 0},
    unlocked = true,
    discovered = true,
    config = {},
    
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                -- Create Fyureshi Prime
                local joker = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_sj_fyureshi_leg')
                joker:set_edition({negative = true}, true, true)
                joker.ability.eternal = true
                joker:add_to_deck()
                G.jokers:emplace(joker)

                -- Create 5 Negative Black Holes
                for i = 1, 5 do
                    local black_hole = create_card('Consumeables', G.consumeables, nil, nil, nil, nil, 'c_black_hole')
                    black_hole:set_edition({negative = true}, true, true)
                    black_hole:add_to_deck()
                    G.consumeables:emplace(black_hole)
                end
                
                return true
            end
        }))
    end
}


-- 2. Define the Deck
SMODS.Back{
    key = "israel_deck",
    atlas = "israel_deck_atlas", -- Pointing to the new atlas above!
    pos = {x = 0, y = 0},
    unlocked = true,
    discovered = true,
    config = {dollars = 60},
    
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local joker = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_sj_netanyahu')
                joker:set_edition({negative = true}, true, true)
                joker.ability.eternal = true
                joker:add_to_deck()
                G.jokers:emplace(joker)
                
                return true
            end
        }))
    end
}