

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    end
end)

-- Display notification
RegisterNetEvent("base:notify")
AddEventHandler("base:notify", function(icon, type, sender, title, text)
    Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING");
        AddTextComponentString(text);
        SetNotificationMessage(icon, icon, true, type, sender, title, text);
        DrawNotification(false, true);
    end)
end)

function setDefaultServerModel()
    local skin = 'mp_m_freemode_01'
    RequestModel(GetHashKey(skin))
    while not HasModelLoaded(GetHashKey(skin)) do
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), GetHashKey(skin))
    --setEntityData(PlayerId(), string key, object value);

end

-- Spawn override
AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)

local firstspawn = true
AddEventHandler('playerSpawned', function(spawn)
    if firstspawn then
        setDefaultServerModel()
        skinpolice()
        --setFacialDecoration(GetPlayerPed(-1), 1)
        firstspawn = false
    end

end)


function skinpolice()
    local playerPed = GetPlayerPed(-1)
    SetPedComponentVariation(playerPed, 8, 15, 0, 0)
    SetPedComponentVariation(playerPed, 11, 55, 0, 0)
    SetPedComponentVariation(playerPed, 4, 35, 0, 0)
    SetPedComponentVariation(playerPed, 6, 25, 0, 0)
    --SetPedComponentVariation(playerPed, 8, 58, 0, 0)
end

