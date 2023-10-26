
Config = {}


-- ██╗░░░██╗████████╗██╗██╗░░░░░██╗████████╗██╗░░░██╗
-- ██║░░░██║╚══██╔══╝██║██║░░░░░██║╚══██╔══╝╚██╗░██╔╝
-- ██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░╚████╔╝░
-- ██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░░╚██╔╝░░
-- ╚██████╔╝░░░██║░░░██║███████╗██║░░░██║░░░░░░██║░░░
-- ░╚═════╝░░░░╚═╝░░░╚═╝╚══════╝╚═╝░░░╚═╝░░░░░░╚═╝░░░

Config.CoreName = "qb-core" -- Core name
Config.Job = "ammunation" -- Job
Config.JimPayments = true -- Using jim-payments?
Config.Target = "qb-target" -- Name of your resource qb-target
Config.Input = "qb-input" -- Name of your resource qb-input
Config.InvLink = "qb-inventory/html/images/" -- Your directory images inventory
Config.Bossmenu = "qb-bossmenu:client:OpenMenu" -- Your trigger to open boss menu

-- ██████╗░██╗░░░░░██╗██████╗░
-- ██╔══██╗██║░░░░░██║██╔══██╗
-- ██████╦╝██║░░░░░██║██████╔╝
-- ██╔══██╗██║░░░░░██║██╔═══╝░
-- ██████╦╝███████╗██║██║░░░░░
-- ╚═════╝░╚══════╝╚═╝╚═╝░░░░░

Config.Blip = {
	Enable = false,
	Location = vector3(17.58, -1114.21, 29.8),
	Sprite = 110,
	Display = 2,
	Scale = 0.9,
	Colour = 55,
	Name = "Ammunation",
}


-- ░██████╗████████╗░█████╗░░██████╗██╗░░██╗
-- ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║░░██║
-- ╚█████╗░░░░██║░░░███████║╚█████╗░███████║
-- ░╚═══██╗░░░██║░░░██╔══██║░╚═══██╗██╔══██║
-- ██████╔╝░░░██║░░░██║░░██║██████╔╝██║░░██║
-- ╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝

Config.Stash = {
	StashInvTrigger = "inventory:client:SetCurrentStash",
	OpenInvTrigger = "inventory:server:OpenInventory",
	NameOfStash = "ammunation_storage",
	MaxWeighStash = 250000,
	MaxSlotsStash = 150,
}


-- ██████╗░██╗██╗░░░░░██╗░░░░░██╗███╗░░██╗░██████╗░
-- ██╔══██╗██║██║░░░░░██║░░░░░██║████╗░██║██╔════╝░
-- ██████╦╝██║██║░░░░░██║░░░░░██║██╔██╗██║██║░░██╗░
-- ██╔══██╗██║██║░░░░░██║░░░░░██║██║╚████║██║░░╚██╗
-- ██████╦╝██║███████╗███████╗██║██║░╚███║╚██████╔╝
-- ╚═════╝░╚═╝╚══════╝╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░

Config.Billing = {
	EnableCommand = false,
	Command = "billam",
}


-- ░██████╗██╗░░██╗░█████╗░██████╗░
-- ██╔════╝██║░░██║██╔══██╗██╔══██╗
-- ╚█████╗░███████║██║░░██║██████╔╝
-- ░╚═══██╗██╔══██║██║░░██║██╔═══╝░
-- ██████╔ ██║░░██║╚█████╔╝██║░░░░░
-- ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░

Config.Items = {
    [1] = { name = "pistol_defaultclip", price = 25, amount = 100, info = {}, type = "item", slot = 1 },
    [2] = { name = "pistol_extendedclip", price = 50, amount = 100, info = {}, type = "item", slot = 2, },
    [3] = { name = "pistol_flashlight", price = 30, amount = 100, info = {}, type = "item", slot = 3, },
    [4] = { name = "pistol_suppressor", price = 60, amount = 100, info = {}, type = "item", slot = 4, },
    [5] = { name = "pistol_luxuryfinish", price = 1000, amount = 100, info = {}, type = "item", slot = 5, },
    [6] = { name = "combatpistol_defaultclip", price = 30, amount = 100, info = {}, type = "item", slot = 6, },
    [7] = { name = "combatpistol_extendedclip", price = 60, amount = 100, info = {}, type = "item", slot = 7, },
    [8] = { name = "combatpistol_luxuryfinish", price = 1500, amount = 100, info = {}, type = "item", slot = 8, },
    [9] = { name = "appistol_defaultclip", price = 50, amount = 100, info = {}, type = "item", slot = 9, },
    [10] = { name = "appistol_extendedclip", price = 100, amount = 100, info = {}, type = "item", slot = 10, },
    [11] = { name = "appistol_luxuryfinish", price = 2000, amount = 100, info = {}, type = "item", slot = 11, }
}

-- ░█████╗░██████╗░░█████╗░███████╗████████╗░██████╗
-- ██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝
-- ██║░░╚═╝██████╔╝███████║█████╗░░░░░██║░░░╚█████╗░
-- ██║░░██╗██╔══██╗██╔══██║██╔══╝░░░░░██║░░░░╚═══██╗
-- ╚█████╔╝██║░░██║██║░░██║██║░░░░░░░░██║░░░██████╔╝
-- ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░

-- Craft Weapons
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


-- Craft Ammo

Config.Ammo = {
    ["pistol_ammo"] = { 
        hash = "pistol_ammo", 
        label = "Pistol Ammo",
        materials = {
            [1] = { item = "iron",               amount = 50 },
            [2] = { item = "ducttape",         amount = 5 },
            [3] = { item = "plastic",              amount = 25 },
            [4] = { item = "aluminum",              amount = 25 },
            [5] = { item = "rolling_paper",              amount = 5 },
        }
    },
    ["smg_ammo"] = { 
        hash = "smg_ammo", 
        label = "SMG Ammo",
        materials = {
            [1] = { item = "iron",               amount = 70 },
            [2] = { item = "ducttape",         amount = 10 },
            [3] = { item = "plastic",              amount = 35 },
            [4] = { item = "aluminum",              amount = 40 },
            [5] = { item = "rolling_paper",              amount = 10 },
        }
    },
    ["rifle_ammo"] = { 
        hash = "rifle_ammo", 
        label = "Rifle Ammo",
        materials = {
            [1] = { item = "iron",               amount = 100 },
            [2] = { item = "ducttape",         amount = 20 },
            [3] = { item = "plastic",              amount = 45 },
            [4] = { item = "aluminum",              amount = 50 },
            [5] = { item = "rolling_paper",              amount = 20 },
        }
    },
    ["shotgun_ammo"] = { 
        hash = "shotgun_ammo", 
        label = "Shotgun Ammo",
        materials = {
            [1] = { item = "iron",               amount = 150 },
            [2] = { item = "ducttape",         amount = 35 },
            [3] = { item = "plastic",              amount = 65 },
            [4] = { item = "aluminum",              amount = 65 },
            [5] = { item = "rolling_paper",              amount = 35 },
        }
    },
}

