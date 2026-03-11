-- Helper function to visually shake a card
function shakecard(self)
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end
-- Below are the atlases for the Jokers and their appearance in game
SMODS.Atlas({ key = "fyureshi_leg",
    path = "j_fyureshi_leg.png",
    px = 710,
    py = 950
})

SMODS.Atlas({ key = "fyureshi_leg_wiped",
    path = "j_fyureshi_leg_wiped.png",
    px = 710, 
    py = 950
})

SMODS.Atlas({ key = "symbolirudolf",
    path = "j_symboli_rudolf_throne.png",
    px = 710,
    py = 950
})

SMODS.Atlas({ key = "netanyahu",
    path = "j_netanyahu.png",
    px = 710, 
    py = 950
})

SMODS.Atlas({ key = "spoonful",
    path = "j_spoonful.png",
    px = 710, 
    py = 950
})

SMODS.Atlas({ key = "xeuh",
    path = "j_xeuh.png",
    px = 710, 
    py = 950
})

SMODS.Atlas({ key = "kitasanblack",
    path = "j_kitasanblack.png",
    px = 288,
    py = 384
})

SMODS.Atlas({ key = "screamingchicken",
    path = "j_chickentree.png",
    px = 710,
    py = 950
})

SMODS.Atlas({ key = "markiplier",
    path = "j_markiplier.png",
    px = 710,
    py = 950
})

-- Below are the Jokers themselves and their scripts
SMODS.Joker{ -- Fyureshi Prime (Legendary)
    key = "fyureshi_leg",
    config = { extra = { is_wiped = false, x_mult_base = 5, x_mult_legendary = 1.5 } }, 
    pos = { x = 0, y = 0 },
    rarity = 4,
    cost = 20,
	pools = {["Fyureshi_stuff"] = true, ["Archangel"] = true},
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'fyureshi_leg',

    calculate = function(self, card, context)
        
        -- EFFECT 1 & 4: Enhancements (Alive) OR X-Mult (Dead)
if context.individual and context.cardarea == G.play then 
    if context.other_card:is_face() or context.other_card:get_id() == 14 then 
        
        if not card.ability.extra.is_wiped then
            -- ALIVE: Add random enhancement, but ONLY if it has no enhancement
            if context.other_card.config.center == G.P_CENTERS.c_base then
                local random_enhancement = pseudorandom_element(G.P_CENTER_POOLS.Enhanced, pseudoseed('fyureshi_enh'))
                context.other_card:set_ability(random_enhancement, nil, true)
                
                return {                             
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    card = card,
                    colour = G.C.CHIPS
                }
            end
        else
            -- DEAD/WIPED: Calculate scaling X-Mult (Still applies to ALL face cards/aces)
            local legendary_count = 0
            for _, j_card in ipairs(G.jokers.cards) do
                if j_card.config.center.rarity == 4 then
                    legendary_count = legendary_count + 1
                end
            end
            
            -- Math: Base 5 + (1.5 * Total Legendaries)
            local total_xmult = card.ability.extra.x_mult_base + (card.ability.extra.x_mult_legendary * legendary_count)

            return {
                x_mult = total_xmult,
                card = card
            }
        end
    end
end

        -- EFFECT 2 & 3: The Black Hole Clone & Wipe
if context.using_consumeable and context.consumeable.config.center.key == 'c_black_hole' and not card.ability.extra.is_wiped then
    
    if context.blueprint then return end 

    -- Bypass the anti-duplicate rule with a 1 in 6 chance (adjust the 6 to whatever odds you want!)
    local wipe_chance = pseudorandom('fyureshi_wipe') < (1 / 6)
    
    if wipe_chance then
        
-- Visual flair for the transformation
card:juice_up(0.8, 0.8)
shakecard(card) 

-- State changes
card.ability.eternal = true
card.ability.extra.is_wiped = true 
card:set_edition(nil, true) -- This explicitly strips the Negative shader!

-- Give +1 Joker slot (Since you don't have Negative anymore, this acts as the replacement)
G.jokers.config.card_limit = G.jokers.config.card_limit + 1

-- Swap Atlas 
card.config.center.atlas = 'sj_fyureshi_leg_wiped'
card:set_sprites(card.config.center)
        
        -- Strip playing cards
        if G.playing_cards then
            for _, p_card in ipairs(G.playing_cards) do
                p_card:set_ability(G.P_CENTERS.c_base, true)
                p_card:set_seal(nil, true)
                p_card:set_edition(nil, true)
            end
        end
        
        -- Strip other Jokers
        if G.jokers and G.jokers.cards then
            for _, j_card in ipairs(G.jokers.cards) do
                if j_card ~= card then 
                    j_card:set_edition(nil, true)
                end
            end
        end

-- Reset poker hands safely for Talisman compatibility
if G.GAME and G.GAME.hands then
    for hand_name, hand_data in pairs(G.GAME.hands) do
        -- Use to_big to ensure we are comparing the BigNum table to a number correctly
        if to_big(hand_data.level) > to_big(1) then
            hand_data.level = 1
            -- Reset to the original base values defined in the game
            hand_data.mult = hand_data.s_mult 
            hand_data.chips = hand_data.s_chips
            
            -- Visual feedback for the wipe
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    return true
                end
            }))
        end
    end
end
        
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Absolute Wipe!"})
        
    else
        -- If the wipe doesn't trigger, generate a normal legendary
        local new_joker = create_card('Joker', G.jokers, true, 4, nil, nil, nil, 'fyureshi_leg_gen')
        new_joker:add_to_deck()
        G.jokers:emplace(new_joker)
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Legendary Added!"})
    end
end

    end,
    -- Ensures the game remembers your extra slot when you load a save
    add_to_deck = function(self, card, from_debuff)
        if card.ability.extra.is_wiped then
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.is_wiped then
            G.jokers.config.card_limit = G.jokers.config.card_limit - 1
        end
    end,
    
    loc_vars = function(self, info_queue, card)
        if card and card.ability and card.ability.extra.is_wiped then
            local legendary_count = 0
            if G.jokers and G.jokers.cards then
                for _, j_card in ipairs(G.jokers.cards) do
                    if j_card.config.center.rarity == 4 then
                        legendary_count = legendary_count + 1
                    end
                end
            end
            local current_total = card.ability.extra.x_mult_base + (card.ability.extra.x_mult_legendary * legendary_count)
            
            return { vars = { current_total, card.ability.extra.x_mult_legendary }, key = self.key .. '_wiped' }
        end
        return { vars = { }, key = self.key }
    end
}

--[[ SMODS.Joker{ -- Umeshu Sigma (Legendary)
     key = "umeshu",
     }
     ]]

SMODS.Joker{ -- Symboli Rudolf (Legendary)
    key = "symbolirudolf",
    config = { extra = { Mult = 1, repetitions0 = 1, dollars0 = 0 }},
    pos = {x = 0, y = 0},
    cost = 20,
    rarity = 4,
	pools = {["Fyureshi_stuff"] = true, ["Umamusume"] = true},
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'symbolirudolf',
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Mult}}
    end,
    
    calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
    -- Bulletproof (holy shit heavy tf2 reference) check: Is it an Ace (14) AND is it enhanced?
        if context.other_card:get_id() == 14 and context.other_card.config.center ~= G.P_CENTERS.c_base then
        	return {
            	repetitions = 1,
            	message = localize('k_again_ex'),
            	card = card 
        	}
    	end
	end
    	if context.cardarea == G.jokers and context.joker_main  then
        return {
    			x_mult = card.ability.extra.Mult,
    			card = card -- It's always good practice to pass the card here too
			}
        end
      	if context.skip_blind and not context.blueprint then
    		card.ability.extra.Mult = 1
    		return {
        		message = localize('k_reset'),
        		colour = G.C.RED
    		}
		end
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
    		-- Determine the upgrade amount based on if it's a boss blind
    		local upgrade_amount = G.GAME.blind.boss and 5 or 1
			card.ability.extra.Mult = card.ability.extra.Mult + upgrade_amount
			return {
        		message = '+' .. tostring(upgrade_amount) .. ' XMult!',
        		colour = G.C.RED
    		}
		end
        if context.reroll_shop and not context.blueprint then
    		card.ability.extra.Mult = 1
			-- Drain the money
    		local current_dollars = G.GAME.dollars
    		if current_dollars > 0 then
        		ease_dollars(-current_dollars)
    		end
    		return {
        		message = 'Reset & Drained!',
        		colour = G.C.RED
    		}
			end
    	end
}

SMODS.Joker { -- Benjamin Netanyahu (Uncommon)
    key = "netanyahu",
    config = { extra = { dollars0 = 12, xmult0 = 3 }},
    cost = 5,
    rarity = 2, -- Uncommon [cite: 14]
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'netanyahu',
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            -- Check if we have enough money (using Talisman's to_big if available)
            local current_money = to_big(G.GAME.dollars)
            local cost = to_big(card.ability.extra.dollars0)

            if current_money >= cost then
                -- Deduct the $12 [cite: 14]
                ease_dollars(-card.ability.extra.dollars0)
                
                return {
                    message = 'X' .. card.ability.extra.xmult0,
                    Xmult_mod = card.ability.extra.xmult0,
                    colour = G.C.MULT
                }
            else
                -- "Get Nuked" logic (Game Over) [cite: 14]
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        G.STATE = G.STATES.GAME_OVER
                        G.STATE_COMPLETE = false
                        return true
                    end
                }))
                return {
                    message = "NUKED!",
                    colour = G.C.RED
                }
            end
        end
    end
}

SMODS.Joker { -- Comically Large Spoon (Common)
    key = "spoonful",
	cost = 10,
	pools = {["Fyureshi_stuff"] = true, ["Meme cards"] = true},
	rarity = 1, -- Common
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	unlocked = true,
	discovered = true,
	atlas = "spoonful",
	pos = {x = 0, y = 0},
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
        G.GAME.round_resets.discards = math.max(1, G.GAME.round_resets.discards - 1)
        G.hand:change_size(3)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        G.hand:change_size(-3)
    end
}

SMODS.Joker { -- XenoverNate (Uncommon)
    key = "xeuh",
	cost = 10,
	pools = {["Fyureshi_stuff"] = true, ["Fyureshi's friends"] = true},
	rarity = 2, -- Uncommon
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	unlocked = true,
	discovered = true,
	atlas = "xeuh",
	pos = {x = 0, y = 0},
config = { extra = { odd_divide = 4, odd_poly = 6 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odd_divide, G.GAME.probabilities.normal, card.ability.extra.odd_poly } }
    end,

    calculate = function(self, card, context)
        -- Logic for 1/4 chance to divide Mult by 2
        if context.cardarea == G.jokers and context.after and not context.blueprint then
            if pseudorandom('entropy_div') < G.GAME.probabilities.normal / card.ability.extra.odd_divide then
                -- This divides the current total Mult in the scoring sequence
                mult = mult / 2
                update_hand_text({delay = 0}, {mult = mult})
                
                return {
                    message = '/2 Mult!',
                    colour = G.C.MULT
                }
            end
        end

        -- Logic for 1/6 chance to become Polychrome at end of round
        if context.end_of_round and not context.repetition and not context.blueprint then
            if not card.edition and pseudorandom('entropy_poly') < G.GAME.probabilities.normal / card.ability.extra.odd_poly then
                card:set_edition({polychrome = true}, true)
                return {
                    message = 'Polychrome!',
                    colour = G.C.DARK_EDITION
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
}

if not SMODS.Sounds['sj_harikitte'] then -- Function for the Kitasan Joker to play the oh so famous "Harikitte Ikou!
    SMODS.Sound({
        key = "harikitte",
        path = "harikitte.ogg" 
    })
end

SMODS.Joker({ -- Kitasan Black (Rare)
    key = 'kitasanblack',
    atlas = 'kitasanblack',
    pos = {x = 0, y = 0},
    rarity = 3, 
    pools = {["Fyureshi_stuff"] = true, ["Umamusume"] = true},
    unlocked = true,
    discovered = true,
    cost = 9,
    blueprint_compat = true,
    config = { 
        extra = { 
            chips = 0, 
            gain = 25, 
            hands_played = 0, 
            threshold = 50, 
            boosted_gain = 50 
        } 
    },
    
    loc_vars = function(self, info_queue, card)
        -- Fallback logic for safety against nil values
        local gain_val = card.ability.extra.gain or 25
        if (card.ability.extra.hands_played or 0) >= (card.ability.extra.threshold or 50) then
            gain_val = card.ability.extra.boosted_gain or 50
        end
        return { vars = { gain_val, card.ability.extra.chips or 0, card.ability.extra.hands_played or 0, card.ability.extra.threshold or 50 } }
    end,

    calculate = function(self, card, context)
        -- Speed Up / Training Effect triggered every hand played
        if context.before and not context.blueprint then
            -- Increment the "Friendship Gauge" (hands played)
            card.ability.extra.hands_played = (card.ability.extra.hands_played or 0) + 1
            
            -- Determine current gain based on the Unique Effect threshold
            local current_gain = card.ability.extra.gain or 25
            local message_text = 'Friendship training SUCCESS!'
            
            if card.ability.extra.hands_played >= (card.ability.extra.threshold or 50) then
                current_gain = card.ability.extra.boosted_gain or 50
                message_text = 'MAX SPEED!'
            end

            -- Permanent scaling of Speed (Chips)
            card.ability.extra.chips = (card.ability.extra.chips or 0) + current_gain
            
            -- Play the "Harikitte Ikou!" catchphrase [cite: 78, 79]
            play_sound('sj_harikitte', 1, 0.8)
            
            -- Vigorous training animation
            card:juice_up(0.6, 0.1)
            
            return {
                message = message_text,
                colour = G.C.CHIPS,
                card = card
            }
        end
        
        -- Scoring: Adding the Speed (Chips) to the total
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.chips or 0,
                message = '+' .. (card.ability.extra.chips or 0) .. ' Chips'
            }
        end
    loc_vars = function(self, info_queue, card)
    -- Determine the current scaling rate
    local current_scaling = card.ability.extra.gain or 25
    if (card.ability.extra.hands_played or 0) >= (card.ability.extra.threshold or 50) then
        current_scaling = card.ability.extra.boosted_gain or 50
    end

    return { 
        vars = { 
            current_scaling,                    -- #1# (Scaling rate: 25 or 50)
            card.ability.extra.chips or 0,      -- #2# (Total chips earned)
            card.ability.extra.hands_played or 0, -- #3# (Gauge progress)
            card.ability.extra.threshold or 50   -- #4# (Gauge target)
        } 
    }
end
    end
    
})

if not SMODS.Sounds['sj_chicken'] then -- Function for the Screaming Chicken Joker to play a loud chicken scream when the effect activates
    SMODS.Sound({
        key = "chicken",
        path = "chicken.ogg" -- this is in assets/sounds/ folder
    })
end

SMODS.Joker { -- Screaming Chicken On A Tree (Uncommon)
    key = "screamingchicken",
    atlas = "screamingchicken",
    pos = { x = 0, y = 0 },
    rarity = 2,
    pools = {["Fyureshi_stuff"] = true, ["Meme cards"] = true},
    unlocked = true,
    discovered = true,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { Xmult = 3 } },

    loc_vars = function(self, info_queue, card)
        local is_max_volume = false
        
        if G.SETTINGS and G.SETTINGS.SOUND then
            local master_vol = G.SETTINGS.SOUND.volume or 0
            -- Changed from game_sounds to game_sounds_volume
            local sfx_vol = G.SETTINGS.SOUND.game_sounds_volume or 0 
            
            if master_vol >= 99 and sfx_vol >= 99 then
                is_max_volume = true
            end
        end
        
        local loc_key = is_max_volume and (self.key .. '_active') or (self.key .. '_inactive')
        
        return { 
            vars = { card.ability.extra.Xmult }, 
            key = loc_key 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if G.SETTINGS and G.SETTINGS.SOUND then
                
                local master_vol = G.SETTINGS.SOUND.volume or 0
                -- Changed from game_sounds to game_sounds_volume
                local sfx_vol = G.SETTINGS.SOUND.game_sounds_volume or 0

                if master_vol >= 99 and sfx_vol >= 99 then
                    
                    play_sound('sj_chicken', 1, 1)
                    card:juice_up(0.5, 0.5)

                    return {
                        message = 'X' .. card.ability.extra.Xmult .. ' Mult!',
                        Xmult_mod = card.ability.extra.Xmult,
                        colour = G.C.MULT
                    }
                end
            end
        end
    end
}

SMODS.Joker {
    key = "markiplier",
    config = { extra = { chips_gained = 87, total_chips = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 2, -- Uncommon
    cost = 8,
    pools = {["Fyureshi_stuff"] = true, ["Meme cards"] = true},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'markiplier',

    loc_vars = function(self, info_queue, card)
        -- Displays the current chip total in the Joker's description
        return { vars = { card.ability.extra.chips_gained, card.ability.extra.total_chips } }
    end,

    calculate = function(self, card, context)
        -- 1. Apply the Chips during the scoring phase
        if context.joker_main and card.ability.extra.total_chips > 0 then
            return {
                message = '+' .. card.ability.extra.total_chips,
                chip_mod = card.ability.extra.total_chips,
                colour = G.C.CHIPS
            }
        end

        -- 2. Detect when cards are destroyed and scale the Joker
        -- 'context.remove_playing_cards' triggers when cards are permanently removed
        if context.remove_playing_cards and not context.blueprint then
            -- Count how many cards were actually removed in this instance
            local destroyed_count = context.removed and #context.removed or 0
            
            if destroyed_count > 0 then
                -- Scale by 87 for EVERY card destroyed
                card.ability.extra.total_chips = card.ability.extra.total_chips + (card.ability.extra.chips_gained * destroyed_count)
                
                -- Juice up the card visually
                card:juice_up(0.8, 0.8)
                
                return {
                    message = 'BITE OF 87?!',
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end
}

-- Joker ideas
--[[
- Umeshu Sigma (Legendary): (OC) All listed odds below 50% are put to 50%, and Wheel of Fortune now grants Negative instead of Foil/Holographic/Polychrome each time it succeeds. Celestial packs always contain Black Holes. If Fyureshi is present, a free Negative Black Hole is added to your consumables each time a Boss Blind is defeated (unless Perkeo is present bcuz that would be too OP).
 - Refined Camellite Ore (Uncommon): Adds +0.2 to the Mult. for each % of the Music Volume. This number multiplies by 2 for each Camellite Ore in your Consumables.
 - Ren Amamiya - Joker (Uncommon): If a The Fool Tarot Card is used during a Boss Blind round AND that the current Boss Blind's effect has been triggered at least once, spawns Arsène. (Cannot spawn Arsène when it or Satanael are already present)
 - Arsène (Rare): Does nothing on its own. If Ren Amamiya is present, disables the Boss Blind's effect. If a The World Tarot Card is used, evolves into Satanael.
 - Satanael (Legendary): Does nothing on its own. If Ren Amamiya is present, disables the Boss Blind's effect and gives X21 Mult.
 - Izanagi-no-Okami Picaro (Legendary): Disables all Jokers for 2 turns (Debilitate + Concentrate), on the third, re-enables them, permanently multiplies its own base X3 Mult by 3 for each Joker in the deck, "unleashes" it (Myriad Truths) and retriggers all played Spades face cards and Spades Aces three times, then restarts the cycle.
 - Narrowest Car (Common): Gives +50 Chips. Loses 10 Chips of power per round played. When it hits 0 Chips, it is destroyed.
 - DaBaby Car: Lezgoooo
 - Roddy Ricch Goes To The Burger King Drive-Thru And Gets Diarrhea
 - Lebron James (Legendary)
 - Senator Armstrong (Rare)
 - Jetstream Sam (Uncommon)
 - Slaking (Uncommon): Truant ability (disables itself and Jokers on its right and left 1/2 turns)
 - Focus Sash (Uncommon): 
 - Mega Rayquaza (Legendary): 
 - Da Biggest Bird (Common): Gives +1 Hand, but you must play 5 cards
 - Low Taper Fade (Uncommon): Imagine if Ninja got a Low Taper Fade
 - 67 Kid (Common): Still dragging the meme in 2026.
 - IShowSpeed (Uncommon): My momma's kinda homeless
 - Statement Dog (Uncommon): he made a statement so heavenly even his gang praised him
 - Fact Check (Common)
 - Chill Guy (Uncommon)
 - PLANET//SHAPER (Rare): dependant on Camellite Ore
 - NUCLEAR-STAR (Rare)
 - crystallized (Rare)
 - Δ: FOR THE DELTA (Legendary): 
 - Legalize Nuclear Bombs: Swag Messiah.
 - Shadow Wizard Money Gang (Rare): They love casting spells.
 - POOTIS/ENGAGE: Omg anime girls in area 51
 - Dream: luck glitch lmao. 1 on 1.75 trillion chance to win the game at the end of the round
 - Markiplier (Uncommon): Was that the bite of 87? Gives +87 Chips for each destroyed playing card.
 - Freddy Fazbear (Uncommon)
 - Bobr (Common): Bober Kurwa! Each played Clubs Card gives +15 Chips.
 - Sanic (Rare): GOTTA GO FAST
 - icecreamsandwich (Uncommon):
 - Airpod Shotty (Common): Sets Hands at 2, puts your Game Volume to 0%, gives +115 Mult
 - Camera Gun (asdf) (Uncommon): Oh wait, this isn't a camera.
 - Pie-flavored Pie (asdf) (Common):
 - Trains Kid (asdf) (Rare):
 - Perfect Cell with the J's (Rare):
 - Hotel Mario (Uncommon): Nice of the princess to invite us for a picnic, eh Luigi?
 - Sneakers O'Toole (Uncommon): I'm not taking my sneakers off, I am Sneakers O'Toole.
 - John Trainer (name alternatives: Okino Trainer, Trainer-san) (Rare): 
 - Haru Urara (Uncommon): [Umamusume pool]
 - Lil' Spica (Commmon): [Umamusume pool]
 - Mambo (Common): [Umamusume pool]
 - Hachimi (Common): [Umamusume pool]
 - Gold Ship (Rare): + Mult., 1/6 chance for something random to happen, including doubling the required score to beat the current Blind. [Umamusume pool]
 - Oguri Cap (Legendary) [Umamusume pool]
 - Forever Young (Rare): Nepobaby. [Umamusume pool]
 - Shonbori Rudolf (a.k.a. Tanuki Rudolf) (Uncommon):
 - Still in Love (Rare): slowly turns your UI red (reference to her Career mode scenario) [Umamusume pool]
 - Low Cortisol Tachyonling (Uncommon): Smol Agnes Tachyon dancing. [Umamusume pool]
 - Freaky Diamond: BLEH
 - T.M. Opera Bird: classical music in earrape, T.M. Opera O image flashbang (the one resembling the "You Are My Sunshine" Lebron James meme)
 - Jonkler: Is he stupid? (enrique sound effect)
 - Thukuna: GOO GOO GAGA
 - Megumi Fushiguro (Uncommon): +50 Chips, +10 Mult, 1/10 chance to die when starting a Boss Blind round and create Mahoraga.
 - Mahoraga (Rare): adaption?
 - Kagura (Legendary):
 - Futaba Sakura - Oracle (Rare): something with enhancements and/or flipping flipped cards
 - Gordon Freeman (Uncommon):
 - Spamton G. Spamton (Rare): Has a chance to spawn a random consumable when you score a hand, but it might be something bad like the Xbox Controller or the Black Hole.
 - WhatsApp Car (APPEARS ONLY IF YAHIMOD IS ACTIVE) (Common): Chance to self-destroy and spawn the Yahimod's WhatsApp Doctor Joker.
 - Oppenheimer (Rare):
 - Sonic the Hedgehog (Uncommon)
 - Shadow the Hedgehog (Uncommon)
 - Super Sonic (Rare)
 - Okabe Rintaro (Uncommon): See your possible Poker hands, but lose Mult
 - PhoneWave (name subject to change) (Rare): Copies the ability of the last sold Joker
 - Whiplash (ULTRAKILL) (APPEARS ONLY IF YAHIMOD IS ACTIVE) (Common): Only works when you have the Yahimod's V1 Joker in your deck
 - Star Glitcher (Rare): Misprint but good
 - Euro value (Common): Misprint but can go into negatives and also affects chips and money
 - Marine Le Pen (Rare): Fake description which states a normal buff. Actually removes all enhancements from all score enhanced playing cards and all neighboring Jokers (because she's racist).
 - Jordan Bardella (Common): As soon as equipped, sets your money to 0 and self-destructs (referencing the fact he never comes to the European Parliament and actually doesn't do anything). Fake description too.
 - Emmanuel Macron (Uncommon): Gain $20 at the end of each round, but chance to destroy all Jokers except itself (reference to him dissolving the government a lot of times)
 - Joseph Stalin
 - Jeffrey Epstein (Rare): Well. Um. After beating a Boss Blind, gain one Epstein Island consumable. [EpsteinIsland pool]
 - Donald Trump (Rare): [EpsteinIsland pool]
 - Bill Clinton (Rare): More like oral office am I right [EpsteinIsland pool]
 - Stephen Hawking (Rare): [EpsteinIsland pool]
 - P. Diddy (Rare): Chance to enhance a random Joker into Foil (reference to the baby oil) [EpsteinIsland pool]
 - Son Goku (Uncommon):
 - OceanGate Titan (Uncommon): cannot be found in shop or boosters, but only spawns through using the Xbox Controller consumable. Explodes after 2 antes (or 6 rounds, referencing the incident)
 - U R MR GAY (Common): Played Diamond and Spade cards add 10 chips each.
 - shitass: wanna see me speedrun?
 - Luigi (Uncommon): You can now play as Luigi. Randomly gain a permanent X3 Mult if you do not do anything. Turns your UI green.
 - Red Shell (Common): +20 Mult.
 - Blue Shell (Uncommon): When the Boss Blind is selected, sets its requirement to 50% of its original value if you are at 0 Discards. Cannot be disabled by the Raffu boss.
 - Smash Ball
 - Vergil
 - Dante
 - Kratos: ZEUS! YOUR SON HAS RETURNED!
]]