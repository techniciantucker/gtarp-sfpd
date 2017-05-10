--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 04/05/2017
-- Time: 12:53
-- To change this template use File | Settings | File Templates.
--
require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)


RegisterServerEvent("shopcloths:saveItem")
AddEventHandler("shopcloths:saveItem", function(item)
    TriggerEvent("es:getPlayerFromId", source, function(target)

        local executed_query = MySQL:executeQuery("SELECT * FROM skin WHERE identifier = '@name'", {['@name'] = target.identifier})
        local result = MySQL:getResults(executed_query, {'identifier', 'head', 'hair', 'hair_txt', 'tshirt', 'tshirt_txt', 'jacket', 'jacket_txt', 'pant','pant_txt', 'shoe', 'shoe_txt', 'glove', 'glove_txt', 'accessory1', 'accessory1_txt', 'accessory2', 'accessory2_txt', 'accessory3', 'accessory3_txt','accessory4', 'accessory4_txt', 'glasses', 'glasses_txt', 'helmet', 'helmet_txt', 'mask', 'mask_txt'}, "identifier")


        if(result[1] == nil)then
            if item.menuId ~= "head" then
                MySQL:executeQuery("INSERT INTO skin (identifier, ".. item.menuId ..", ".. item.menuId .."_txt ) VALUES ('@identifier', '@a', '@b')",
                    {
                        ['@identifier'] = target.identifier,
                        ['@a']= item.value,
                        ['@b'] = item.value_texture
                    })
            else
                MySQL:executeQuery("INSERT INTO skin (identifier, ".. item.menuId .." ) VALUES ('@identifier', '@a')",
                    {
                        ['@identifier'] = target.identifier,
                        ['@a']= item.value
                    })
            end


        else
            if item.menuId ~= "head" then
                MySQL:executeQuery("UPDATE skin SET `".. item.menuId.."`= '@a', `".. item.menuId.."_txt`= '@b' WHERE identifier = '@identifier'",
                    {
                        ['@identifier'] = target.identifier,
                        ['@a']= item.value,
                        ['@b'] = item.value_texture
                    })
            else
                MySQL:executeQuery("UPDATE skin SET `".. item.menuId.."`= '@a' WHERE identifier = '@identifier'",
                    {
                        ['@identifier'] = target.identifier,
                        ['@a']= item.value
                    })
            end

        end

    end)
end)