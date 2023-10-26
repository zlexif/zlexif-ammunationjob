
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
    local src = source
    local tem = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            tem = tem + 1
            if tem == #materials then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)
