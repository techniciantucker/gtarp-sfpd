--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 04/05/2017
-- Time: 12:51
-- To change this template use File | Settings | File Templates.
--

local barbersOptions = {
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

local barbersMenu = ModuleMenu(barbersOptions)

function init_menu()
    if barbersMenu.opened == true then
        barbersMenu.menu["head"].buttons = barbersMenu:getDrawableList(0)
        barbersMenu.menu["hair"].buttons = barbersMenu:getDrawableList(2)
        barbersMenu.menu["percing"].buttons = barbersMenu:getPropList(2)
        local y = barbersMenu.y + 0.12
        local buttoncount = #barbersMenu.menu[barbersMenu.currentmenu].buttons
        local selected = false

        barbersMenu:display()
        barbersMenu:navsButtons(buttoncount)

        for i, button in pairs(barbersMenu.menu[barbersMenu.currentmenu].buttons) do
            if i >= barbersMenu.from and i <= barbersMenu.to then
                if i == barbersMenu.selectedbutton then
                    selected = true
                else
                    selected = false
                end
                barbersMenu:drawMenuButton(button,barbersMenu.x, y,selected)
                if barbersMenu.menu[barbersMenu.currentmenu].rightInfo then
                    if button.max then
                        barbersMenu:drawTxt(barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation.."/".. button.max ,0,0,barbersMenu.x + barbersMenu.width/2 - 0.0385,y-0.005,0.4, 255,255,255,255)
                    end

                end
                if selected then
                    barbersMenu:onLeft(button)
                    barbersMenu:onRight(button)
                    barbersMenu:onSelected(button)
                    barbersMenu:onClick(button)
                    barbersMenu:onBack(button)
                end
                -- ajout d'un espacement pour le prochain
                y = y + 0.04
            end
        end
    end
end

function barbersMenu:getDrawableList(component)
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
            saveItem(barbersMenu.currentmenu, i,  barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation)
        end
        list[i].onLeft          = function()
            if barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation > 0 then
                barbersMenu:setCurrentVariation("left", barbersMenu.currentmenu)
                SetPedComponentVariation(GetPlayerPed(-1), cmp, i, barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation, 0)
            end
        end
        list[i].onRight         = function()
            if  barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation < ( GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmp, i) - 1 ) then
                barbersMenu:setCurrentVariation("right", barbersMenu.currentmenu)
                SetPedComponentVariation(GetPlayerPed(-1), cmp, i, barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation, 0)
            end
        end
        list[i].onSelected      = function()
            SetPedComponentVariation(GetPlayerPed(-1), cmp, i, barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation, 0)
        end
        list[i].onBack          = function()
            barbersMenu:toMenu(barbersMenu:getLastMenu())
        end
    end
    return list
end


function barbersMenu:getPropList(prop)
    local list = {}
    for i = 0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), prop) do
        local cmp               = prop
        list[i]                 = {}
        list[i].name            = "Item n°".. i
        list[i].id              = i
        if GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmp, i) ~= nil then
            list[i].max         = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmp, i) - 1
        else
            list[i].max         = 0
        end

        list[i].onClick         = function()
            saveItem(barbersMenu.currentmenu, i,  barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation)
        end
        list[i].onLeft          = function()
            if barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation > 0 then
                barbersMenu:setCurrentVariation("left", barbersMenu.currentmenu)
                SetPedPropIndex(GetPlayerPed(-1), cmp, i, barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation, 0)
            end
        end
        list[i].onRight         = function()
            if  barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation < ( GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmp, i) - 1 ) then
                barbersMenu:setCurrentVariation("right", barbersMenu.currentmenu)
                SetPedPropIndex(GetPlayerPed(-1), cmp, i, barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation, 0)
            end
        end
        list[i].onSelected      = function()
            SetPedPropIndex(GetPlayerPed(-1), cmp, i, barbersMenu.menu[barbersMenu.currentmenu].userSelectVariation, 0)
        end
        list[i].onBack          = function()
            barbersMenu:toMenu(barbersMenu:getLastMenu())
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

local barbersStores = {
    { ['x'] = 1210.57580566406, ['y'] = -473.20849609375, ['z'] = 66.2178421020508},
    { ['x'] = -33.4022, ['y'] = -151.078, ['z'] = 57.007 },
    { ['x'] = -1284.36450195313, ['y'] = -1118.19641113281, ['z'] = 7.00012540817261},
    { ['x'] = 136.758850097656, ['y'] = -1709.80529785156, ['z'] = 29.3015365600586},
    { ['x'] = 1933.10852050781, ['y'] = 3729.515625,   ['z'] = 32.8533821105957},
    { ['x'] = 1864.4403076172, ['y'] = 3747.3469238281, ['z'] = 33.031894683838 },
    { ['x'] = -293.516662597656, ['y'] = 6199.3486328125, ['z'] = 31.4879970550537}
}

Citizen.CreateThread(function()
    for k,v in ipairs(barbersStores)do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 71)
        SetBlipColour(blip, 21)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Barber shop")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    barbersMenu:setMenu(
        "main","Barber Shop",{
        {
            id="head",
            name = "Tete",
            description = "",
            onClick = function()
                barbersMenu:toMenu("head")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function() return false end
        },
        {
            id="hair",
            name = "Cheveux",
            description = "",
            onClick = function()
                barbersMenu:toMenu("hair")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function() return false end
        },
        {
            id="percing",
            name = "Percings",
            description = "",
            onClick = function()
                barbersMenu:toMenu("percing")
            end,
            onLeft = function() return false end,
            onRight = function() return false end,
            onSelected = function() return false end,
            onBack = function() return false end
        },
    }, false
    )


    barbersMenu:setMenu(
        "head", "Visage", {}, true
    )

    barbersMenu:setMenu(
        "hair", "Cheveux", {}, true
    )

    barbersMenu:setMenu(
        "percing", "Cheveux", {}, true
    )


    while true do
        Citizen.Wait(0)
        init_menu()
        local pos = GetEntityCoords(GetPlayerPed(-1), false)
        for _,d in ipairs(barbersStores)do
            if Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 20.0 then
                DrawMarker(25, d.x, d.y, d.z - 10, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 255, 255, 0,155, 0,0, 0,0)
            end

            if(Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 1.0) then
                SetTextComponentFormat("STRING")
                AddTextComponentString("Appuyez sur la touche ~INPUT_CONTEXT~ pour ouvrir le magasin.")
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end

            if(IsControlJustPressed(1, 51) and Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 1.0) then
                if barbersMenu.opened then
                    barbersMenu:close()
                else
                    barbersMenu:open()
                end
            end

        end
    end

end)