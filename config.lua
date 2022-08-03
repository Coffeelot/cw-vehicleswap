Config = {}

-- lowrider, donk, drag, resto, drift, raised widebody
Config.Types = {
    ["lowrider"] = {price = 4200},
    ["donk"] = {price = 7200},
    ["drag"] = {price = 6200},
    ["resto"] = {price = 1200},
    ["drift"] = {price = 10000},
    ["raised"] = {price = 12000},
    ["widebody"] = {price = 20000},
    ["special"] = {price = 10000}
}

Config.Locations = {
    ["allmods"] = {
        name = "allmods",
        title = "All Mods",
        coords = vector4(166.57, -3259.58, 5.19, 92.46),
        garage = "dumbogarage",
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
    ["sandy"] = {
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
    }
}

Config.Allowed = {
    ["buccaneer"] = {
        {type = "lowrider", value = "buccaneer2", title = "Lowrider Buccaneer"}
    },
    ["faction"] = {
        {type = "lowrider", value = "faction2", title = "Lowrider Faction"},
        {type = "donk", value = "faction3", title = "Donk Buccaneer"}
    },
    ["peyote"] = {
        {type = "lowrider", value = "peyote3", title = "Lowrider Peyote"},
        {type = "drag", value = "peyote2", title = "Drag Peyote"}
    },
    ["ratloader"] = {
        {type = "resto", value = "ratloader2", title = "Lowrider Ratloader"}
    },
    ["voodoo2"] = {
        {type = "lowrider", value = "voodoo", title = "Lowrider Voodoo", price = Config.Types.lowrider.price + 2000}
    },
    ["yosemite"] = {
        {type = "drift", value = "yosemite2", title = "Drift Yosemite"},
        {type = "raised", value = "yosemite3", title = "Raised Yosemite"}
    },
    ["glendale"] = {
        {type = "lowrider", value = "glendale2", title = "Lowrider Glendale"}
    },
    ["primo"] = {
        {type = "lowrider", value = "primo2", title = "Lowrider Primo"}
    },
    ["tampa"] = {
        {type = "drift", value = "tampa2", title = "Drift Tampa"}
    },
    ["btype"] = {
        {type = "drag", value = "btype2", title = "Franken Strange"}
    },
    ["btype3"] = {
        {type = "drag", value = "btype2", title = "Franken Strange"}
    },
    ["manana"] = {
        {type = "lowrider", value = "manana2", title = "Lowrider Manana"}
    },
    ["tornado3"] = {
        {type = "resto", value = "tornado", title = "Restored Tornado"},
        {type = "drag", value = "tornado6", title = "Drag Tornado"}
    },
    ["tornado"] = {
        {type = "lowrider", value = "tornado5", title = "Lowrider Tornado"}
    },
    ["tornado2"] = {
        {type = "lowrider", value = "tornado5", title = "Lowrider Tornado"}
    },
    ["banshee"] = {
        {type = "widebody", value = "banshee2", title = "Widebody Banshee"}
    },
    ["minivan"] = {
        {type = "lowrider", value = "minivan2", title = "Lowrider Minivan"}
    },
    ["moonbeam"] = {
        {type = "lowrider", value = "moonbeam2", title = "Lowrider Moonbeam"}
    },
    ["mesa"] = {
        {type = "raised", value = "mesa3", title = "Hill Climber Mesa"}
    },
    ["caddy2"] = {
        {type = "resto", value = "caddy", title = "Fancy Caddy"}
    }
}

Config.SwapItem = "swap_slip"

Config.Special = {
    ["sultan"] = {
        {type = "special", value = "sultanrs", title = "Sultan RS", swapslip = "sultanrs"},
        {type = "special", value = "mega", title = "MEGA", swapslip = "mega"}
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
}
