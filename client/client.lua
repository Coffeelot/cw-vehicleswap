local QBCore = exports['qb-core']:GetCoreObject()
local SwapSpotData = {}
local AvailableSwaps ={}
local SwapData = {}

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

RegisterNetEvent('cw-vehicleswap:client:ChangeVehicle', function(vehName)
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    local plate = QBCore.Functions.GetPlate(vehicle)
    TriggerServerEvent('cw-vehicleswap:server:ChangeVehicle', plate, vehName, SwapSpotData.outputGarage, SwapData.price)
end)

RegisterNetEvent('cw-vehicleswap:client:NotifyPoor', function(vehName)
    QBCore.Functions.Notify("You can't afford this", "error")
    SwapData = {}
end)

RegisterNetEvent('cw-vehicleswap:client:NotifyFail', function(vehName)
    QBCore.Functions.Notify("It seems like this vehicle doesn't belong to anyone", "error")
    SwapData = {}
end)

RegisterNetEvent('cw-vehicleswap:client:NotifySuccess', function(vehName)
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    if Config.AdvancedParking then
        exports["AdvancedParking"]:DeleteVehicle(vehicle)
    else
        QBCore.Functions.DeleteVehicle(vehicle)
    end
    QBCore.Functions.Notify(Config.Locations[SwapSpotData.location].texts.doneMessage, "success")
    if SwapData.type == 'special' then
        TriggerServerEvent('cw-vehicleswap:server:TakeSlip', SwapData.to)
    end
    SwapData = {}
end)

local function getVehicleFromVehList(hash)
	for _, v in pairs(QBCore.Shared.Vehicles) do
		if hash == v.hash then
			return v.model
		end
	end
end

local function createInputEntries(vehicleSwaps, customSwaps)
    local inputs = {}
    local from = SwapData.from
    local specials = nil

    -- Normal swaps
	for i, swap in pairs(vehicleSwaps) do
        local spotHasType = SwapSpotData.types[swap.type]
        local price = Config.Types[swap.type].price
        if Config.Allowed[SwapData.from] then
            if Config.Allowed[SwapData.from][i].price then
                price = Config.Allowed[SwapData.from][i].price
            end
            if spotHasType ~= nil then
                AvailableSwaps[swap.value] = { to = swap.value, type = swap.type, price = price}
                table.insert(inputs, {value=swap.value, text=swap.title.." $"..price})
            end
        end
	end

    -- Special swaps
    for i, swap in pairs(customSwaps) do
        if SwapSpotData.types['special'] ~= nil then
            local spotHasType = SwapSpotData.types[swap.type]
            local price = Config.Types[swap.type].price
            if Config.Special[SwapData.from] then
                if Config.Special[SwapData.from][i].price then
                    price = Config.Allowed[SwapData.from][i].price
                end
                QBCore.Functions.TriggerCallback('cw-vehicleswap:server:CheckIfPlayerHasSpecialSlips', function(result, from)
                    specials = result
                    print(dump(specials))
                    if spotHasType ~= nil and specials[swap.swapslip] ~= nil and specials ~= nil then
                        AvailableSwaps[swap.value] = { to = swap.value, type = swap.type, price = price}
                        table.insert(inputs, {value=swap.value, text=swap.title.." $"..price})
                        print('inputs', dump(inputs))
                    end
                end)
            end
        end
	end

    return inputs
end

local function isAllowed()
    local jobRequirement = Config.Locations[SwapSpotData.location].job
    if jobRequirement ~= nil then
        if jobRequirement == QBCore.Functions.GetPlayerData().job.name then
            return true
        else
            return false
        end
    else
        return true
    end
end


local function OpenInteraction()
    if isAllowed() then
        exports['qb-core']:HideText()
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)
        local props = QBCore.Functions.GetVehicleProperties(vehicle)
        local hash = props.model
        local vehname = getVehicleFromVehList(hash)
        SwapData.from = vehname

        local vehicleSwaps = Config.Allowed[vehname]
        local customSwaps = Config.Special[vehname]
        if vehicleSwaps == nil and customSwaps == nil then
            QBCore.Functions.Notify("This vehicle doesn't have any swaps", "error")
        else
            if vehicleSwaps == nil then
                vehicleSwaps = {}
            end
            if customSwaps == nil then
                customSwaps = {}
            end
            local inputs = createInputEntries(vehicleSwaps, customSwaps)
            Wait(500)
            if #inputs == 0 then
                QBCore.Functions.Notify("This spot doesn't do this type of car", "error")
            else
                local dialog = exports['qb-input']:ShowInput({
                    header = Config.Locations[SwapSpotData.location].texts.shopTitle,
                    submitText = "Confirm Swap",
                    inputs = {
                        {
                            text = "Type", -- text you want to be displayed as a place holder
                            name = "swap", -- name of the input should be unique otherwise it might override
                            type = "select", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                            options = inputs,
                            isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                        },
                    },
                })
                if dialog ~= nil then
                    exports['qb-core']:HideText()
                    SwapData.type = AvailableSwaps[dialog["swap"]].type
                    SwapData.price = AvailableSwaps[dialog["swap"]].price
                    SwapData.to = dialog["swap"]
                    -- print('type', SwapData.type)
                    -- print('price', SwapData.price)
                    TriggerEvent('cw-vehicleswap:client:ChangeVehicle', dialog["swap"])
                else
                    QBCore.Functions.Notify("Do your job better!", "error")
                end
            end
        end
    else
        QBCore.Functions.Notify("It looks like you don't work here pal", "error")

    end
end

local function CheckForKeypress()
    if next(SwapSpotData) then
        CreateThread(function()
            while next(SwapSpotData) do
                if IsControlJustReleased(0, 38) then OpenInteraction() return end
                Wait(0)
            end
        end)
    end
end

local function SetupInteraction()
    local text = SwapSpotData.drawtextui
    text = '[E] '..text
    CheckForKeypress()
    exports['qb-core']:DrawText(text, 'left')
end

-----------------------
----   Threads     ----
-----------------------

-- Location Creation
CreateThread(function()
    for i, data in pairs(Config.Locations) do
        local text = data.title
        -- PolyZone + Drawtext + Locations Management
        local _name = data.name.."-swap-spot"
        local newSpot = BoxZone:Create(data.coords, 5, 5, {
            name = _name,
            -- debugPoly = false,
            heading = data.coords.w,
            minZ = data.coords.z - 3.0,
            maxZ = data.coords.z + 3.0,
        })
        newSpot:onPlayerInOut(function(isPointInside, _)
            if isPointInside then
                local PlayerData = QBCore.Functions.GetPlayerData()
                if (data.job and PlayerData.job.name == data.job) or data.job == nil then
                    if GetVehiclePedIsIn(PlayerPedId()) ~= 0 then
                        local garage = 'sapcounsel'
                        if data.garage then
                            garage = data.garage
                        end
                        SwapSpotData = {
                            ['location'] = i,
                            ['spot'] = _name,
                            ['coords'] = vector3(data.coords.x, data.coords.y, data.coords.z),
                            ['outputGarage'] = garage,
                            ['heading'] = data.coords.w,
                            ['drawtextui'] = "Enter Swap Spot",
                            ['types'] = data.types,
                        }
                        SetupInteraction()
                    end
                end
            elseif SwapSpotData['location'] == i then
                SwapSpotData = {}
                exports['qb-core']:HideText()
            end
        end)
    end
end)

local function getAmountOfSwaps(model)
    if Config.Allowed[model] then
        return #Config.Allowed[model]
    else
        return 0
    end
end exports('getAmountOfSwaps', getAmountOfSwaps)

local function listSwaps()
    print('=========================================')
    for i,v in pairs(Config.Allowed) do
        if QBCore.Shared.Vehicles[i] then
            for index, swap in pairs(v) do
                print(QBCore.Shared.Vehicles[i].name..' -> '.. swap.title, '$'..swap.price)
            end
        end
    end
    print('=========================================')
end exports('listSwaps', listSwaps)
