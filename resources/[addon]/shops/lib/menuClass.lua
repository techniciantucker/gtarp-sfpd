
-- Constructor
ModuleMenu =  {}
ModuleMenu.__index = ModuleMenu

-- Meta table for ModuleMenu
setmetatable(ModuleMenu, {
    __call = function(self, menuOptions)
        local self = {}

        self.menu = {}
        self.x = menuOptions.x
        self.y = menuOptions.y
        self.width = menuOptions.width
        self.height = menuOptions.height
        self.buttons = menuOptions.buttons
        self.from = menuOptions.from
        self.to = menuOptions.to
        self.scale = menuOptions.scale
        self.font = menuOptions.font
        self.opened = menuOptions.opened
        self.title = menuOptions.title
        self.currentmenu = menuOptions.currentmenu
        self.lastmenu = menuOptions.lastmenu
        self.currentpos = menuOptions.currentpos
        self.selectedbutton = menuOptions.selectedbutton
        self.marker = menuOptions.marker
        self.baseMenu = menuOptions.currentmenu

        return setmetatable(self, ModuleMenu)
    end
})



function ModuleMenu:setMenu(menuName, title, buttons)
    self.menu[menuName] = {title = title, name = menuName,buttons = buttons, currentVariation = 0, userSelect = 0, userSelectVariation = 0}
end

function ModuleMenu:OpenMenu(menu)
    self.lastmenu = self.currentmenu
    if menu ~= self.baseMenu then
        self.lastmenu = self.baseMenu
    end
    self.from = 1
    self.to = 10
    self.selectedbutton = 0
    self.currentmenu = menu
end

function ModuleMenu:ButtonSelected(menu, button)
    local btn = button.id
    if btn ~= nil then
        if self.currentmenu == menu.baseMenu then
            menu:OpenMenu(btn)
        end
    end
end

function ModuleMenu:drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function ModuleMenu:drawMenuButton(button,x,y,selected)
    local menu = self
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(menu.scale, menu.scale)
    if selected then
        SetTextColour(0, 0, 0, 255)
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(button.name)
    if selected then
        DrawRect(x,y,menu.width,menu.height,255,255,255,255)
    else
        DrawRect(x,y,menu.width,menu.height,0,0,0,150)
    end
    DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function ModuleMenu:drawMenuInfo(text)
    local menu = self
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
    DrawText(0.365, 0.934)
end

function ModuleMenu:drawMenuRight(txt,x,y,selected)
    local menu = self
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(menu.scale, menu.scale)
    SetTextRightJustify(1)
    if selected then
        SetTextColour(0, 0, 0, 255)
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(txt)
    DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function ModuleMenu:drawMenuTitle(txt,x,y)
    local menu = self
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.5, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    AddTextComponentString(txt)
    DrawRect(x,y,menu.width,menu.height,58,83,155,150)
    DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function ModuleMenu:tableLength(table)
    local count = 0
    for _ in pairs(table) do count = count + 1 end
    return count
end

function ModuleMenu:back(menu)
    if menu.backlock then        return
    end
    menu.backlock = true
    if self.currentmenu == self.baseMenu then
        --CloseCreator()
    else
        menu:OpenMenu(menu.lastmenu)
    end
end

function ModuleMenu:open()
    self.opened = true
end
function ModuleMenu:close()
    self.opened = false
end