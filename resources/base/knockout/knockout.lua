--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 07/05/2017
-- Time: 12:13
-- To change this template use File | Settings | File Templates.
--
local knockedOut = false
local wait = 30

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)
        local myPed = GetPlayerPed(-1)
        SetPedDiesWhenInjured(PlayerId(), false)
        local player = GetPlayerPed(-1)
        if GetEntityHealth(myPed) < 115 then
            SetPlayerInvincible(PlayerId(), true)
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
            ShowNotification("~r~You were knocked out!")
            wait = 15
            knockedOut = true
            SetEntityHealth(myPed, 116)
        end

        if knockedOut == true then
            Citizen.Wait(1000)
            SetPlayerInvincible(PlayerId(), true)
            DisablePlayerFiring(PlayerId(), true)
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(myPed)
            Citizen.Trace("wait:"..wait)
            if wait >= 0 then
                wait = wait - 1
                SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
            else
                SetPlayerInvincible(PlayerId(), false)
                knockedOut = false
            end
        end
    end
end)


function ShowNotification(text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(false, false)
end