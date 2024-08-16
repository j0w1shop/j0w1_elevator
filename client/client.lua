local elevators = Config.Elevators

Citizen.CreateThread(function()
    for _, elevator in pairs(elevators) do
        for _, floor in pairs(elevator.floors) do
            exports.ox_target:addBoxZone({
                coords = floor.coords,
                size = vec3(1, 1, 2),
                rotation = 0.0,
                debug = false,
                options = {
                    {
                        name = elevator.name,
                        icon = "fas fa-elevator",
                        label = "Usar Ascensor",
                        onSelect = function()
                            local playerCoords = GetEntityCoords(PlayerPedId())
                            local currentFloor = "Desconocida"

                            for _, f in pairs(elevator.floors) do
                                if #(playerCoords - f.coords) < 1.5 then
                                    currentFloor = f.planta
                                    break
                                end
                            end

                            SendNUIMessage({
                                action = "open",
                                elevator = elevator.name,
                                currentFloor = currentFloor,
                                floors = elevator.floors
                            })
                            SetNuiFocus(true, true)
                        end
                    }
                }
            })
        end
    end
end)

RegisterNUICallback('selectFloor', function(data, cb)
    local elevatorName = data.elevator
    local selectedFloorLabel = data.floor

    for _, elevator in pairs(elevators) do
        if elevator.name == elevatorName then
            for _, floor in pairs(elevator.floors) do
                if floor.label == selectedFloorLabel then
                    SetEntityCoords(PlayerPedId(), floor.coords)
                    break
                end
            end
        end
    end

    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    cb('ok')
end)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    cb('ok')
end)

-- Aseguramos que la UI esté cerrada al iniciar
AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        SendNUIMessage({ action = 'close' })
    end
end)
