--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 06/05/2017
-- Time: 03:08
-- To change this template use File | Settings | File Templates.
--

--Version 1.4
require "resources/essentialmode/lib/MySQL"
--Configuration de la connexion vers la DB MySQL
MySQL:open(database.host, database.name, database.username, database.password)


RegisterServerEvent("bs:savelastpos")
--Intégration de la position dans MySQL
AddEventHandler("bs:savelastpos", function( LastPosX , LastPosY , LastPosZ , LastPosH )
    TriggerEvent('es:getPlayerFromId', source, function(user)
        --Récupération du SteamID.
        local player = user.identifier
        --Formatage des données en JSON pour intégration dans MySQL.
        local LastPos = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. ", " .. LastPosH .. "}"
        --Exécution de la requêtes SQL.
        local executed_query = MySQL:executeQuery("UPDATE users SET `lastpos`='@lastpos' WHERE identifier = '@username'", {['@username'] = player, ['@lastpos'] = LastPos})
    end)
end)

RegisterServerEvent("bs:firstSpawnPlayer")
AddEventHandler("bs:firstSpawnPlayer", function()
    TriggerEvent('es:getPlayerFromId', source, function(user)
        getLastPos(user.identifier)
        getSkin(user.identifier)
    end)
end)

RegisterServerEvent("bs:normalSpawnPlayer")
AddEventHandler("bs:normalSpawnPlayer", function()
    TriggerEvent('es:getPlayerFromId', source, function(user)
        getSkin(user.identifier)
    end)
end)

function getLastPos(player)
    -- Exécution de la requêtes SQL.
    local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@username'", {['@username'] = player})
    -- Récupération des données générée par la requête.
    local result = MySQL:getResults(executed_query, {'lastpos'}, "identifier")
    -- Vérification de la présence d'un résultat avant de lancer le traitement.
    if(result)then
        for k,v in ipairs(result)do
            if v.lastpos ~= "" then
                -- Décodage des données récupérées
                local ToSpawnPos = json.decode(v.lastpos)
                -- On envoie la derniere position vers le client pour le spawn
                TriggerClientEvent("bs:spawnlastpos", source, ToSpawnPos[1], ToSpawnPos[2], ToSpawnPos[3])
            end
        end
    end
end

function getSkin(player)
    local playerSkin_query = MySQL:executeQuery("SELECT * FROM skin WHERE identifier = '@username'", {['@username'] = player})
    local skin = MySQL:getResults(playerSkin_query, {'identifier', 'head', 'hair', 'hair_txt', 'tshirt', 'tshirt_txt', 'jacket', 'jacket_txt', 'pant','pant_txt', 'shoe', 'shoe_txt', 'glove', 'glove_txt', 'accessory1', 'accessory1_txt', 'accessory2', 'accessory2_txt', 'accessory3', 'accessory3_txt','accessory4', 'accessory4_txt', 'percing', 'percing_txt', 'glasses', 'glasses_txt'}, "identifier")
    if(skin)then
        for k,v in ipairs(skin)do
            if v.head ~= nil then
                TriggerClientEvent("bs:setPlayerSkin", source, v)
            end
        end
    end
end

