return {
    descriptions = {
        Joker = {
            j_sj_fyureshi_leg = {
                name = "Fyureshi Prime",
                text = {
                    "Flipping the script is part of the job description.",
                    "Adds a random {C:attention}Enhancement{} to",
                    "each scored {C:attention}Face{} card and {C:ace}Ace{}.",
                    "Creates a random {C:legendary}Legendary{} Joker",
                    "when a {C:dark_edition}Black Hole{} is used.",
                    "{C:inactive}Something may happen if it duplicates itself...{}"
                },
            },
            j_sj_fyureshi_leg_wiped = {
                name = "Fyureshi Prime",
                text = {
                    "{C:inactive}Onto new horizons...{}",
                    "Each scored {C:attention}Face{} and {C:ace}Ace{} card",
                    "gives {X:mult,C:white} X#1# {} Mult",
                    "{C:inactive}(Increases by {X:mult,C:white} X#2# {} for each {C:legendary}Legendary Joker{C:inactive})",
                    "{C:dark_edition}+1{} Joker Slot"
                }
            },
            j_sj_symbolirudolf = {
                name = "Symboli Rudolf",
                text = {
                    '\"{C:inactive}Let us create a world where all Umamusume can live in bliss.{}\"',
                    'Retrigger all {C:enhanced}Enhanced{} aces, and adds {X:red,C:white}X1{} to Mult',
                    'each consecutive time a {C:attention}blind {}is beaten,',
                    '{X:red,C:white}X5{} for {C:legendary}boss blinds{}, {C:red}resets{} on skip.',
                    'Currently {X:red,C:white} X#1# {}',
                    '{C:red}Resets {}and sets your {C:money}money {}to 0 for any {C:uncommon}shop reroll{}.'


                }
            },
            j_sj_netanyahu = {
                name = "Benjamin Netanyahu",
                text = {
                    'When a hand is played, lose {C:money}$12{} and get {X:red,C:white}X3{} Mult.',
                    'If you go below {C:money}$0{} when paying, lose the run (get nuked).'
                }
            },
            j_sj_spoonful = {
                name = "Comically Large Spoon",
                text = {'\"{C:inactive}Ay dawg can I get some ice cream?{}\"','\"{C:inactive}Only a spoonful!{}\"',
                "{C:attention}+3{} hand size, {C:blue}+1{} Hand, {C:red}-1{} Discard."},
            },
            j_sj_xeuh = {
                name = "XenoverNate",
                text = {'\"{C:inactive}Suce moi le ch*bre Raphaël avec tes fautes de p*dale.{}\"',
                "{C:green}1/4{} chance to eat your {X:mult,C:white}Mult{} and divide it by {C:red}2{} each played hand.",
                "{C:green}1/6{} chance to become {X:enhanced,C:white}Polychrome{} at the end of each round.",
                "This fatass takes up {C:attention}2{} Joker slots."
            }
            },
            j_sj_kitasanblack = {
                name = "[Fire at My Heels] Kitasan Black",
                text = {'\"{C:inactive}The real race starts now!{}',
                        "{C:inactive}And this time, I'm going to win!{}\"",
                        "This Joker gains {C:chips}+#1#{} Chips",
                        "for every {C:attention}hand played{}.",
                        "{C:inactive}(Currently {}{C:chips}+#2#{}{C:inactive} Chips){}",
                        "{C:inactive}(Friendship: #3#/#4# hands played)"
                    }
            },
            j_sj_screamingchicken_active = {
    name = "Screaming Chicken On A Tree",
    text = {
        "{C:red}X#1#{} Mult.",
        "{C:red}Game volume is at 100%.",
        "{C:red}Prepare your ears."
    }
},
j_sj_screamingchicken_inactive = {
    name = "Screaming Chicken On A Tree",
    text = {
        "{C:inactive}X#1#{} {C:inactive}Mult.",
        "{C:inactive}Game volume is not 100%.",
        "{C:inactive}Too quiet..."
    }
},
j_sj_markiplier = {
    name = "Markiplier",
    text = {
        "\"{C:inactive}WAS THAT THE BITE OF \'87?{}\"",
        "Gives +87 chips for each destroyed playing card.",
        "Currently {C:chips}+#2#{} Chips"
    }
},
j_sj_blueshell = {
    name = "Blue Shell",
    text = {
        "If your Discards hit 0, reduce the required score",
        "of the current blind by half.",
        "Cannot be debuffed by the Raffu boss."
        },
    },
},
    Back = {
        b_sj_fyureshi_deck = {
            name = "Fyureshi Deck",
            text = {
                "Start with an {C:attention}Eternal{}, {C:dark_edition}Negative{}",
                "{C:legendary}Fyureshi Prime{} and {C:attention}5{}",
                "{C:dark_edition}Negative{} {C:dark_edition}Black Holes{}"
            }
        },
        b_sj_israel_deck = {
            name = "Israel Deck",
            text = {
                "Why would you even want to play this?",
                "Start with an {C:attention}Eternal{}, {C:dark_edition}Negative{}",
                "{C:uncommon}Benjamin Netanyahu{}."
            }
        }
    },
    Blind = {
        bl_sj_boss_raffu = {
            name = "Raffu",
            text = {
                '"Wazzup Beijing"',
                'Debuffs all',
                '{C:modcolor}FyureshitMod{} cards.'
            }
        },
        bl_sj_the_shadow = {
            name = "The Shadow",
            text = {
                "Must play your most used hand.",
                '"I am a shadow, the true self..."'
            }
        },
    },
    misc = {
        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
                a_xmult_minus="-X#1# Mult",
                }
            }
        }
    }