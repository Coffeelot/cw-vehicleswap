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

    QBCore.Functions.DeleteVehicle(vehicle)
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
    QBCore.Functions.Notify(Config.Locations[SwapSpotData.location].texts.doneMessage, "success")
    SwapData = {}
end)

local function getVehicleFromVehList(hash)
	for _, v in pairs(QBCore.Shared.Vehicles) do
		if hash == v.hash then
			return v.model
		end
	end
end

local function createInputEntries(vehicleSwaps)
    local inputs = {}
	for i, swap in pairs(vehicleSwaps) do
        local spotHasType = SwapSpotData.types[i]
        local price = Config.Types[i].price
        print('price d:', price)
        if Config.Allowed[SwapData.from][i].price then
            price = Config.Allowed[SwapData.from][i].price
            print('price c:', price)
        end
        if spotHasType ~= nil then
            AvailableSwaps[swap.value] = { to = swap.value, type = i, price = price}
		    table.insert(inputs, {value=swap.value, text=swap.title.." $"..price})
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
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)
        local props = QBCore.Functions.GetVehicleProperties(vehicle)
        local hash = props.model
        local vehname = getVehicleFromVehList(hash) 
        SwapData.from = vehname

        local vehicleSwaps = Config.Allowed[vehname]
        if vehicleSwaps ~= nil then
            local inputs = createInputEntries(vehicleSwaps)
            print('inputs', dump(inputs))
            if #inputs == 0 then
                QBCore.Functions.Notify("This spot doesn't do this type of car", "error")
            else
                local dialog = exports['qb-input']:ShowInput({
                    header = Config.Locations[SwapSpotData.location].texts.shopTitle,
                    submitText = "SUBMIT TEXT",
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
                    SwapData.type = AvailableSwaps[dialog["swap"]].type
                    SwapData.price = AvailableSwaps[dialog["swap"]].price
                    TriggerEvent('cw-vehicleswap:client:ChangeVehicle', dialog["swap"])
                else
                    QBCore.Functions.Notify("Do your job better!", "error")
                end
            end
        else
            QBCore.Functions.Notify("This vehicle doesn't have any swaps", "error")
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
    print('Creating Vehicle Swap Spots')
    local PlayerData = QBCore.Functions.GetPlayerData()
    for i, data in pairs(Config.Locations) do
        local text = data.title
        -- PolyZone + Drawtext + Locations Management
        local _name = data.name.."-swap-spot"
        local newSpot = BoxZone:Create(data.coords, 10, 10, {
            name = _name,
            -- debugPoly = true,
            heading = data.coords.w,
            minZ = data.coords.z - 3.0,
            maxZ = data.coords.z + 3.0,
        })
        newSpot:onPlayerInOut(function(isPointInside, _)
            if isPointInside then
                SwapSpotData = {
                    ['location'] = i,
                    ['spot'] = _name,
                    ['coords'] = vector3(data.coords.x, data.coords.y, data.coords.z),
                    ['outputGarage'] = data.garage,
                    ['heading'] = data.coords.w,
                    ['drawtextui'] = "Enter Swap Spot",
                    ['types'] = data.types,
                }
                SetupInteraction()
            elseif SwapSpotData['location'] == i then
                SwapSpotData = {}
                exports['qb-core']:HideText()
            end
        end)
    end
end)

