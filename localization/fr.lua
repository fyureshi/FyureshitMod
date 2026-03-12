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
                    '\"{C:inactive}Créons un monde où tous les Umamusume peuvent vivre dans la joie.{}\"',
                    'Rejoue tous les As {C:enhanced}Améliorés{}, et ajoute {X:red,C:white}X1{} au Mult',
                    'à chaque victoire consécutive contre une {C:attention}Blinde{}',
                    '{X:red,C:white}X5{} pour chaque {C:legendary}Blinde Boss{}, {C:red}se réinitialise{} en passant une Blinde.',
                    'Présentement {X:red,C:white} X#1# {}',
                    '{C:red}Se réinitialise {}et met votre {C:money}argent {}à 0 pour tout {C:uncommon}renouvellement du magasin{}.'


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
                "{C:green}1/4{} chance de manger le {X:mult,C:white}Mult{} et de le diviser par {C:red}2{} à chaque main jouée.",
                "{C:green}1/6{} chance de devenir {X:enhanced,C:white}Polychrome{} à la fin de chaque tour.",
                "Cet énorme idiot prend {C:attention}2{} emplacements de Joker."
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
            },
            j_sj_screamingchicken_active = {
    name = "Poulet Hurlant Sur Un Arbre",
    text = {
        "{X:red,C:white}X#1#{} Mult.",
        "{C:red}Le volume du jeu est à 100%.",
        "{C:red}Préparez vos oreilles."
        },
    },
j_sj_screamingchicken_inactive = {
    name = "Poulet Hurlant Sur Un Arbre",
    text = {
        "{C:inactive}X#1#{} {C:inactive}Mult.",
        "{C:inactive}Le volume du jeu n'est pas à 100%.",
},
},
j_sj_markiplier = {
                name = "Markiplier",
                text = {
                    "\"{C:inactive}C'ÉTAIT LA MORSURE DE '87?{}\"",
                    "Donne {C:chips}+87{} Jetons pour chaque carte détruite.",
                    "Présentement {C:chips}+#2#{} Jetons"
        },
    },
j_sj_blueshell = {
                name = "Carapace Bleue",
                text = {
                    "Si vos Défausses atteignent {C:attention}0{}, réduisez le score requis",
                    "de la Blinde Boss de {C:attention}moitié{}.",
                     "{C:red}Ne peut pas être désactivé par le boss Raffu."
                },
            },
            j_sj_redshell = {
                name = "Carapace Rouge",
                text = {
                    "Si votre main jouée contient au moins une {C:attention}Carte Figure{},",
                    "Donne {C:red}+20{} Mult.",
                     "{C:red}Ne peut pas être désactivé par le boss Raffu."


},
            },
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