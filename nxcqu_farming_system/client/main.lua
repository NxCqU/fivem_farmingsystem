local currentRoute = nil
local isInUI = false

-- Play a specific animation
function PlayAnimation(dict, anim, duration)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), dict, anim, 3.0, 3.0, duration, 1, 0, false, false, false)
end

-- Stop animation after completion
function StopAnimation()
    ClearPedTasksImmediately(PlayerPedId())
end

-- Open the UI
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())

        for routeName, routeData in pairs(Config.Routes) do
            if #(playerCoords - routeData.GatherLocation) < 2.0 then
                ESX.ShowHelpNotification(_U('press_to_open'))
                if IsControlJustReleased(0, 38) then -- E Key
                    currentRoute = routeName
                    openUI('gather')
                end
            elseif #(playerCoords - routeData.ProcessLocation) < 2.0 then
                ESX.ShowHelpNotification(_U('press_to_open'))
                if IsControlJustReleased(0, 38) then
                    currentRoute = routeName
                    openUI('process')
                end
            elseif #(playerCoords - routeData.SellLocation) < 2.0 then
                ESX.ShowHelpNotification(_U('press_to_open'))
                if IsControlJustReleased(0, 38) then
                    currentRoute = routeName
                    openUI('sell')
                end
            end
        end
    end
end)

-- Open/close the UI
function openUI(action)
    isInUI = true
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'open', action = action, route = currentRoute })
end

RegisterNUICallback('startAction', function(data)
    isInUI = false
    SetNuiFocus(false, false)

    -- Trigger server-side event
    TriggerServerEvent('nxcqu_farming:startAction', data.action, currentRoute)

    -- Determine and play the appropriate animation
    local duration = Config.ActionDuration
    if data.action == 'gather' then
        -- Gathering animation
        PlayAnimation("anim@heists@box_carry@", "idle", duration / 1000)
    elseif data.action == 'process' then
        -- Processing animation
        PlayAnimation("amb@prop_human_bbq@", "base", duration / 1000)
    elseif data.action == 'sell' then
        -- Selling animation
        PlayAnimation("mp_common", "givetake1_a", duration / 1000)
    end

    Citizen.Wait(duration) -- Wait for the action duration
    StopAnimation() -- Stop the animation
end)

RegisterNUICallback('close', function()
    isInUI = false
    SetNuiFocus(false, false)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.AdCheckInterval)
        SendNUIMessage({ type = 'checkAd' })
    end
end)

RegisterNetEvent('nxcqu_farming:blockClient')
AddEventHandler('nxcqu_farming:blockClient', function(reason)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            DisableAllControlActions(0)
            ESX.ShowNotification(reason)
        end
    end)
end)
