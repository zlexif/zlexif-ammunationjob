local QBCore = exports['qb-core']:GetCoreObject()

----------------------------------------------------
--------- TARGETS
----------------------------------------------------

-- || ===============> Stash
exports[Config.Target]:AddBoxZone("StashAmmunation", vector3(21.4, -1105.8, 29.8), 0.7, 4, 
    { name="StashAmmunation", heading = 340, debugPoly = false, minZ = 26.2, maxZ = 30.2 }, 
    { options = { {  event = "zlexif-ammunation:Client:Storage", icon = "fas fa-box", label = "Stash", job = Config.Job }, },  distance = 2.0 })
    -- || ===============> Stash 2  - COPY THIS FORMAT IF U WANT TO CREATE MORE STASHES. MAKE SURE TO CREATE A POLYZONE FIRST.
--exports[Config.Target]:AddBoxZone("BLANK", vector3(0, 0, 0), 0, 0, 
--{ name="BLANK", heading = 0, debugPoly = false, minZ = 0, maxZ = 0 }, 
--{ options = { {  event = "zlexif-ammunation:Client:Storage", icon = "fas fa-box", label = "Stash", job = Config.Job }, },  distance = 2.0 })
    -- || ===============> Ammo
exports[Config.Target]:AddBoxZone("AmmoCraft",vector3(22.7, -1104.32, 29.8), 0.6, 6, 
    { name="AmmoCraft", heading = 340, debugPoly = false, minZ = 26.4, maxZ = 30.4 }, 
    { options = { {   action = function() CraftDrinksMenu() end, icon = "fa-solid fa-gun", label = "Ammo Crafts", job = Config.Job }, },  distance = 2.0 })
-- || ===============>  2 - COPY THIS FORMAT IF U WANT TO CREATE MORE AMMO CRAFTING PLACES. MAKE SURE TO CREATE A POLYZONE FIRST.
--exports[Config.Target]:AddBoxZone("Drinks2", vector3(0, 0, 0), 0, 0, 
  --  { name="Drinks2", heading = 0, debugPoly = false, minZ = 0, maxZ = 0 }, 
    --{ options = { {   action = function() CraftDrinksMenu() end, icon = "fa-solid fa-gun", label = "Ammo Crafts", job = Config.Job }, },  distance = 2.0 })
-- || ===============> Weapons
exports[Config.Target]:AddBoxZone("Weapons", vector3(17.19, -1111.4, 29.8), 0.8, 3, 
    { name="Weapons", heading = 70, debugPoly = false, minZ = 26.2, maxZ = 30.2 }, 
    { options = { {   action = function() CraftFoodMenu() end, icon = "fa-solid fa-gun", label = "Weapon Crafts", job = Config.Job }, },  distance = 2.0 })
-- || ===============> Weapons 2
--exports[Config.Target]:AddBoxZone("Weapons2", vector3(0, 0, 0), 0, 0, 
  --  { name="Weapons2", heading = 0, debugPoly = false, minZ = 0, maxZ = 0 }, 
    --{ options = { {   action = function() CraftFoodMenu() end, icon = "fa-solid fa-gun", label = "Food", job = Config.Job }, },  distance = 2.0 })
-- || ===============> Shop Ammunation
--exports[Config.Target]:AddBoxZone("shopammunation", vector3(0, 0, 0), 0, 0, --- > I DIDNT WANT TO ADD AN AMMUNATION SHOP TO MY SERVER BUT IF YOU WANT YOU CAN GO RIGHT AHEAD AND JUST COMMENT OUT THE " - " AND CHANGE THE LOCATION.
  --  { name="shopammunation", heading = 0, debugPoly = false, minZ = 0.0, maxZ = 0.0 }, 
  --  { options = { {   event = "zlexif-ammunation:Client:OpenShop", icon = "fas fa-box", label = "Supplies", job = Config.Job }, },  distance = 3.0 })
-- || ===============> Billing
exports[Config.Target]:AddBoxZone("Billing", vector3(23.7, -1106.52, 29.8), 0.5, 0.5, 
    { name="Billing", heading = 340, debugPoly = false, minZ = 26.4, maxZ = 30.4 }, 
    { options = { {   event = "zlexif-ammunation:Client:Invoicing", icon = "fa-solid fa-money-bill", label = "Bill", job = Config.Job }, },  distance = 2.0 })
-- || ===============> Billing
--exports[Config.Target]:AddBoxZone("Billing2", vector3(0.0, 0.0, 0.0), 0.0, 0.0, 
 --   { name="Billing2", heading = 0, debugPoly = false, minZ = 0.0, maxZ = 0.0 }, 
   -- { options = { {   event = "zlexif-ammunation:Client:Invoicing", icon = "fa-solid fa-money-bill", label = "Bill", job = Config.Job }, },  distance = 2.0 })
-- || ===============> Duty
exports[Config.Target]:AddBoxZone("Duty", vector3(6.01, -1099.92, 29.8), 1, 1, 
    { name="Duty", heading = 340, debugPoly = false, minZ = 26.8, maxZ = 30.8 }, 
    { options = { {   action = function() Duty() end, icon = "fa-solid fa-clipboard-list", label = "Duty", job = Config.Job }, },  distance = 2.0 })
-- || ===============> BossMenu
exports[Config.Target]:AddBoxZone("BusinessMenu", vector3(12.26, -1106.53, 29.8), 1, 1, 
    { name="BusinessMenu", heading = 340, debugPoly = false, minZ = 27.2, maxZ = 31.2 }, 
    { options = { {  event = "qb-bossmenu:client:OpenMenu", icon = "fa-solid fa-briefcase", label = "Business Menu", job = Config.Job }, },  distance = 2.0 })
-- || ===============> Wardrobe
exports[Config.Target]:AddBoxZone("Wardrobe", vector3(3.19, -1106.14, 30.03), 1, 5, 
{ name="Wardrobe", heading = 70, debugPoly = false, minZ = 26.83, maxZ = 30.83 }, 
{ options = { {  event = "qb-clothing:client:openOutfitMenu", icon = "fa-solid fa-shirt", label = "Wardrobe", job = Config.Job}, },  distance = 2.0 })
    -- || ===============> Tray01
--exports[Config.Target]:AddBoxZone("Tray01", vector3(0.0, 0.0, 0.0), 0.0, 0.0, 
  --  { name="Tray01", heading = 0, debugPoly = false, minZ = 0.0, maxZ = 0.0 }, 
  --  { options = { {  event = "zlexif-ammunation:Client:OpenTray01", icon = "fa-solid fa-clipboard-list", label = "Tray" }, },  distance = 2.0 })
-- || ===============> Tray02
--exports[Config.Target]:AddBoxZone("Tray02", vector3(0, 0, 0), 0, 0, 
  --  { name="Tray02", heading = 0, debugPoly = false, minZ = 0, maxZ = 0 }, 
  --  { options = { {  event = "zlexif-ammunation:Client:OpenTray02", icon = "fa-solid fa-clipboard-list", label = "Tray" }, },  distance = 2.0 })
    -- || ===============> Tray03 COPY THIS FORMAT IF YOU WANT TO ADD MORE TRAYS, MAKE SURE YOU CREATE THE POLYZONE FIRST.
--exports[Config.Target]:AddBoxZone("Tray03", vector3(0, 0, 0), 0, 0, 
 --   { name="Tray03", heading = 0, debugPoly = false, minZ = 0, maxZ = 0 }, 
 --   { options = { {  event = "zlexif-ammunation:Client:OpenTray03", icon = "fa-solid fa-clipboard-list", label = "Tray" }, },  distance = 2.0 })
-- || ===============> Tray04
--exports[Config.Target]:AddBoxZone("Tray04", vector3(0, 0, 0), 0, 0, 
 --   { name="Tray04", heading = 0, debugPoly = false, minZ = 0, maxZ = 0 }, 
  --  { options = { {  event = "zlexif-ammunation:Client:OpenTray04", icon = "fa-solid fa-clipboard-list", label = "Tray" }, },  distance = 2.0 })