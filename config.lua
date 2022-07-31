Config = {}

-- lowrider, donk, drag, resto, drift, raised widebody
Config.Types = {
    ['lowrider'] = { price = 4200 },
    ['donk'] = { price = 7200 },
    ['drag'] = { price = 6200 },
    ['resto'] = { price = 1200 },
    ['drift'] = { price = 10000 },
    ['raised'] = { price = 12000 },
    ['widebody'] = { price = 20000 },
}

Config.Locations = {
    ['allmods'] = { 
        name = "allmods", 
        title = "All Mods", 
        coords = vector4(166.57, -3259.58, 5.19, 92.46), 
        garage = 'dumbogarage', 
        types = {
            ['lowrider'] = Config.Types.lowrider,
            ['donk'] = Config.Types.donk,
            ['drag'] = Config.Types.drag,
            ['resto'] = Config.Types.resto,
            ['drift'] = Config.Types.drift,
            ['raised'] = Config.Types.raised,
            ['widebody'] = Config.Types.widebody,
        },
        texts = { shopTitle = 'Demo Spot - we do EVERYTHING', doneMessage = "Check your ride out at the Dumbo Garage on the other side of this rock pile" }
    },
    ['sandy'] = { 
        name = "sandy", 
        title = "Sandy Restoration, Drag and Off Roading", 
        coords = vector4(917.73, 3566.19, 32.95, 102.06), 
        garage = 'liqourparking', 
        job = 'mechanic',
        types = {
            ['drag'] = Config.Types.drag,
            ['resto'] = Config.Types.resto,
            ['raised'] = Config.Types.raised,
        },
        texts = { shopTitle = 'Sandy SDOR', doneMessage = "Check your ride out at the Liqour Parking on the other side of the road" }
    }
}

Config.Allowed = {
    ['buccaneer'] = {
        ['lowrider'] = { value = "buccaneer2", title = "Lowrider Buccaneer"},
    },
    ['faction'] = {
        ['lowrider'] = { value = "faction2", title = "Lowrider Faction"},
        ['donk'] = { value = "faction3", title = "Donk Buccaneer"}
    },
    ['peyote'] = {
        ['lowrider'] = { value = "peyote3", title = "Lowrider Peyote"},
        ['drag'] = { value = "peyote2", title = "Drag Peyote" }
    },
    ['ratloader'] = {
        ['resto'] = { value = "ratloader2", title = "Lowrider Ratloader"},
    },
    ['voodoo2'] = {
        ['lowrider'] = { value = "voodoo", title = "Lowrider Voodoo", price = Config.Types.lowrider.price + 2000},
    },
    ['yosemite'] = {
        ['drift'] = { value = "yosemite2", title = "Drift Yosemite"},
        ['raised'] = { value = "yosemite3", title = "Raised Yosemite"},
    },
    ['glendale'] = {
        ['lowrider'] = { value = "glendale2", title = "Lowrider Glendale"},
    },
    ['primo'] = {
        ['lowrider'] = { value = "primo2", title = "Lowrider Primo"},
    },
    ['tampa'] = {
        ['drift'] = { value = "tampa2", title = "Drift Tampa"},
    },
    ['btype'] = {
        ['drag'] = { value = "btype2", title = "Franken Strange"},
    },
    ['btype3'] = {
        ['drag'] = { value = "btype2", title = "Franken Strange"},
    },
    ['manana'] = {
        ['lowrider'] = { value = "manana2", title = "Lowrider Manana"},
    },
    ['tornado3'] = {
        ['resto'] = { value = "tornado", title = "Restored Tornado"},
        ['drag'] = { value = "tornado", title = "Drag Tornado"},
    },
    ['tornado'] = {
        ['lowrider'] = { value = "tornado5", title = "Lowrider Tornado"},
    },
    ['tornado2'] = {
        ['lowrider'] = { value = "tornado5", title = "Lowrider Tornado"},
    },
    ['banshee'] = {
        ['widebody'] = { value = "banshee2", title = "Widebody Banshee"},
    },
    ['minivan'] = {
        ['lowrider'] = { value = "minivan2", title = "Lowrider Minivan"},
    },
    ['moonbeam'] = {
        ['lowrider'] = { value = "moonbeam2", title = "Lowrider Moonbeam"},
    },
    ['mesa'] = {
        ['raised'] = { value = "mesa3", title = "Hill Climber Mesa"},
    },
    ['caddy2'] = {
        ['resto'] = { value = "caddy", title = "Fancy Caddy"},
    },
}