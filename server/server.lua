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

local function getQBItem(item)
    local qbItem = QBCore.Shared.Items[item]
    if qbItem then
        return qbItem
    else
        print('Someone forgot to add the item')
    end
end

local function removeItem(item, slot, source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.Inventory == 'qb' then
        Player.Functions.RemoveItem(item, 1, slot)
        TriggerClientEvent('inventory:client:ItemBox', source, getQBItem(item), "remove")
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:RemoveItem(source, item, 1, nil, slot)
    end
end

local function getItemSlot(src, vehicle)
    if Config.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        local swapSlips = Player.Functions.GetItemsByName(Config.SwapItem)
        local slot = nil
        if swapSlips then
            for _, item in ipairs(swapSlips) do
                if useDebug then
                   print(item.info.vehicle)
                end
                if item.info.vehicle == vehicle then
                    return item.slot
                end
            end
        else
            return false
        end
    elseif Config.Inventory == 'ox' then
        local result = exports.ox_inventory:GetItemSlots(src, Config.SwapItem, { vehicle = vehicle})
        return result.slot
    end
end

local function getItem(item, source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.Inventory == 'qb' then
        return Player.Functions.GetItemsByName(item)
    elseif Config.Inventory == 'ox' then
        return exports.ox_inventory:Search(source, 'slots', item)
    end
end

RegisterNetEvent('cw-vehicleswap:server:TakeSlip', function(vehicle)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local id = Player.PlayerData.citizenid
    local item = Config.SwapItem

    local slot = nil
    local slot = getItemSlot(src, vehicle)
    if slot then
        removeItem(item, slot, src)
    else
        print('Something went wrong with taking the slip')
    end
end)

QBCore.Functions.CreateCallback('cw-vehicleswap:server:CheckIfPlayerHasSpecialSlips', function(source, cb)
    local src = source
    local swapSlips = getItem(Config.SwapItem, source)
    local specials = {}
    if swapSlips then
        for _, item in ipairs(swapSlips) do
            local vehicleName = nil
            if Config.Inventory == 'qb' then
                vehicleName = item.info.vehicle
            elseif Config.Inventory == 'ox' then
                vehicleName = item.metadata.vehicle
            end
            local vehicle = QBCore.Shared.Vehicles[vehicleName]
            if vehicle == nil then
                print(vehicleName.. ' does not exist in vehicles.lua')
            else
                specials[vehicleName] = vehicleName 
            end
        end
    end
    cb(specials)
end)

QBCore.Commands.Add('checkForItems', 'heuhe', {}, true, function(source, args)
    local car = "sultanrs"
    TriggerEvent('cw-vehicleswap:server:TakeSlip', source, 'car')
end, "admin")

-- QBCore.Commands.Add('createswapslip', 'give item with info. (Admin Only)',{ { name = 'vehicle', help = 'what vehicle is it for' }}, true, function(source, args)
--     local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)
--     local item = 'swap_slip'
--     local info = {}
--     info.vehicle = args[1]

--     Player.Functions.AddItem(item, 1, nil, info)
--     TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
-- end, 'admin')