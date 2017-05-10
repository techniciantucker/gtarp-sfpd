--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 06/05/2017
-- Time: 02:53
-- To change this template use File | Settings | File Templates.
--

-- Liste des évènements chronologique pour le spawn

-- 1. onClientMapStart / pdt le chargement de la map du joueur -> Redirection dans le callback une fois la map chargée, et
--          on modifie le spawn par default du serveur par celui de l'hôpital
-- 2. playerSpawned / Lors d'un spawn, cet event est appelé et renvoi à un event serveur selon si c'est le premier spawn
--          de la session du joueur, et si c'est un spawn après un décès
-- 3.   Premier spawn : l'event serveur renvoi les coordonnées du joueur en BDD, qui appel l'event client bs:spawnlastpos et
--          lance la boucle de sauvegarde, et une fois le skin de la personne trouvé appel l'event client bs:setPlayerSkin
--      Spawn après décès : l'event serveur ne fais que retourner le skin et appel l'event client bs:setPlayerSkin


--TODO : Premier spawn sur le serveur et déroulement du scénario


local AutoSaveEnabled = true    -- Active sauvegarde automatique // true = sauvegarde automatique // false = sauvegarde manuelle
local TimerAutoSave = 60000     -- Durée entre chaque sauvegarde de la position en mode automatique // 60000 = 60 secondes
local TimerManualSave = 60000   -- Durée d'attente avant de pouvoir à nouveau sauvegarder la position du joueur en mode Manuel // 60000 = 60 secondes
local firstspawn = false        -- Ne pas toucher
local hospital = {
    x = -451.149,
    y= -341.954,
    z = 34.5017,
    name = "Hôpital",
    sprite = 61,
    color = 4,
    scale = 0.9
}
local airport = {
    x = -1041.56,
    y= -2744.44,
    z = 21.3594,
    name = "Aeroport National",
    sprite = 90,
    color = 73,
    scale = 0.9
}


function setBlip(coords)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, coords.sprite)
    SetBlipColour(blip, coords.color)
    SetBlipScale(blip, coords.scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(coords.name)
    EndTextCommandSetBlipName(blip)
end
-- Création des divers marker sans intéraction nécessaire
Citizen.CreateThread(function()
    setBlip(hospital)
    setBlip(airport)
end)

-- Spawn override
AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
    exports.spawnmanager:setAutoSpawnCallback(function()
        local model = "mp_m_freemode_01"
        exports.spawnmanager:spawnPlayer({x = hospital.x, y = hospital.y, z = hospital.z, model = GetHashKey(model)})
    end)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
        end
    end)
end)

-- Event trigger par le jeu à chaque spawn le premier de la session aura firstspawn a 0
local firstspawn = 0
AddEventHandler("playerSpawned", function()
    --exports.spawnmanager:setAutoSpawn(false)
    SetPedDefaultComponentVariation(GetPlayerPed(-1))
    if firstspawn == 0 then
        TriggerServerEvent("bs:firstSpawnPlayer")
        firstspawn = 1
    else
        TriggerServerEvent("bs:normalSpawnPlayer")
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Event pour le spawn du joueur vers la dernière position connue
RegisterNetEvent("bs:spawnlastpos")
AddEventHandler("bs:spawnlastpos", function(PosX, PosY, PosZ)
    SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
    -- "bs:setNotification", function( icon, type, sender, title, text, short )
    ShowNotification("Vous voici à votre dernière position")
    SavePositionLoop()
end)

--Fonction sauvegarde automatique de la position du joueur
function SavePositionLoop()
    --Boucle Thread d'envoie de la position toutes les x secondes vers le serveur pour effectuer la sauvegarde
    Citizen.CreateThread(function ()
        while true do
            if AutoSaveEnabled then
                --Durée entre chaque requêtes
                Citizen.Wait(TimerAutoSave)
                --Envoi des données vers le serveur
                RequestToSave()
            else
                Citizen.Wait(0)
                if IsControlJustPressed(1, Keys["."])  then
                    --Envoi des données vers le serveur
                    RequestToSave()
                    Citizen.Wait(TimerManualSave)
                end
            end
        end
    end)
end

function RequestToSave()
    --Récupération de la position x, y, z du joueur
    LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    --Récupération de l'azimut du joueur
    local LastPosH = GetEntityHeading(GetPlayerPed(-1))
    --Envoi des données vers le serveur
    TriggerServerEvent("bs:savelastpos", LastPosX , LastPosY , LastPosZ, LastPosH)
    ShowNotification("Position Sauvegardée")
end

-- Event pour le spawn du joueur vers son skin
RegisterNetEvent("bs:setPlayerSkin")
AddEventHandler("bs:setPlayerSkin", function(skin)
    setPlayerSkin(skin)
end)
-- Fn pour appliquer le skin au joueur
function setPlayerSkin(skin)
    local playerPed = GetPlayerPed(-1)
    if skin then
        -- set head
        SetPedComponentVariation(playerPed, 0, skin.head, 0, 0)
        -- set hair
        SetPedComponentVariation(playerPed, 2, skin.hair, skin.hair_txt, 0)
        -- set gloves
        SetPedComponentVariation(playerPed, 3, skin.glove, skin.glove_txt, 0)
        -- set tshirt
        SetPedComponentVariation(playerPed, 8, skin.tshirt, skin.tshirt_txt, 0)
        -- set jacket
        SetPedComponentVariation(playerPed, 11, skin.jacket, skin.jacket_txt, 0)
        -- set pants
        SetPedComponentVariation(playerPed, 4, skin.pant, skin.pant_txt, 0)
        -- set shoes
        SetPedComponentVariation(playerPed, 6, skin.shoe, skin.shoe_txt, 0)
        -- set mask
        SetPedComponentVariation(playerPed, 1, skin.mask, skin.mask_txt, 0)

        if skin.glasses then
            -- set_glasses
            SetPedPropIndex(playerPed, 1, skin.glasses,skin.glasses_txt, 0)
        end
        if skin.percing then
            -- set_percing
            SetPedPropIndex(playerPed, 2, skin.percing,skin.percing_txt, 0)
        end
        if skin.helmet then
            -- set_helmet
            SetPedPropIndex(playerPed, 0, skin.helmet,skin.helmet_txt, 0)
        end
        -- set accessory1
        SetPedComponentVariation(playerPed, 9, skin.accessory1, skin.accessory1_txt, 0)
        -- set accessory2
        SetPedComponentVariation(playerPed, 5, skin.accessory2, skin.accessory2_txt, 0)
        -- set accessory3
        -- SetPedComponentVariation(playerPed, 8, skin.accessory3, skin.accessory3_txt, 0)
        -- set accessory4
        -- SetPedComponentVariation(playerPed, 8, skin.accessory4, skin.accessory4_txt, 0)
    end
end


-- Fn nécessaire à venir pour freeze un joueur
RegisterNetEvent('bs:freezePlayer')
AddEventHandler('bs:freezePlayer', function(freeze)
    local player = PlayerId()
    SetPlayerControl(player, not freeze, false)

    local ped = GetPlayerPed(player)

    if not freeze then
        if not IsEntityVisible(ped) then
            SetEntityVisible(ped, true)
        end

        if not IsPedInAnyVehicle(ped) then
            SetEntityCollision(ped, true)
        end

        FreezeEntityPosition(ped, false)
        --SetCharNeverTargetted(ped, false)
        SetPlayerInvincible(player, false)
    else
        if IsEntityVisible(ped) then
            SetEntityVisible(ped, false)
        end

        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        --SetCharNeverTargetted(ped, true)
        SetPlayerInvincible(player, true)
        --RemovePtfxFromPed(ped)

        if not IsPedFatallyInjured(ped) then
            ClearPedTasksImmediately(ped)
        end
    end
end)
