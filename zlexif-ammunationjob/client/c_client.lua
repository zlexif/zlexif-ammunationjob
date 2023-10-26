local QBCore = exports['qb-core']:GetCoreObject()

----------------------------------------------------
--------- Blips
----------------------------------------------------
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

----------------------------------------------------
--------- Events
----------------------------------------------------

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    onDuty = player.job.onduty
end)

RegisterNetEvent('zlexif-ammunation:Client:Notify')
AddEventHandler("zlexif-ammunation:Client:Notify", function(msg,type)
    Notify(msg,type)
end)

AddEventHandler("zlexif-ammunation:Client:Storage", function()
    TriggerEvent(Config.Stash.StashInvTrigger, Config.Stash.NameOfStash)
    TriggerServerEvent(Config.Stash.OpenInvTrigger, "stash", Config.Stash.NameOfStash, {
        maxweight = Config.Stash.MaxWeighStash,
        slots = Config.Stash.MaxSlotsStash,
    })
end)

AddEventHandler("zlexif-ammunation:Client:OpenTray01", function()
    TriggerEvent(Config.Stash.StashInvTrigger, "Tray01")
    TriggerServerEvent(Config.Stash.OpenInvTrigger, "stash", "Tray01", {
        maxweight = 10000,
        slots = 10,
    })
end)

AddEventHandler("zlexif-ammunation:Client:OpenTray02", function()
    TriggerEvent(Config.Stash.StashInvTrigger, "Tray02")
    TriggerServerEvent(Config.Stash.OpenInvTrigger, "stash", "Tray02", {
        maxweight = 10000,
        slots = 10,
    })
end)

AddEventHandler("zlexif-ammunation:Client:OpenTray03", function()
    TriggerEvent(Config.Stash.StashInvTrigger, "Tray03")
    TriggerServerEvent(Config.Stash.OpenInvTrigger, "stash", "Tray03", {
        maxweight = 10000,
        slots = 10,
    })
end)

AddEventHandler("zlexif-ammunation:Client:OpenTray04", function()
    TriggerEvent(Config.Stash.StashInvTrigger, "Tray04")
    TriggerServerEvent(Config.Stash.OpenInvTrigger, "stash", "Tray04", {
        maxweight = 10000,
        slots = 10,
    })
end)

RegisterNetEvent("zlexif-ammunation:Client:OpenShop", function(index)
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "armory", {
        label = "armory",
        items = Config.Items,
        slots = #Config.Items,
    })
end);

AddEventHandler('zlexif-ammunation:Client:Sit', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"sitchair"})
end)

-- || ===============> Invoice
 
RegisterNetEvent('zlexif-ammunation:Client:Invoicing', function()
    if Config.JimPayments then
        TriggerEvent("jim-payments:client:Charge", Config.Job)
    else
        local dialog = exports[Config.Input]:ShowInput({
            header = Language.Input.Header,
            submitText = Language.Input.Submit,
            inputs = {
                { type = 'number', isRequired = true, name = 'id', text = Language.Input.Paypal },
                { type = 'number', isRequired = true, name = 'amount', text = Language.Input.Amount }
            }
        })
        if dialog then
            if not dialog.id or not dialog.amount then return end
            TriggerServerEvent("zlexif-ammunation:Server:Billing", dialog.id, dialog.amount)
        end
    end
end)

if Config.Billing.EnableCommand then
    if Config.JimPayments then
        TriggerEvent("jim-payments:client:Charge", Config.Job)
    else
        RegisterCommand(Config.Billing.Command, function()
            local dialog = exports[Config.Input]:ShowInput({
                header = Language.Input.Header,
                submitText = Language.Input.Submit,
                inputs = {
                    { type = 'number', isRequired = true, name = 'id', text = Language.Input.Paypal },
                    { type = 'number', isRequired = true, name = 'amount', text = Language.Input.Amount }
                }
            })
            if dialog then
                if not dialog.id or not dialog.amount then return end
                TriggerServerEvent("zlexif-ammunation:Server:Billing", dialog.id, dialog.amount)
            end
        end)
    end
end

function CraftWeaponsMenu()
    local columns = { { header = Language.Menu.Weapons, isMenuHeader = true, }, }
    for k, v in pairs(Config.Weapons) do
        local item = {}
        item.header = "<img src=nui://"..Config.InvLink..QBCore.Shared.Items[v.hash].image.." width=35px style='margin-right: 10px'> " .. v.label
        local text = Language.Menu.Required.." <br>"
        for k, v in pairs(v.materials) do
            text = text .. "- " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "<br>"
        end
        item.text = text
        item.params = { event = 'zlexif-ammunation:client:CraftWeapons', args = { type = k } }
        table.insert(columns, item)
    end
    exports['qb-menu']:openMenu(columns)
end

function CraftWeapons(weapon)
    QBCore.Functions.Progressbar('CraftWeapons', Language.Progressbars.Make..Config.Weapons[weapon].label, 5000, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, { animDict = "mini@repair", anim = "fixing_a_ped", }, {}, {}, function()
        Notify(Language.Notify.Make..Config.Weapons[weapon].label, 'success', 5000)
        TriggerServerEvent('zlexif-ammunation:server:CraftWeapons', Config.Weapons[weapon].hash)
        for k, v in pairs(Config.Weapons[weapon].materials) do
             TriggerServerEvent('zlexif-ammunation:Server:RemoveItem', v.item, v.amount)
             TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
        end
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        Notify(Language.Notify.Canceled, 'error', 6000)
    end)
end

RegisterNetEvent('zlexif-ammunation:client:CraftWeapons', function(data)
    QBCore.Functions.TriggerCallback("zlexif-ammunation:server:Materials", function(hasMaterials)
        if (hasMaterials) then
            CraftWeapons(data.type)
        else
            Notify(Language.Notify.NoMaterials, 'error', 6000)
            return
        end
    end, Config.Weapons[data.type].materials)
end)

function CraftAmmoMenu()
    local columns = { { header = Language.Menu.Ammo, isMenuHeader = true },}
    for k, v in pairs(Config.Ammo) do
        local item = {}
        item.header = "<img src=nui://"..Config.InvLink..QBCore.Shared.Items[v.hash].image.." width=35px style='margin-right: 10px'> " .. v.label
        local text = Language.Menu.Required.." <br>"
        for k, v in pairs(v.materials) do
            text = text .. "- " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "<br>"
        end
        item.text = text
        item.params = { event = 'zlexif-ammunation:client:CraftAmmo', args = { type = k } }
        table.insert(columns, item)
    end
    exports['qb-menu']:openMenu(columns)
end

function CraftAmmo(weapon)
    QBCore.Functions.Progressbar('CraftAmmo', Language.Progressbars.Make..Config.Ammo[weapon].label, 6000, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, { animDict = "mini@repair", anim = "fixing_a_ped", }, {}, {}, function()
        Notify(Language.Notify.Make..Config.Ammo[weapon].label, 'success', 6000)
        TriggerServerEvent('zlexif-ammunation:server:CraftAmmo', Config.Ammo[weapon].hash)
        for k, v in pairs(Config.Ammo[weapon].materials) do
             TriggerServerEvent('zlexif-ammunation:Server:RemoveItem', v.item, v.amount)
             TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
        end
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        Notify(Language.Notify.Canceled, 'error', 6000)
    end)
end

RegisterNetEvent('zlexif-ammunation:client:CraftAmmo', function(data)
    QBCore.Functions.TriggerCallback("zlexif-ammunation:server:Materials", function(hasMaterials)
        if (hasMaterials) then
            CraftAmmo(data.type)
        else
            Notify(Language.Notify.NoMaterials, 'error', 6000)
            return
        end
    end, Config.Ammo[data.type].materials)
end)
