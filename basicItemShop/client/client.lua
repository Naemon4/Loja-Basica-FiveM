local displayStatus = false

function setDisplay(bool)

    displayStatus = bool
    SetNuiFocus(displayStatus, displayStatus)
    SendNuiMessage({
        messageType = 'ui',
        status = displayStatus
    })
    
end

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end

setDisplay(displayStatus)

RegisterCommand("shop", function(source)

    if source > 0 then
        setDisplay(not displayStatus)
    end
    
end)

RegisterNUICallback('exit', function(data)
    chat('exited', {0, 255, 0})
    setDisplay(false)
end)

Citizen.CreateThread(function()
    while displayStatus do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)
