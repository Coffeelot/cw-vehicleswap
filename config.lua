Config = {}
Config.Inventory = 'qb' -- qb or ox. Nothing else will work.
Config.AdvancedParking = false -- If you youse Advanced Parking then toggle this. If you have any other persistance then search for "AdvancedParking" in client.lua and make sure that the vehicle is removed correctly

-- lowrider, donk, drag, resto, drift, raised widebody
Config.Types = {
    ["lowrider"] = {price = 15000},
    ["donk"] = {price = 17000},
    ["drag"] = {price = 30000},
    ["resto"] = {price = 20000},
    ["drift"] = {price = 10000},
    ["raised"] = {price = 22000},
    ["widebody"] = {price = 20000},
    ["special"] = {price = 5000}
}

Config.Locations = {
    -- ["allmods"] = { -- this one does everything
    --     name = "allmods",
    --     title = "All Mods",
    --     coords = vector4(166.57, -3259.58, 5.19, 92.46),
    --     garage = "dumbogarage",
    --     types = {
    --         ["lowrider"] = Config.Types.lowrider,
    --         ["donk"] = Config.Types.donk,
    --         ["drag"] = Config.Types.drag,
    --         ["resto"] = Config.Types.resto,
    --         ["drift"] = Config.Types.drift,
    --         ["raised"] = Config.Types.raised,
    --         ["widebody"] = Config.Types.widebody,
    --         ["special"] = Config.Types.special
    --     },
    --     texts = {
    --         shopTitle = "Demo Spot - we do EVERYTHING",
    --         doneMessage = "Check your ride out at the Dumbo Garage on the other side of this rock pile"
    --     }
    -- },
    ["tuner"] = { -- this one does everything
    name = "tuner",
    title = "RS Swaps & Rebuilds",
    coords = vector4(943.63, -1554.31, 30.74, 179.35),
    garage = "tuner",
    types = {
        ["lowrider"] = Config.Types.lowrider,
        ["donk"] = Config.Types.donk,
        ["drag"] = Config.Types.drag,
        ["resto"] = Config.Types.resto,
        ["drift"] = Config.Types.drift,
        ["raised"] = Config.Types.raised,
        ["widebody"] = Config.Types.widebody,
        ["special"] = Config.Types.special
    },
    texts = {
        shopTitle = "Demo Spot - we do EVERYTHING",
        doneMessage = "Check your ride out at the Dumbo Garage on the other side of this rock pile"
    }
    },
    ["sandy"] = { -- example of a shop that only does certain types, and where user needs to be mechanic
        name = "sandy",
        title = "Sandy Restoration, Drag and Off Roading",
        coords = vector4(917.73, 3566.19, 32.95, 102.06),
        garage = "liqourparking",
        job = "mechanic",
        types = {
            ["drag"] = Config.Types.drag,
            ["resto"] = Config.Types.resto,
            ["raised"] = Config.Types.raised
        },
        texts = {
            shopTitle = "Sandy SDOR",
            doneMessage = "Check your ride out at the Liqour Parking on the other side of the road"
        }
    },
    ["bennys"] = { -- example of a shop that only does certain types, where user needs to be mechanic and where garage is left unset
        name = "bennys",
        title = "Get Low With Bennys",
        coords = vector4(-202.93, -1297.63, 31.3, 179.34),
        job = "mechanic",
        types = {
            ["resto"] = Config.Types.resto,
            ["lowrider"] = Config.Types.lowrider,
            ["donk"] = Config.Types.donk
        },
        texts = {
            shopTitle = "Get Low With Bennys",
            doneMessage = "Check your ride out at the San Andreas Parking garage"
        }
    },
    ["hectors"] = { -- example of a shop that only does certain types, where user needs to be mechanic and where garage is left unset
        name = "hectors",
        title = "Hectors Legit Spot",
        garage = "haanparking",
        coords = vector4(-201.45, 6263.08, 31.49, 34.04),
        types = {
            ["special"] = Config.Types.special
        },
        texts = {
            shopTitle = "No refunds.",
            doneMessage = "Check your ride out at the Bell Farms Parking on the other side of the road."
        }
    },
}

Config.Allowed = {
    ["buccaneer"] = {
        {type = "lowrider", value = "buccaneer2", title = "Lowrider Buccaneer", price = Config.Types.lowrider.price}
    },
    ["gauntlet3"] = {
        {type = "drag", value = "gauntlet5", title = "Gauntlet Classic Drag", price = Config.Types.drag.price}
    },
    ["youga2"] = {
        {type = "raised", value = "youga3", title = "Youga Classic 4x4", price = Config.Types.raised.price}
    },
    ["rumpo"] = {
        {type = "raised", value = "rumpo3", title = "Rumpo Lifted", price = Config.Types.raised.price}
    },
    ["rumpo2"] = {
        {type = "raised", value = "rumpo3", title = "Rumpo Lifted", price = Config.Types.raised.price}
    },
    ["virgo3"] = {
        {type = "lowrider", value = "virgo2", title = "Lowrider Virgo Classic", price = Config.Types.lowrider.price}
    },
    ["faction"] = {
        {type = "lowrider", value = "faction2", title = "Lowrider Faction", price = Config.Types.lowrider.price},
        {type = "donk", value = "faction3", title = "Donk Buccaneer", price = Config.Types.donk.price}
    },
    ["peyote"] = {
        {type = "lowrider", value = "peyote3", title = "Lowrider Peyote", price = Config.Types.lowrider.price },
        {type = "drag", value = "peyote2", title = "Drag Peyote", price = Config.Types.drag.price}
    },
    ["ratloader"] = {
        {type = "resto", value = "ratloader2", title = "Restored Ratloader", price = Config.Types.resto.price}
    },
    ["voodoo2"] = {
        {type = "lowrider", value = "voodoo", title = "Lowrider Voodoo", price = Config.Types.lowrider.price},
        {type = "resto", value = "voodoo3", title = "Voodoo Restored", price = 6000},
        {type = "resto", value = "voodoo", title = "Voodoo Sedan Restored", price = 6000}
    },
    ["yosemite"] = {
        {type = "drift", value = "yosemite2", title = "Drift Yosemite", price = 10000},
        {type = "raised", value = "yosemite3", title = "Raised Yosemite", price = Config.Types.raised.price},
        {type = "raised", value = "gstyosemite1", title = "DRT Yosemite", price = Config.Types.raised.price*3 }
    },
    ["glendale"] = {
        {type = "lowrider", value = "glendale2", title = "Lowrider Glendale", price = 4000}
    },
    ["primo"] = {
        {type = "lowrider", value = "primo2", title = "Lowrider Primo", price = Config.Types.lowrider.price},
        {type = "drift", value = "primoard", title = "Primo Drift", price = 20000}
    },
    ["tampa"] = {
        {type = "drift", value = "tampa2", title = "Drift Tampa", price = 32000}
    },
    ["btype"] = {
        {type = "drag", value = "btype2", title = "Franken Strange", price = Config.Types.drag.price}
    },
    ["btype3"] = {
        {type = "drag", value = "btype2", title = "Franken Strange", price = Config.Types.drag.price}
    },
    ["manana"] = {
        {type = "lowrider", value = "manana2", title = "Lowrider Manana", price = Config.Types.lowrider.price}
    },
    ["tornado3"] = {
        {type = "resto", value = "tornado", title = "Restored Tornado", price = 2000 },
        {type = "drag", value = "tornado6", title = "Drag Tornado", price = Config.Types.drag.price }
    },
    ["tornado"] = {
        {type = "lowrider", value = "tornado5", title = "Lowrider Tornado", price = Config.Types.lowrider.price}
    },
    ["tornado2"] = {
        {type = "lowrider", value = "tornado5", title = "Lowrider Tornado", price = Config.Types.lowrider.price}
    },
    ["banshee"] = {
        {type = "widebody", value = "banshee2", title = "Widebody Banshee", price = 60000 },
        {type = "widebody", value = "bansheeas", title = "Widebody Banshee", price = 70000 }
    },
    ["minivan"] = {
        {type = "lowrider", value = "minivan2", title = "Lowrider Minivan", price = Config.Types.lowrider.price }
    },
    ["moonbeam"] = {
        {type = "lowrider", value = "moonbeam2", title = "Lowrider Moonbeam", price = Config.Types.lowrider.price }
    },
    ["mesa"] = {
        {type = "raised", value = "mesa3", title = "Hill Climber Mesa", price = Config.Types.raised.price }
    },
    ["caddy2"] = {
        {type = "resto", value = "caddy", title = "Fancy Caddy", price = 1000 }
    },
    ["weevil"] = {
        {type = "drag", value = "weevil2", title = "Drag Weevil", price = Config.Types.drag.price },
        {type = "widebody", value = "weevilf6", title = "Weevil Ruff-Weld", price = 40000 },
        {type = "lifted", value = "weevilfo", title = "Weevil Outlaw", price = 30000 }
    },
    ["asterope"] = {
        { type = "widebody", value = "asterope2", title = "Asterope RS", price = 30000 }
    },
    ["ingot"] = {
        { type = "widebody", value = "ingotc", title = "Ingot VD90R", price = 29000 }
    },
    ["zodiac"] = {
        { type = "widebody", value = "zodiacr", title = "Zodiac RC", price = 80000 }
    },
    ["vigero"] = {
        { type = "resto", value = "restovig", title = "Vigero RestoMod", price = Config.Types.resto.price }
    },
    ["zion3"] = {
        { type = "widebody", value = "zionks", title = "Zion Krieger", price = 60000 },
        { type = "widebody", value = "zion4", title = "Zion Classic Custom", price = 30000 }
    },
    ["issi2"] = {
        { type = "widebody", value = "issi7", title = "Issi Sport Rebuild", price = 120000 }
    },
    ["nebula"] = {
        { type = "resto", value = "nebulaw", title = "Nebula Wagon", price = 10000 }
    },
    ["nebula2"] = {
        { type = "drift", value = "nebula", title = "Nebula Drift", price = 12000 }
    },
    ["boor"] = {
        { type = "drift", value = "boorc", title = "Boor Drift", price = 30000 }
    },
    ["sentinel4"] = {
        { type = "widebody", value = "sentinel3", title = "Sentinel Classic Widebody", price = 35000 }
    },
    ["tenf"] = {
        { type = "widebody", value = "tenf2", title = "10F Widebody", price = 80000 }
    },
    ["riata2"] = {
        { type = "raised", value = "riata", title = "Riata Lifted", price = 10000 }
    },
    ["everon"] = {
        { type = "raised", value = "everon", title = "Everon Raised", price = 10000 }
    },
    ["schwartzerc"] = {
        { type = "widebody", value = "schwartzerc2", title = "Schwartzer Classic STR", price = 80000 }
    },
    ["pentro"] = {
        { type = "widebody", value = "pentrogpr", title = "Penumbra RF GPR", price = 50000 }
    },
    ["pentro3"] = {
        { type = "widebody", value = "pentrogpr2", title = "Penumbra RF GPR Cabrio", price = 50000 }
    },
    ["jackal"] = {
        { type = "widebody", value = "jackgpr", title = "Jackal Custom", price = 50000 }
    },
    ["jester"] = {
        { type = "widebody", value = "jackgpr", title = "Jester X-Flow", price = 30000 }
    },
    ["cypher"] = {
        { type = "widebody", value = "cypherwb", title = "Cypher Widebody", price = 30000 }
    },
    ["mf1"] = {
        { type = "widebody", value = "mf1c", title = "MF1 Widebody", price = 80000 }
    },
    ["tempesta"] = {
        { type = "widebody", value = "tempestafr", title = "Tempesta FR-Widebody", price = 80000 }
    },
    ["coquette4"] = {
        { type = "widebody", value = "coquette4c", title = "Coquette D10 Widebody", price = 80000 }
    },
    ["brioso2"] = {
        { type = "widebody", value = "brioso3", title = "Brioso 300 Widebody ", price = 30000 }
    },
    ["clique3"] = {
        { type = "resto", value = "clique", title = "Clique Restomod", price = Config.Types.resto.price }
    },
    ["dominatorgtc"] = {
        { type = "resto", value = "ellie", title = "Ellie Rebuild", price = Config.Types.resto.price*2 }
    },
    ["paradox"] = {
        { type = "resto", value = "paradox2", title = "Paradox Track", price = Config.Types.resto.price*2 }
    },
    ["journey"] = {
        { type = "resto", value = "journey2", title = "Restore Journey", price = 5000 }
    },
    ["slamvan"] = {
        { type = "lowrider", value = "slamvan2", title = "Slamvan Custom", price = 15000 }
    },
    ["cometold"] = {
        { type = "raised", value = "comet4", title = "Comet Retro Safari", price = Config.Types.raised.price }
    },
    ["rloader"] = {
        { type = "raised", value = "rloader2", title = "Rat Loader Restored", price = Config.Types.resto.price }
    },
}

Config.SwapItem = "swap_slip"

Config.Special = {
    ["sultan"] = {
        {type = "special", value = "sultanrs", title = "Sultan RS", swapslip = "sultanrs"},
        {type = "special", value = "sultanrsv8", title = "Sultan RS V8", swapslip = "sultanrsv8"},
    },
    ["banshee"] = {
        {type = "special", value = "banshee2", title = "Widebody Banshee ", swapslip = "banshee"},
    },
    ["stratum"] = {
        {type = "special", value = "stratumc", title = "Stratum Custom", swapslip = "elegy"} -- stratum custom
    },
    ["sultan2"] = {
        {type = "special", value = "sultan2c", title = "Sultan Classic Widebody", swapslip = "sultan2c"}
    },
    ["sentinelsg4"] = {
        {type = "special", value = "sentineldm", title = "Sentinel SG4 Drift", swapslip = "sentineldm"}
    },
    ["veto"] = {
        {type = "special", value = "couchcar", title = "Couch Car", swapslip = "couch"}
    },
    ["monroe"] = {
        {type = "special", value = "monroec", title = "Monroe Custom", swapslip = "monroec"}
    },
    ["torero"] = {
        {type = "special", value = "torerod", title = "Torero Custom", swapslip = "torerod"}
    },
    ["drafter"] = {
        {type = "special", value = "draftgpr", title = "Drafter Widebody", swapslip = "draftgpr"}
    },
    ["zr350"] = {
        {type = "special", value = "zrgpr", title = "ZR350 Widebody", swapslip = "zrgpr"}
    },
    ["sentinelsg32"] = {
        {type = "special", value = "sentinelsg3d2", title = "Sentinel SG3 Drift", swapslip = "sentinelsg3d2"}
    },
    ["zr380s"] = {
        {type = "special", value = "zr380c", title = "ZR380 Widebody", swapslip = "zr380c"}
    },
    ["cometold"] = {
        {type = "special", value = "comet3", title = "Comet Retro Widebody", swapslip = "comet3"}
    },
    ["jester4"] = {
        {type = "special", value = "jestgpr", title = "Jester Widebody", swapslip = "jestgpr"}
    },
}
