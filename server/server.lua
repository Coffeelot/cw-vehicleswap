local QBCore = exports['qb-core']:GetCoreObject()

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

RegisterNetEvent('cw-vehicleswap:server:ChangeVehicle', function(plate, vehName, outputGarage, price)
    local src = source
    local id = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
	local Player = QBCore.Functions.GetPlayer(src)
    local currentBank = Player.Functions.GetMoney('bank')
    -- print("price:", price, "Bank:", currentBank)
    if currentBank >= price then
        local garage = 'customgarage'
        if outputGarage ~= nil then
            garage = outputGarage
        end
    
        local result = MySQL.query.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    
        -- This wont work with cars like stratum -> Elegy retro or whatever
        if result[1] ~= nil then
            Player.Functions.RemoveMoney("bank", price , "Vehicle Modification")
            MySQL.query('UPDATE player_vehicles SET vehicle = ? WHERE plate = ? AND citizenid = ?', { vehName , plate, id})
            MySQL.query('UPDATE player_vehicles SET state = 1 WHERE plate = ? AND citizenid = ?', {plate, id})
            MySQL.query('UPDATE player_vehicles SET garage = ? WHERE plate = ? AND citizenid = ?', {garage ,plate, id})
            TriggerClientEvent('cw-vehicleswap:client:NotifySuccess', src)
        else
            TriggerClientEvent('cw-vehicleswap:client:NotifyFail', src)
        end
    else
        TriggerClientEvent('cw-vehicleswap:client:NotifyPoor', src)
    end
end)

RegisterNetEvent('cw-vehicleswap:server:TakeSlip', function(vehicle)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.SwapItem

    local src = source
    local ped = QBCore.Functions.GetPlayer(src)
    local id = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
	local Player = QBCore.Functions.GetPlayer(src)
    local swapSlips = Player.Functions.GetItemsByName(Config.SwapItem)
    local swapExists = false
    local slot = nil
    if swapSlips then
        for _, item in ipairs(swapSlips) do
            if item.info.vehicle == vehicle then
                slot = item.slot
            end
        end
    end
    Player.Functions.RemoveItem(item, 1, slot)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

QBCore.Functions.CreateCallback('cw-vehicleswap:server:CheckIfPlayerHasSpecialSlips', function(source, cb)
    local src = source
    local ped = QBCore.Functions.GetPlayer(src)
    local id = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
	local Player = QBCore.Functions.GetPlayer(src)
    local swapSlips = Player.Functions.GetItemsByName(Config.SwapItem)
    local swapExists = false
    local specials = {}
    if swapSlips then
        for _, item in ipairs(swapSlips) do
            specials[item.info.vehicle] = item.info.vehicle 
        end
    end
    cb(specials)
end)
