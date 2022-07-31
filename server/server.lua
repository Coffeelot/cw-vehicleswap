local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('cw-vehicleswap:server:ChangeVehicle', function(plate, vehName, outputGarage, price)
    local src = source
    local id = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
	local Player = QBCore.Functions.GetPlayer(src)
    local currentBank = Player.Functions.GetMoney('bank')
    print("price:", price, "Bank:", currentBank)
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
            end
end)
