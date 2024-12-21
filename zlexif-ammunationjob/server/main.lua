local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('zlexif-ammunation:Server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)

RegisterNetEvent('zlexif-ammunation:server:CraftWeapons', function(data, weapon)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local receiveAmount = 1
    Player.Functions.AddItem(data, receiveAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[data], "add")
end)

RegisterNetEvent('zlexif-ammunation:server:CraftAmmo', function(data, weapon)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local receiveAmount = 1
    Player.Functions.AddItem(data, receiveAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[data], "add")
end)


QBCore.Functions.CreateCallback('zlexif-ammunation:server:Materials', function(source, cb, materials)
    local player = QBCore.Functions.GetPlayer(source)
    local missingMaterials = {}

    for k, v in pairs(materials) do
        local item = player.Functions.GetItemByName(v.item)
        if not item or item.amount < v.amount then
            table.insert(missingMaterials, {item = v.item, required = v.amount, present = item and item.amount or 0})
        end
    end

    if #missingMaterials > 0 then
        cb(false, missingMaterials)
    else
        cb(true)
    end
end)

RegisterServerEvent('zlexif-ammunation:server:RequestStashAccess', function(stashKey)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local stashConfig = Config.Stashes[stashKey]

    if stashConfig then
        if stashConfig.jobrequired and ply.PlayerData.job.name ~= Config.Job then
            TriggerClientEvent('QBCore:Notify', src, 'You do not have permission to access this stash.', 'error')
            return
        end

        TriggerClientEvent('zlexif-ammunation:client:OpenStash', src, stashConfig)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Stash configuration not found.', 'error')
    end
end)



RegisterNetEvent("zlexif-ammunation:Server:Billing", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == Config.Job then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.Async.execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                    TriggerClientEvent("qb-phone:RefreshPhone", billed.PlayerData.source)
                    TriggerClientEvent('zlexif-ammunation:Client:Notify', source, Language.Notify.Send, 'success', 5000)
                    TriggerClientEvent('zlexif-ammunation:Client:Notify', billed.PlayerData.source, Language.Notify.InvoiceReceived)
                else
                    TriggerClientEvent('zlexif-ammunation:Client:Notify', source, Language.Notify.HigherValue, 'error', 5000)
                end
            else
                TriggerClientEvent('zlexif-ammunation:Client:Notify', source, Language.Notify.InvoiceOwn, 'error', 5000)
            end
        else
            TriggerClientEvent('zlexif-ammunation:Client:Notify', source, Language.Notify.PlayerOffline, 'error', 5000)
        end
    else
        TriggerClientEvent('zlexif-ammunation:Client:Notify', source, Language.Notify.NoPermission, 'error', 5000)
    end
end)

