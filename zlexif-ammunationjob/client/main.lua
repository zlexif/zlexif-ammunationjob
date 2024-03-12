local QBCore = exports['qb-core']:GetCoreObject()
local currentStashKey = nil

function Duty()
    TriggerServerEvent("QBCore:ToggleDuty")
end

CreateThread(function()
    if Config.Blip.Enable then
        local blip = AddBlipForCoord(Config.Blip.Location) 
        SetBlipSprite(blip, Config.Blip.Sprite) 
        SetBlipDisplay(blip, Config.Blip.Display)
        SetBlipScale(blip, Config.Blip.Scale)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, Config.Blip.Colour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Blip.Name) 
        EndTextCommandSetBlipName(blip)
    end
end)


AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    onDuty = player.job.onduty
end)

function CustomNotify(msg, type, length)
    if Config.Notifications == "ps" then
        exports['ps-ui']:Notify(msg, type, length)
    elseif Config.Notifications == "qb" then
        QBCore.Functions.Notify(msg, type, length)
    elseif Config.Notifications == "k5" then
        exports["k5_notify"]:notify(type, msg, type, length)
    else
        print("Invalid notification type specified in Config.")
    end
end

for stashKey, stashConfig in pairs(Config.Stashes) do
    exports[Config.Target]:AddBoxZone(stashKey, stashConfig.coords, stashConfig.length, stashConfig.width, {
        name = stashKey,
        heading = stashConfig.heading,
        debugPoly = false, 
        minZ = stashConfig.minZ,
        maxZ = stashConfig.maxZ
    }, {
        options = {
            {
                icon = "fas fa-box",
                label = "Open Stash",
                action = function()
                    Stash(stashKey) 
                end,
            }
        },
        distance = 2.5
    })
end

function Stash(stashName)
    print("Trying to access stash:", stashName) 
    local stashConfig = Config.Stashes[stashName]
    if not stashConfig then
        print("Stash config not found for:", stashName) 
        CustomNotify("Stash not found.", "error", 5000) 
        return
    end

    print("Stash found:", stashName, "Opening...") 

    TriggerEvent("inventory:client:SetCurrentStash", stashName)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
        maxweight = stashConfig.stashSize,
        slots = stashConfig.stashSlots
    })
end

function AttemptRegisterTarget(key, target)
    local success = exports[Config.Target]:AddBoxZone(key, target.coords, target.size.x, target.size.y, 
        {
            name = key,
            heading = target.options.heading,
            debugPoly = false,
            minZ = target.options.minZ, 
            maxZ = target.options.maxZ
        }, 
        {
            options = { 
                {
                    event = target.options.event,
                    icon = target.options.icon,
                    label = target.options.label,
                    job = Config.Job,
                    action = target.options.action
                } 
            },
            distance = target.options.distance
        }
    )

    if not success then
        Citizen.Wait(5000) 
        AttemptRegisterTarget(key, target) 
    end
end

for key, target in pairs(Config.Targets) do
    if key == "Billing" or key == "Duty" then
        Citizen.CreateThread(function()
            AttemptRegisterTarget(key, target)
        end)
    else
        exports[Config.Target]:AddBoxZone(key, target.coords, target.size.x, target.size.y, 
            {
                name = key,
                heading = target.options.heading,
                debugPoly = false,
                minZ = target.options.minZ, 
                maxZ = target.options.maxZ
            }, 
            {
                options = { 
                    {
                        event = target.options.event,
                        icon = target.options.icon,
                        label = target.options.label,
                        job = Config.Job,
                        action = target.options.action
                    } 
                },
                distance = target.options.distance
            }
        )
    end
end




-- || ===============> Invoice
 
RegisterNetEvent('zlexif-ammunation:Client:Invoicing', function()
    print("Invoicing event triggered") 
    if Config.JimPayments then
        print("Triggering JimPayments") 
        TriggerEvent("jim-payments:client:Charge", Config.Job)
    else
        print("Showing input for manual billing") 
        local dialog = exports[Config.Input]:ShowInput({
            header = Language.Input.Header,
            submitText = Language.Input.Submit,
            inputs = {
                { type = 'number', isRequired = true, name = 'id', text = Language.Input.Paypal },
                { type = 'number', isRequired = true, name = 'amount', text = Language.Input.Amount }
            }
        })
        if dialog then
            if not dialog.id or not dialog.amount then
                print("Input dialog data incomplete", dialog)
                return
            end
            print("Sending billing data to server", dialog.id, dialog.amount)
            TriggerServerEvent("zlexif-ammunation:Server:Billing", dialog.id, dialog.amount)
        else
            print("Dialog canceled or closed") 
        end
    end
end)

    function CraftCatalogMenu()
    local menuItems = {
        {header = Language.Menu.CraftingCatalog, isMenuHeader = true},
        {
            header = Language.Menu.Weapons,
            txt = Language.Menu.WeaponsDescription,
            params = {event = "zlexif-ammunation:client:OpenWeaponsCraftMenu"}
        },
        {
            header = Language.Menu.Ammo,
            txt = Language.Menu.AmmoDescription,
            params = {event = "zlexif-ammunation:client:OpenAmmoCraftMenu"}
        },
        {
            header = Language.Menu.Exit,
            txt = "",
            params = {event = ""}
        }
    }
    exports['qb-menu']:openMenu(menuItems)
end
    
    RegisterNetEvent('zlexif-ammunation:client:OpenWeaponsCraftMenu', function()
        CraftWeaponsMenu()
    end)
    
    RegisterNetEvent('zlexif-ammunation:client:OpenAmmoCraftMenu', function()
        CraftAmmoMenu()
    end)

    function CraftWeaponsMenu()
        local columns = {{header = Language.Menu.Weapons, isMenuHeader = true}}
        for k, v in pairs(Config.Weapons) do
            local item = {}
            item.header = "<img src=nui://"..Config.InvLink..QBCore.Shared.Items[v.hash].image.." width=35px style='margin-right: 10px'> " .. v.label
            local text = Language.Menu.Required.." <br>"
            for _, material in pairs(v.materials) do
                text = text .. "- " .. QBCore.Shared.Items[material.item].label .. ": " .. material.amount .. "<br>"
            end
            item.text = text
            item.params = {
                event = 'zlexif-ammunation:client:CraftWeapons',
                args = { type = k }
            }
            table.insert(columns, item)
        end
    
        table.insert(columns, {
            header = Language.Menu.Return,
            txt = "",
            params = {
                event = "zlexif-ammunation:client:OpenCatalogMenu" 
            }
        })
        
        exports['qb-menu']:openMenu(columns)
    end
    
RegisterNetEvent('zlexif-ammunation:client:OpenCatalogMenu', function()
    CraftCatalogMenu()
end)

function CraftWeapons(weapon)
    if lib.progressCircle({
        duration = 7000, 
        label = "Combining the parts...",
        position = 'bottom',
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false,
        },
        anim = {
            dict = "amb@world_human_hammering@male@base",
            clip = "base",
        },
        prop = {
            model = `prop_tool_hammer`, 
            bone = 57005, 
            pos = vector3(0.12, 0.0, -0.02), 
            rot = vector3(90.0, 0.0, 0.0), 
        },
    }) then
        if lib.progressCircle({
            duration = 9000, 
            label = Language.Progressbars.Make..Config.Weapons[weapon].label, 
            position = 'bottom',
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false,
            },
            anim = {
                dict = "mini@repair", 
                clip = "fixing_a_ped",
            },
        }) then
            CustomNotify(Language.Notify.Make..Config.Weapons[weapon].label, 'success', 5000)
            TriggerServerEvent('zlexif-ammunation:server:CraftWeapons', Config.Weapons[weapon].hash)
            for k, v in pairs(Config.Weapons[weapon].materials) do
                TriggerServerEvent('zlexif-ammunation:Server:RemoveItem', v.item, v.amount)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
            end
            ClearPedTasks(PlayerPedId())
        else
            CustomNotify(Language.Notify.Canceled, 'error', 6000)
        end
    else
        CustomNotify(Language.Notify.Canceled, 'error', 6000)
    end
end


RegisterNetEvent('zlexif-ammunation:client:CraftWeapons', function(data)
    QBCore.Functions.TriggerCallback("zlexif-ammunation:server:Materials", function(hasMaterials, missingMaterials)
        if hasMaterials then
            CraftWeapons(data.type)
        else
            local missingItemsText = "Missing materials:"
            for _, missing in pairs(missingMaterials) do
                local itemName = QBCore.Shared.Items[missing.item] and QBCore.Shared.Items[missing.item].label or "Unknown"
                missingItemsText = missingItemsText .. "\n" .. itemName .. " - Required: " .. missing.required .. ", You have: " .. missing.present
            end
            CustomNotify(Language.Notify.NoMaterials .. "\n" .. missingItemsText, 'error', 15000)
        end
    end, Config.Weapons[data.type].materials)
end)


function CraftAmmoMenu()
    local columns = { { header = Language.Menu.Ammo, isMenuHeader = true },}
    for k, v in pairs(Config.Ammo) do
        local item = {}
        item.header = "<img src=nui://"..Config.InvLink..QBCore.Shared.Items[v.hash].image.." width=35px style='margin-right: 10px'> " .. v.label
        local text = Language.Menu.Required.." <br>"
        for _, material in pairs(v.materials) do
            text = text .. "- " .. QBCore.Shared.Items[material.item].label .. ": " .. material.amount .. "<br>"
        end
        item.text = text
        item.params = { event = 'zlexif-ammunation:client:CraftAmmo', args = { type = k } }
        table.insert(columns, item)
    end

    table.insert(columns, {
        header = Language.Menu.Return,
        txt = "",
        params = {
            event = "zlexif-ammunation:client:OpenCatalogMenu"
        }
    })

    exports['qb-menu']:openMenu(columns)
end


function CraftAmmo(weapon)
    if lib.progressCircle({
        duration = 6000, 
        label = "Combining The Parts...", 
        position = 'bottom',
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false,
        },
        anim = {
            dict = "amb@world_human_hammering@male@base", 
            clip = "base",
        },
        prop = {
            model = `prop_tool_hammer`, 
            bone = 57005, 
            pos = vector3(0.12, 0.0, -0.02), 
            rot = vector3(90.0, 0.0, 0.0), 
        },
    }) then
        if lib.progressCircle({
            duration = 9500, 
            label = Language.Progressbars.Make..Config.Ammo[weapon].label, 
            position = 'bottom',
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false,
            },
            anim = {
                dict = "mini@repair", 
                clip = "fixing_a_ped",
            },
        }) then
            CustomNotify(Language.Notify.Make..Config.Ammo[weapon].label, 'success', 6000)
            TriggerServerEvent('zlexif-ammunation:server:CraftAmmo', Config.Ammo[weapon].hash)
            for k, v in pairs(Config.Ammo[weapon].materials) do
                TriggerServerEvent('zlexif-ammunation:Server:RemoveItem', v.item, v.amount)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
            end
            ClearPedTasks(PlayerPedId())
        else
            CustomNotify(Language.Notify.Canceled, 'error', 6000)
        end
    else
        CustomNotify(Language.Notify.Canceled, 'error', 6000)
    end
end


RegisterNetEvent('zlexif-ammunation:client:CraftAmmo', function(data)
    QBCore.Functions.TriggerCallback("zlexif-ammunation:server:Materials", function(hasMaterials, missingMaterials)
        if hasMaterials then
            CraftAmmo(data.type)
        else
            local missingItemsText = "Missing materials:"
            for _, missing in pairs(missingMaterials) do
                local itemName = QBCore.Shared.Items[missing.item] and QBCore.Shared.Items[missing.item].label or "Unknown"
                missingItemsText = missingItemsText .. "\n" .. itemName .. " - Required: " .. missing.required .. ", You have: " .. missing.present
            end
            CustomNotify(Language.Notify.NoMaterials .. "\n" .. missingItemsText, 'error', 15000)
        end
    end, Config.Ammo[data.type].materials)
end)
