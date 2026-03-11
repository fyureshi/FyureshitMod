return {
    descriptions = {
        Joker = {
            j_sj_fyureshi_leg = {
                name = "Fyureshi Prime",
                text = {
                    "Renverser le script, c'est mon truc.",
                    "Ajoute une {C:attention}Édition{} aléatoire à",
                    "chaque carte {C:attention}Figure{} et {C:ace}As{}.",
                    "Crée un Joker {C:legendary}Legendary{} aléatoire",
                    "quand un {C:dark_edition}Trou Noir{} est utilisé.",
                    "{C:inactive}Il se peut que quelque chose se passe si il se crée lui-même...{}"
                },
            },
            j_sj_fyureshi_leg_wiped = {
                name = "Fyureshi Prime",
                text = {
                    "{C:inactive}Vers de nouveaux horizons...{}",
                    "Chaque carte {C:attention}Figure{} et {C:ace}As{} marquant des points",
                    "donne {X:mult,C:white} X#1# {} Mult",
                    "{C:inactive}(Augmente de {}{X:mult,C:white} X#2# {} {C:inactive}pour chaque{} {C:legendary}Joker Légendaire{})",
                    "{C:dark_edition}+1{} Emplacement de Joker"
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
                    'Quand une Main est jouée, soustrait {C:money}$12{} et donne {X:red,C:white}X3{} Mult.',
                    'Si la monnaie va en dessous de {C:money}$0{} en payant, termine la partie (bombe nucléaire).'
                }
            },
            j_sj_spoonful = {
                name = "Cuillère Comiquement Grande",
                text = {'\"{C:inactive}Yo mec j\'peux prendre un peu de glace?{}\"','\"{C:inactive}Juste une cuillère!{}\"',
                "{C:attention}+3{} à la taille de la main, {C:blue}+1{} Main, {C:red}-1{} Défausse."},
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
                name = "[Le Feu aux Talons] Kitasan Black",
                text = {'\"{C:inactive}La véritable course commence maintenant!{}',
                        "{C:inactive}Et cette fois, je vais gagner!{}\"",
                        "Ce Joker gagne {C:chips}+#1#{} Jetons",
                        "à chaque {C:attention}main jouée{}.",
                        "{C:inactive}(Présentement {}{C:chips}+#2#{}{C:inactive} Jetons){}",
                        "{C:inactive}(Amitié: #3#/#4# mains jouées)"
                    }
            }
        },
    Back = {
        b_sj_fyureshi_deck = {
            name = "Fyureshi Deck",
            text = {
                "Commence avec un {C:legendary}Fyureshi Prime{}",
                "{C:attention}Éternel{} et {C:dark_edition}Négatif{}, et {C:attention}5{}",
                "{C:spectral}Trous Noirs{} {C:dark_edition}Négatifs{} "
            }
        },
        b_sj_israel_deck = {
            name = "Deck d'Israel",
            text = {
                "Pourquoi tu voudrais jouer ça?",
                "Commence avec un {C:uncommon}Benjamin Netanyahu{}",
                "{C:attention}Éternel{} et {C:dark_edition}Négatif{}.",
            }
        }
    },
    Blind = {
        bl_sj_boss_raffu = {
            name = "Raffu",
            text = {
                '"Oe la team"',
                'Désactive toutes les cartes',
                'du {C:modcolor}FyureshitMod{}.'
            }
        },
        bl_sj_the_shadow = {
            name = "L'Ombre",
            text = {
                "Doit jouer la Main la plus utilisée.",
                '"Je suis une Ombre, le vrai Moi..."'
    },
}
    },
    misc = {
        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Mains",
            a_handsize="+#1# Taille de la main",
            a_handsize_minus="-#1# Taille de la main",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Restants",
            a_sold_tally="#1#/#2# Vendu",
            a_xmult="X#1# Mult",
                a_xmult_minus="-X#1# Mult",
                }
            }
        }
    }