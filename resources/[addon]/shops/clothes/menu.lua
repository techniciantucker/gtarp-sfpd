--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 04/05/2017
-- Time: 12:53
-- To change this template use File | Settings | File Templates.
--
--

local skinOptions = {
    opened = false,
    title = "Creez votre skin",
    currentmenu = "main",
    lastmenu = "main",
    currentpos = nil,
    selectedbutton = 0,
    marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    buttons = 10,
    from = 1,
    to = 10,
    scale = 0.4,
    font = 0,
}

local skinMenu = ModuleMenu(skinOptions)

function skinMenu:getDrawableList(component)
    local list = {}
    for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), component) do
        local cmp               = component
        list[i]                 = {}
        list[i].name            = "Item n°".. i
        list[i].id              = i
        if GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i) ~= nil then
            list[i].max         = GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i) - 1
        else
            list[i].max         = 0
        end

        list[i].onClick         = function()
            saveItem(skinMenu.currentmenu, i,  skinMenu.menu[skinMenu.currentmenu].userSelectVariation)
        end
        list[i].onLeft          = function()
            if skinMenu.menu[skinMenu.currentmenu].userSelectVariation > 0 then
                skinMenu:setCurrentVariation("left", skinMenu.currentmenu)
                SetPedComponentVariation(GetPlayerPed(-1), cmp, i, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 0)
            end
        end
        list[i].onRight         = function()
            if  skinMenu.menu[skinMenu.currentmenu].userSelectVariation < ( GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i) - 1 ) then
                skinMenu:setCurrentVariation("right", skinMenu.currentmenu)
                SetPedComponentVariation(GetPlayerPed(-1), cmp, i, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 0)
            end
        end
        list[i].onSelected      = function()
            SetPedComponentVariation(GetPlayerPed(-1), cmp, i, skinMenu.menu[skinMenu.currentmenu].userSelectVariation, 0)
        end
        list[i].onBack          = function()
            skinMenu:toMenu(skinMenu:getLastMenu())
        end
    end
    return list
end

function saveItem(menuId, value, value_texture)
    local item = {
        menuId = menuId,
        value = value,
        value_texture = value_texture
    }
    TriggerServerEvent("shopcloths:saveItem", item)
end

local clothingStores = {

    { ['x'] = 1693.2647705078, ['y'] = 4822.2797851563, ['z'] = 42.063091278076 },
    { ['x'] = 125.83338165283, ['y'] = -223.16986083984, ['z'] = 54.55782699585 },
    { ['x'] = -710.16009521484, ['y'] = -153.26420593262, ['z'] = 37.415138244629 },
    { ['x'] = -821.69067382813, ['y'] = -1073.900390625, ['z'] = 11.328099250793 },
    { ['x'] = -1192.8112792969, ['y'] = -768.24377441406, ['z'] = 17.319314956665 },
    { ['x'] = 4.2589497566223, ['y'] = 6512.8803710938, ['z'] = 31.877851486206 },
    { ['x'] = -1097.98095703125, ['y'] = 2708.9150390625, ['z'] = 19.107873916626},
    { ['x'] = -3170.45434570313, ['y'] = 1045.53295898438, ['z'] = 20.8632144927979},
    { ['x'] = -162.942764282227, ['y'] = -302.322326660156, ['z'] = 39.733283996582},
    { ['x'] = -1452.13696289063, ['y'] = -236.172698974609, ['z'] = 49.8062591552734}
}

Citizen.CreateThread(function()
    for k,v in ipairs(clothingStores)do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 73)
        SetBlipColour(blip, 26)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Magasins de vetements")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    skinMenu:setMenu(
        "main","Magasins de vetements",{
        {
            id="tete",
            name = "Tete",
            description = "",
            onClick = function()
                skinMenu:toMenu("tete")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function() return false end
        },
        {
            id="body",
            name = "Corps",
            description = "",
            onClick= function()
                skinMenu:toMenu("body")
            end,
            onLeft= function() return false end,
            onRight= function() return false end,
            onSelected= function() return false end,
            onBack = function() return false end
        },
        {
            id="pantmenu",
            name = "Pantalons",
            description = "",
            onClick= function()
                skinMenu:toMenu("pant")
            end,
            onLeft= function() return false end,
            onRight= function() return false end,
            onSelected= function() return false end,
            onBack = function() return false end
        },
        {
            id="shoeMenu",
            name = "Chaussures",
            description = "",
            onClick= function()
                skinMenu:toMenu("shoe")
            end,
            onLeft= function() return false end,
            onRight= function() return false end,
            onSelected= function() return false end,
            onBack = function() return false end
        },
        {
            id="accessory1Main",
            name = "Accessoires",
            description = "",
            onClick= function()
                skinMenu:toMenu("accessory1")
            end,
            onLeft= function() return false end,
            onRight= function() return false end,
            onSelected= function() return false end,
            onBack = function() return false end
        },
        {
            id="accessory2Main",
            name = "Accessoires 2",
            description = "",
            onClick= function()
                skinMenu:toMenu("accessory2")
            end,
            onLeft= function() return false end,
            onRight= function() return false end,
            onSelected= function() return false end,
            onBack = function() return false end
        },
        {
            id="exit",
            name = "Quitter",
            description = "",
            onClick= function()
                skinMenu:close()
            end,
            onLeft= function() return false end,
            onRight= function() return false end,
            onSelected= function() return false end,
            onBack = function() return false end
        }
    }, false
    )
    skinMenu:setMenu(
        "tete", "Tete", {
        {
            id="head",
            name = "Visages",
            description = "",
            onClick = function()
                skinMenu:toMenu("head")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function()
                skinMenu:toMenu('main')
            end
        },
        {
            id="hair",
            name = "Cheveux",
            description = "",
            onClick = function()
                skinMenu:toMenu("hair")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function() skinMenu('main') end

        }
    }, false
    )

    skinMenu:setMenu(
        "head", "Visage", {}, true
    )

    skinMenu:setMenu(
        "hair", "Cheveux", {}, true
    )
    skinMenu:setMenu(
        "body", "Corps", {
        {
            id="glove",
            name = "Torse et gants",
            description = "",
            onClick = function()
                skinMenu:toMenu("glove")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function()
                skinMenu:toMenu('main')
            end
        },
        {
            id="tshirt",
            name = "T-Shirts",
            description = "",
            onClick = function()
                skinMenu:toMenu("tshirt")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function()
                skinMenu:toMenu('main')
            end
        },
        {
            id="jacket",
            name = "Vestes",
            description = "",
            onClick = function()
                skinMenu:toMenu("jacket")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function()
                skinMenu:toMenu('main')
            end
        },
    }, false
    )
    skinMenu:setMenu(
        "pant", "Pantalons", {}, true
    )
    skinMenu:setMenu(
        "shoe", "Chaussures", {}, true
    )
    skinMenu:setMenu(
        "accessory1", "Accessoires 1", {}, true
    )
    skinMenu:setMenu(
        "accessory2", "Accessoires 2", {}, true
    )
    skinMenu:setMenu(
        "accessory3", "Accessoires 3", {}, true
    )
    skinMenu:setMenu(
        "accessory4", "Accessoires 4", {}, true
    )

    skinMenu:setMenu(
        "glove", "Torse et gants", {}, true
    )
    skinMenu:setMenu(
        "tshirt", "T-shirt", {}, true
    )
    skinMenu:setMenu(
        "jacket", "T-shirt", {}, true
    )

    while true do
        Citizen.Wait(0)
        if skinMenu.opened == true then
            skinMenu.menu["head"].buttons = skinMenu:getDrawableList(0)
            skinMenu.menu["hair"].buttons = skinMenu:getDrawableList(2)
            skinMenu.menu["shoe"].buttons = skinMenu:getDrawableList(6)
            skinMenu.menu["glove"].buttons = skinMenu:getDrawableList(3)
            skinMenu.menu["tshirt"].buttons = skinMenu:getDrawableList(8)
            skinMenu.menu["pant"].buttons = skinMenu:getDrawableList(4)
            skinMenu.menu["jacket"].buttons = skinMenu:getDrawableList(11)
            skinMenu.menu["accessory1"].buttons = skinMenu:getDrawableList(9)
            skinMenu.menu["accessory2"].buttons = skinMenu:getDrawableList(5)
            skinMenu:display()
        end
        skinMenu:setBlipAndMarker(clothingStores)
    end

end)