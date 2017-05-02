
require "resources/essentialmode/lib/MySQL"
-- MySQL:open("IP", "databasname", "user", "password")
MySQL:open(database.host, database.name, database.username, database.password)

RegisterServerEvent("shopcloths:save")
AddEventHandler("shopcloths:save", function(currentPlayer)
    TriggerEvent("es:getPlayerFromId", source, function(target)

        local result = getCurrentSkin(target)
        if(result[1] == nil)then
            MySQL:executeQuery("INSERT INTO skin (identifier, head, hair, h2, tshirt, t2, jacket, j2, pants, p2, shoes, s2, gloves, g2, accessory1, aa, accessory2, ab, accessory3, ac, accessory4, ad) VALUES ('@identifier', '@head', '@hair', '@h2', '@tshirt', '@t2', '@jacket', '@j2', '@pants', '@p2', '@shoes', '@s2', '@gloves', '@g2', '@accessory1', '@aa', '@accessory2', '@ab', '@accessory3', '@ac', '@ad4', '@ad')",
                {
                ['@identifier'] = target.identifier,
                ['@head']=currentPlayer.head,
                ['@hair'] = currentPlayer.hair,
                ['@h2'] = currentPlayer.h2,
                ['@tshirt'] = currentPlayer.tshirt,
                ['@t2'] = currentPlayer.t2,
                ['@jacket'] = currentPlayer.jacket,
                ['@j2'] = currentPlayer.j2,
                ['@pants'] = currentPlayer.pants,
                ['@p2'] = currentPlayer.p2,
                ['@shoes'] = currentPlayer.shoes,
                ['@s2'] = currentPlayer.s2,
                ['@gloves'] = currentPlayer.gloves,
                ['@g2'] = currentPlayer.g2,
                ['@accessory1'] = currentPlayer.accessory1,
                ['@aa'] = currentPlayer.aa,
                ['@accessory2'] = currentPlayer.accessory2,
                ['@ab'] = currentPlayer.ab,
                ['@accessory3'] = currentPlayer.accessory3,
                ['@ac'] = currentPlayer.ac,
                ['@ad4'] = currentPlayer.accessory4,
                ['@ad'] = currentPlayer.ad
            })
        else
            MySQL:executeQuery("UPDATE skin SET `head`= '@head', `hair` = '@hair', `h2` = '@h2', `tshirt` = '@tshirt', `t2` = '@t2',`jacket` = '@jacket', `j2` = '@j2',`pants`='@pants',`p2` = '@p2',`shoes` = '@shoes', `s2` = '@s2',`gloves` = '@gloves', `g2` = '@g2',`accessory1` = '@accessory1', `aa` = '@aa',`accessory2` = '@accessory2', `ab` = '@ab',`accessory3` = '@accessory3', `ac` = '@ac',`accessory4` = '@ad4', `ad` = '@ad' WHERE identifier = '@identifier'", {
                ['@identifier'] = target.identifier,
                ['@head']=currentPlayer.head,
                ['@hair'] = currentPlayer.hair,
                ['@h2'] = currentPlayer.h2,
                ['@tshirt'] = currentPlayer.tshirt,
                ['@t2'] = currentPlayer.t2,
                ['@jacket'] = currentPlayer.jacket,
                ['@j2'] = currentPlayer.j2,
                ['@pants'] = currentPlayer.pants,
                ['@p2'] = currentPlayer.p2,
                ['@shoes'] = currentPlayer.shoes,
                ['@s2'] = currentPlayer.s2,
                ['@gloves'] = currentPlayer.gloves,
                ['@g2'] = currentPlayer.g2,
                ['@accessory1'] = currentPlayer.accessory1,
                ['@aa'] = currentPlayer.aa,
                ['@accessory2'] = currentPlayer.accessory2,
                ['@ab'] = currentPlayer.ab,
                ['@accessory3'] = currentPlayer.accessory3,
                ['@ac'] = currentPlayer.ac,
                ['@ad4'] = currentPlayer.accessory4,
                ['@ad'] = currentPlayer.ad
            })
        end

    end)
end)

function getCurrentSkin(target)
    local executed_query = MySQL:executeQuery("SELECT * FROM skin WHERE identifier = '@name'", {['@name'] = target.identifier})
    return MySQL:getResults(executed_query, {'identifier', 'head', 'hair', 'h2', 'tshirt', 't2', 'jacket', 'j2', 'pants','p2', 'shoes', 's2', 'gloves', 'g2', 'accessory1', 'aa', 'accessory2', 'ab', 'accessory3', 'ac','accessory4', 'ad'}, "identifier")
end