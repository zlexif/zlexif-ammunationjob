Config = {}


Config.Notifications = "ps" -- Define your notification system preference here: "ps", "qb", or "k5"
Config.Job = "ammunation" -- Job
Config.JimPayments = true 
Config.Target = "qb-target" 
Config.Input = "qb-input" 
Config.InvLink = "qb-inventory/html/images/"



Config.Blip = {
	Enable = true,
	Location = vector3(17.58, -1114.21, 29.8),
	Sprite = 110,
	Display = 2,
	Scale = 0.9,
	Colour = 55,
	Name = "Pillbox Hill Ammunation",
}




Config.Stashes = {
    ['ammunation1'] = {
        stashName = "Stash One",
        coords = vector3(20.47, -1105.47, 29.8),
        length = 2.2,
        width = 0.8,
        heading = 70,
        minZ = 26.0,
        maxZ = 30.0,
        jobrequired = true,
        stashSize = 100000,
        stashSlots = 30
    },
    -- Add more stashes as needed
}

Config.Targets = {
    WeaponsCraft = {
        coords = vector3(22.7, -1104.32, 29.8),
        size = { x = 0.6, y = 6 },
        options = {
            heading = 340,
            minZ = 26.4,
            maxZ = 30.4,
            icon = "fa-solid fa-gun",
            label = "Weapons Crafts",
            job = Config.Job,
            action = function() CraftCatalogMenu() end,
            distance = 2.0
        }
    },
    Billing = {
        coords = vector3(23.7, -1106.52, 29.8),
        size = { x = 0.5, y = 0.5 },
        options = {
            heading = 340,
            minZ = 26.4,
            maxZ = 30.4,
            icon = "fa-solid fa-money-bill",
            label = "Bill",
            job = Config.Job,
            event = "zlexif-ammunation:Client:Invoicing",
            distance = 2.0
        }
    },
    Duty = {
        coords = vector3(6.01, -1099.92, 29.8),
        size = { x = 1, y = 1 },
        options = {
            heading = 340,
            minZ = 26.8,
            maxZ = 30.8,
            icon = "fa-solid fa-clipboard-list",
            label = "Duty",
            job = Config.Job,
            action = function() Duty() end,
            distance = 2.0
        }
    },
    BusinessMenu = {
        coords = vector3(12.26, -1106.53, 29.8),
        size = { x = 1, y = 1 },
        options = {
            heading = 340,
            minZ = 27.2,
            maxZ = 31.2,
            icon = "fa-solid fa-briefcase",
            label = "Business Menu",
            job = Config.Job,
            event = "qb-bossmenu:client:OpenMenu",
            distance = 2.0
        }
    },
    Wardrobe = {
        coords = vector3(3.19, -1106.14, 30.03),
        size = { x = 1, y = 5 },
        options = {
            heading = 70,
            minZ = 26.83,
            maxZ = 30.83,
            icon = "fa-solid fa-shirt",
            label = "Wardrobe",
            job = Config.Job,
            event = "qb-clothing:client:openOutfitMenu",
            distance = 2.0
        }
    }
}


Config.Weapons = {
    ["weapon_pistol"] = { 
        hash = "weapon_pistol", 
        label = "Pistol",
        materials = {
            [1] = { item = "iron",               amount = 300 },
            [2] = { item = "steel",              amount = 300 },
            [3] = { item = "plastic",            amount = 220 },
            [4] = { item = "aluminum",           amount = 100 },
        }
    },
    ["weapon_combatpistol"] = { 
        hash = "weapon_combatpistol", 
        label = "Combat Pistol",
        materials = {
            [1] = { item = "iron",               amount = 325 },
            [2] = { item = "steel",              amount = 325 },
            [3] = { item = "plastic",            amount = 245 },
            [4] = { item = "aluminum",           amount = 125 },
        }
    },
    ["weapon_appistol"] = { 
        hash = "weapon_appistol", 
        label = "AP Pistol",
        materials = {
            [1] = { item = "iron",               amount = 350 },
            [2] = { item = "steel",              amount = 350 },
            [3] = { item = "plastic",            amount = 270 },
            [4] = { item = "aluminum",           amount = 180 },
            [5] = { item = "rubber",             amount = 100 },
        }
    },
}



Config.Ammo = {
    ["pistol_ammo"] = { 
        hash = "pistol_ammo", 
        label = "Pistol Ammo",
        materials = {
            [1] = { item = "iron",               amount = 50 },
            [2] = { item = "plastic",              amount = 25 },
            [3] = { item = "aluminum",              amount = 25 },
            [4] = { item = "rolling_paper",              amount = 5 },
        }
    },
    ["smg_ammo"] = { 
        hash = "smg_ammo", 
        label = "SMG Ammo",
        materials = {
            [1] = { item = "iron",               amount = 70 },
            [2] = { item = "plastic",              amount = 35 },
            [3] = { item = "aluminum",              amount = 40 },
            [4] = { item = "rolling_paper",              amount = 10 },
        }
    },
    ["rifle_ammo"] = { 
        hash = "rifle_ammo", 
        label = "Rifle Ammo",
        materials = {
            [1] = { item = "iron",               amount = 100 },
            [2] = { item = "plastic",              amount = 45 },
            [3] = { item = "aluminum",              amount = 50 },
            [4] = { item = "rolling_paper",              amount = 20 },
        }
    },
    ["shotgun_ammo"] = { 
        hash = "shotgun_ammo", 
        label = "Shotgun Ammo",
        materials = {
            [1] = { item = "iron",               amount = 150 },
            [2] = { item = "plastic",              amount = 65 },
            [3] = { item = "aluminum",              amount = 65 },
            [4] = { item = "rolling_paper",              amount = 35 },
        }
    },
}

