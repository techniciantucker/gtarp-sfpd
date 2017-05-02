
local skinOptions = {
    opened = false,
    title = "Creez votre skin",
    currentmenu = "main",
    lastmenu = nil,
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

skinMenu:setMenu(
    "main", "Personaliser",{
    {id="head", name = "Visages", description = ""},
    {id="hair", name = "Cheveux", description = ""},
    {id="tshirt", name = "Tshirt", description = ""},
    {id="jacket", name = "Vestes", description = ""},
    {id="pants", name = "Pantalons", description = ""},
    {id="shoes", name = "Chaussures", description = ""},
    {id="gloves", name = "Gants", description = ""},
    {id="accessory_1", name = "Accessoire 1", description = ""},
    {id="accessory_2", name = "Accessoire 2", description = ""},
    {id="accessory_3", name = "Accessoire 3", description = ""},
    {id="accessory_4", name = "Accessoire 4", description = ""},
    {id=nil, name = "Sauvegarder", description = ""}
}
)

skinMenu:setMenu(
    "head", "Visages",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "hair", "hair",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "tshirt", "tshirt",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "jacket", "Vestes",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "pants", "pantalons",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "shoes", "pantalons",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "gloves", "Gants",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "accessory_1", "Accessoire 1",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "accessory_2", "Accessoire 2",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "accessory_3", "Accessoire 3",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

skinMenu:setMenu(
    "accessory_4", "Accessoire 4",{
    {name="item #1",id=1},
    {name="item #1",id=2},
    {name="item #1",id=3},
    {name="item #1",id=4},
    {name="item #1",id=5},
    {name="item #1",id=6},
    {name="item #1",id=7},
    {name="item #1",id=8},
    {name="item #1",id=9},
    {name="item #1",id=10},
    {name="item #1",id=11},
    {name="item #1",id=12},
    {name="item #1",id=13},
    {name="item #1",id=14},
    {name="item #1",id=15},
    {name="item #1",id=16},
    {name="item #1",id=17},
    {name="item #1",id=18},
    {name="item #1",id=19},
    {name="item #1",id=20},
    {name="item #1",id=21}
}
)

local currentPlayer = Player()

function skinCreator()

    if skinMenu.opened == true then
        local menu = skinMenu.menu[skinMenu.currentmenu]
        skinMenu:drawTxt(skinMenu.title,1,1,skinMenu.x,skinMenu.y,1.0, 255,255,255,255)
        skinMenu:drawMenuTitle(skinMenu.title, skinMenu.x,skinMenu.y + 0.08)
        skinMenu:drawTxt(skinMenu.selectedbutton.."/".. skinMenu:tableLength(menu.buttons),0,0,skinMenu.x + skinMenu.width/2 - 0.0385,skinMenu.y + 0.067,0.4, 255,255,255,255)
        local y = skinMenu.y + 0.12
        local buttoncount = skinMenu:tableLength(menu.buttons)
        local selected = false

        for i,button in pairs(menu.buttons) do

            if i >= skinMenu.from and i <= skinMenu.to then

                if i == skinMenu.selectedbutton then
                    selected = true
                else
                    selected = false
                end

                -- Creation du bouton
                skinMenu:drawMenuButton(button,skinMenu.x,y,selected)

                -- ajout d'un espacement pour le prochain
                y = y + 0.04
                submenu("head", selected, menu, button, 0)
                submenu("hair",  selected, menu, button, 2)
                submenu("tshirt",  selected, menu, button, 8)
                submenu("jacket",  selected, menu, button, 11)
                submenu("pants",  selected, menu, button, 4)
                submenu("shoes",  selected, menu, button, 6)
                submenu("gloves",  selected, menu, button, 3)
                submenu("accessory_1",  selected, menu, button, 1)
                submenu("accessory_2",  selected, menu, button, 5)
                submenu("accessory_3",  selected, menu, button, 7)
                submenu("accessory_4",  selected, menu, button, 9)



                -- Boutons d'action (Flèches)

                -- Action de selection du bouton ( ENTREE)
                if selected and IsControlJustPressed(1,201) then
                    if button.name == "Sauvegarder" then

                        local user = {
                            head = skinMenu.menu['head'].userSelect,
                            hair = skinMenu.menu['hair'].userSelect,
                            h2 = skinMenu.menu['hair'].userSelectVariation,

                            tshirt = skinMenu.menu['tshirt'].userSelect,
                            t2 = skinMenu.menu['tshirt'].userSelectVariation,

                            jacket = skinMenu.menu['jacket'].userSelect,
                            j2 = skinMenu.menu['jacket'].userSelectVariation,

                            pants = skinMenu.menu['pants'].userSelect,
                            p2 = skinMenu.menu['pants'].userSelectVariation,

                            shoes = skinMenu.menu['shoes'].userSelect,
                            s2 = skinMenu.menu['shoes'].userSelectVariation,

                            gloves = skinMenu.menu['gloves'].userSelect,
                            g2 = skinMenu.menu['gloves'].userSelectVariation,

                            accessory1 = skinMenu.menu['accessory_1'].userSelect,
                            aa = skinMenu.menu['accessory_1'].userSelectVariation,
                            accessory2 = skinMenu.menu['accessory_2'].userSelect,
                            ab = skinMenu.menu['accessory_2'].userSelectVariation,
                            accessory3 = skinMenu.menu['accessory_3'].userSelect,
                            ac = skinMenu.menu['accessory_3'].userSelectVariation,
                            accessory4 = skinMenu.menu['accessory_4'].userSelect,
                            ad = skinMenu.menu['accessory_4'].userSelectVariation
                        }

                        TriggerServerEvent("shopcloths:save", user)
                        skinMenu.opened = false
                    end

                    skinMenu:ButtonSelected(skinMenu, button)
                end

            end

        end
        if IsControlJustPressed(1,202) then
            skinMenu:back(skinMenu)
        end
        if IsControlJustReleased(1,202) then
            skinMenu.backlock = false
        end
        if IsControlJustPressed(1,188) then -- Up key
            if skinMenu.selectedbutton > 1 then
                skinMenu.selectedbutton = skinMenu.selectedbutton -1
                if buttoncount > 10 and skinMenu.selectedbutton < skinMenu.from then
                    skinMenu.from = skinMenu.from -1
                    skinMenu.to = skinMenu.to - 1
                end
            end
        end
        if IsControlJustPressed(1,187)then -- Down key
            if skinMenu.selectedbutton < buttoncount then
                skinMenu.selectedbutton = skinMenu.selectedbutton +1
                if buttoncount > 10 and skinMenu.selectedbutton > skinMenu.to then
                    skinMenu.to = skinMenu.to + 1
                    skinMenu.from = skinMenu.from + 1
                end
            end
        end


    end


end

function submenu(menuId, selected, menu, button, ComponentId)
    if skinMenu.currentmenu == menuId then
        if selected then
            menu.currentVariation = navigation(menu, button.id, ComponentId)
        end
    end
end

function navigation(menu, button, type)

    if IsControlJustPressed(1, 175) then -- right key
        if menu.currentVariation < GetNumberOfPedTextureVariations( GetPlayerPed(-1), type, button) - 1 then
            menu.currentVariation = menu.currentVariation + 1
            SetPedComponentVariation(GetPlayerPed(-1), type, button, menu.currentVariation, 0)
        end
    elseif IsControlJustPressed(1, 174) then -- left key
        if menu.currentVariation > 0 then
            menu.currentVariation = menu.currentVariation - 1
            SetPedComponentVariation(GetPlayerPed(-1), type, button, menu.currentVariation, 0)
        end
    else
        SetPedComponentVariation(GetPlayerPed(-1), type, button, menu.currentVariation, 0)
    end
    menu.userSelect = tonumber(button)
    menu.userSelectVariation = tonumber(menu.currentVariation)
    return  menu.currentVariation

end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local clothingStores = {
    { ['x'] = 1864.4403076172, ['y'] = 3747.3469238281, ['z'] = 33.031894683838 },
    { ['x'] = 1693.2647705078, ['y'] = 4822.2797851563, ['z'] = 42.063091278076 },
    { ['x'] = 125.83338165283, ['y'] = -223.16986083984, ['z'] = 54.55782699585 },
    { ['x'] = -710.16009521484, ['y'] = -153.26420593262, ['z'] = 37.415138244629 },
    { ['x'] = -821.69067382813, ['y'] = -1073.900390625, ['z'] = 11.328099250793 },
    { ['x'] = -1192.8112792969, ['y'] = -768.24377441406, ['z'] = 17.319314956665 },
    { ['x'] = 4.2589497566223, ['y'] = 6512.8803710938, ['z'] = 31.877851486206 },
}

Citizen.CreateThread(function()
    for k,v in ipairs(clothingStores)do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 73)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Customize Player")
        EndTextCommandSetBlipName(blip)
    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        skinCreator()

        local pos = GetEntityCoords(GetPlayerPed(-1), false)
        for _,d in ipairs(clothingStores)do
            if Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 20.0 then
                DrawMarker(1, d.x, d.y, d.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 255, 255, 0,155, 0,0, 0,0)
            end

            if(Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 1.0) then
                DisplayHelpText("Appuyez sur la touche ~INPUT_CONTEXT~ pour ouvrir le magasin.")
            end

            if(IsControlJustPressed(1, 51) and Vdist(d.x, d.y, d.z, pos.x, pos.y, pos.z) < 1.0) then
                if skinMenu.opened then
                    skinMenu:close()
                else
                    skinMenu:open()
                end
            end

        end
    end

end)
