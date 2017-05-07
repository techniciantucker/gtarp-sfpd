--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 04/05/2017
-- Time: 17:41
-- To change this template use File | Settings | File Templates.
--

--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 04/05/2017
-- Time: 12:51
-- To change this template use File | Settings | File Templates.
--

local ammuMenusOptions = {
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

local ammunationsMenu = ModuleMenu:create(ammuMenusOptions)
local meleeWeapons = {
    {
       title = "Knife", name = "Knife", costs = 155000, description = {}, model = "WEAPON_Knife"
    },
    { title = "Nightstick", name = "Nightstick", costs = 25000, description = {}, model = "WEAPON_Nightstick"
    },
    { title = "Hammer", name = "Hammer", costs = 18000, description = {}, model = "WEAPON_HAMMER"},
    { title = "Bat", name = "Bat", costs = 85000, description = {}, model = "WEAPON_Bat"},
    { title = "Crowbar", name = "Crowbar", costs = 30000, description = {}, model = "WEAPON_Crowbar"},
    { title = "Golfclub", name = "Golfclub", costs = 120000, description = {}, model = "WEAPON_Golfclub"},
    { title = "Bottle", name = "Bottle", costs = 120000, description = {}, model = "WEAPON_Bottle"},
    { title = "Dagger", name = "Dagger", costs = 120000, description = {}, model = "WEAPON_Dagger"},
    { title = "Hatchet", name = "Hatchet", costs = 120000, description = {}, model = "WEAPON_Hatchet"},
    { title = "KnuckleDuster", name = "KnuckleDuster", costs = 120000, description = {}, model = "WEAPON_KnuckleDuster"},
    { title = "Machete", name = "Machete", costs = 30000, description = {}, model = "WEAPON_Machete"},
    { title = "Flashlight", name = "Flashlight", costs = 120000, description = {}, model = "WEAPON_Flashlight"},
    { title = "SwitchBlade", name = "SwitchBlade", costs = 120000, description = {}, model = "WEAPON_SwitchBlade"},
    { title = "Poolcue", name = "Poolcue", costs = 120000, description = {}, model = "WEAPON_Poolcue"},
    { title = "Wrench", name = "Wrench", costs = 120000, description = {}, model = "WEAPON_Wrench"},
    { id=16, title = "Battleaxe", name = "Battleaxe", costs = 120000, description = {}, model = "WEAPON_Battleaxe"}
}
local pistolWeapons = {
    {title = "Pistol", name = "Pistol", costs = 500, description = {}, model = "WEAPON_Pistol"},
    {title = "Combat Pistol", name = "CombatPistol", costs = 1000, description = {}, model = "WEAPON_CombatPistol"},
    {title = "Pistol Cal 50", name = "Pistol50", costs = 3000, description = {}, model = "WEAPON_PISTOL50"},
    {title = "SNS Pistol", name = "SNSPistol", costs = 5000, description = {}, model = "WEAPON_SNSPistol"},
    {title = "Heavy Pistol", name = "HeavyPistol", costs = 8000, description = {}, model = "WEAPON_HeavyPistol"},
    {title = "Vintage Pistol", name = "VintagePistol", costs = 15000, description = {}, model = "WEAPON_VintagePistol"},
    {title = "Marksman Pistol", name = "MarksmanPistol", costs = 2000, description = {}, model = "WEAPON_MarksmanPistol"},
    {title = "Revolver", name = "Revolver", costs = 1900, description = {}, model = "WEAPON_Revolver"},
    {title = "AP Pistol", name = "APPistol", costs = 2700, description = {}, model = "WEAPON_APPistol"},
    {title = "Stun Gun", name = "StunGun", costs = 2800, description = {}, model = "WEAPON_StunGun"},
    {title = "Flare Gun", name = "FlareGun", costs = 2900, description = {}, model = "WEAPON_FlareGun"}
}
local machineGunWeapons = {
    {title = "MicroSMG", name = "MicroSMG", costs = 15000, description = {}, model = "WEAPON_MicroSMG"},
    {title = "Machine Pistol", name = "MachinePistol", costs = 155000, description = {}, model = "WEAPON_MachinePistol"},
    {title = "SMG", name = "SMG", costs = 25000, description = {}, model = "WEAPON_SMG"},
    {title = "Assault SMG", name = "AssaultSMG", costs = 18000, description = {}, model = "WEAPON_AssaultSMG"},
    {title = "Combat PDW", name = "CombatPDW", costs = 85000, description = {}, model = "WEAPON_CombatPDW"},
    {title = "MG", name = "MG", costs = 30000, description = {}, model = "WEAPON_MG"},
    {title = "Combat MG", name = "CombatMG", costs = 120000, description = {}, model = "WEAPON_CombatMG"},
    {title = "Gusenberg", name = "Gusenberg", costs = 120000, description = {}, model = "WEAPON_Gusenberg"},
    {title = "Mini SMG", name = "MiniSMG", costs = 120000, description = {}, model = "WEAPON_MiniSMG"}
}
local shotgunWeapons = {
    {title = "Pump Shotgun", name = "PumpShotgun", costs = 150000, description = {}, model = "WEAPON_PumpShotgun"},
    {title = "Sawn-off Shotgun", name = "SawnoffShotgun", costs = 220000, description = {}, model = "WEAPON_SawnoffShotgun"},
    {title = "Bullpup Shotgun", name = "BullpupShotgun", costs = 250000, description = {}, model = "WEAPON_BullpupShotgun"},
    {title = "Assault Shotgun", name = "AssaultShotgun", costs = 280000, description = {}, model = "WEAPON_AssaultShotgun"},
    {title = "Musket", name = "Musket", costs = 850000, description = {}, model = "WEAPON_Musket"},
    {title = "Heavy Shotgun", name = "HeavyShotgun", costs = 35000, description = {}, model = "WEAPON_HeavyShotgun"},
    {title = "Double-Barrel Shotgun", name = "DoubleBarrelShotgun", costs = 400000, description = {}, model = "WEAPON_DoubleBarrelShotgun"},
    {title = "Auto Shotgun", name = "Autoshotgun", costs = 450000, description = {}, model = "WEAPON_Autoshotgun"}
}
local assaultWeapons = {
    {title = "Assault Rifle", name = "AssaultRifle", costs = 250000, description = {}, model = "WEAPON_AssaultRifle"},
    {title = "Carbine Rifle", name = "CarbineRifle", costs = 250000, description = {}, model = "WEAPON_CarbineRifle"},
    {title = "Advanced Rifle", name = "AdvancedRifle", costs = 300000, description = {}, model = "WEAPON_AdvancedRifle"},
    {title = "Special Carbine", name = "SpecialCarbine", costs = 310000, description = {}, model = "WEAPON_SpecialCarbine"},
    {title = "Bullpup Rifle", name = "BullpupRifle", costs = 350000, description = {}, model = "WEAPON_BullpupRifle"},
    {title = "FCompact Rifle", name = "CompactRifle", costs = 400000, description = {}, model = "WEAPON_CompactRifle"}
}
local sniperWeapons = {
    {title = "Sniper Rifle", name = "SniperRifle", costs = 500000, description = {}, model = "WEAPON_SniperRifle"},
    {title = "Heavy Sniper", name = "HeavySniper", costs = 800000, description = {}, model = "WEAPON_HeavySniper"},
    {title = "Marksman Rifle", name = "MarksmanRifle", costs = 1000000, description = {}, model = "WEAPON_MarksmanRifle"}
}
local heavyWeapons = {
    {title = "Grenade Launcher", name = "GrenadeLauncher", costs = 500000, description = {}, model = "WEAPON_GrenadeLauncher"},
    {title = "RPG", name = "RPG", costs = 800000, description = {}, model = "WEAPON_RPG"},
    {title = "Minigun", name = "Minigun", costs = 1000000, description = {}, model = "WEAPON_Minigun"},
    {title = "Firework", name = "Firework", costs = 1000000, description = {}, model = "WEAPON_Firework"},
    {title = "Railgun", name = "Railgun", costs = 999999999, description = {}, model = "WEAPON_Railgun"},
    {title = "Homing Launcher", name = "HomingLauncher", costs = 1000000, description = {}, model = "WEAPON_HomingLauncher"},
    {title = "Smoke-grenade Launcher", name = "GrenadeLauncherSmoke", costs = 1000000, description = {}, model = "WEAPON_GrenadeLauncherSmoke"},
    {title = "Compact Launcher", name = "CompactLauncher", costs = 1000000, description = {}, model = "WEAPON_CompactLauncher"}
}
local thrownWeapons = {
    {
        title = "Grenade", name = "Grenade", costs = 1500, description = {}, model = "WEAPON_Grenade"},
    {title = "Sticky Bomb", name = "StickyBomb", costs = 15500, description = {}, model = "WEAPON_StickyBomb"},
    {title = "Proximity Mine", name = "ProximityMine", costs = 250000, description = {}, model = "WEAPON_ProximityMine"},
    {title = "BZ Gas", name = "BZGas", costs = 1800, description = {}, model = "WEAPON_BZGas"},
    {title = "Molotov", name = "Molotov", costs = 85000, description = {}, model = "WEAPON_Molotov"},
    {title = "Fire Extinguisher", name = "FireExtinguisher", costs = 3000, description = {}, model = "WEAPON_FireExtinguisher"},
    {title = "Petrol Can", name = "PetrolCan", costs = 120000, description = {}, model = "WEAPON_PetrolCan"},
    {title = "Flare", name = "Flare", costs = 12000, description = {}, model = "WEAPON_Flare"},
    {title = "Ball", name = "Ball", costs = 120, description = {}, model = "WEAPON_Ball"},
    {title = "Snowball", name = "Snowball", costs = 120, description = {}, model = "WEAPON_Snowball"},
    {title = "Smoke Grenade", name = "SmokeGrenade", costs = 12000, description = {}, model = "WEAPON_SmokeGrenade"},
    {title = "Bombe artisanale", name = "Pipebomb", costs = 3000, description = {}, model = "WEAPON_Pipebomb"}
}

function ammunationsMenu:saveItem(menuId)
    local item = {
        menuId = menuId,
        value = value,
        value_texture = value_texture
    }
    TriggerServerEvent("shopcloths:saveItem", item)
end

function playAnimWhenBuy()
    RequestAnimDict("anim@weapons@pistol@flare_str")
    while not HasAnimDictLoaded("anim@weapons@pistol@flare_str") do
        Citizen.Wait(0)
    end
    if HasAnimDictLoaded("anim@weapons@pistol@flare_str") then
        TaskPlayAnim( PlayerPedId(),"anim@weapons@pistol@flare_str", "reload_aim" ,8.0, -8.0, -1, 0, 0, false, false, false )
    end
end

function ammunationsMenu:getListWithActions(weaponsList)
    for i, item in pairs(weaponsList) do
        item.id = i
        item.onClick  = function()
            local hash = GetHashKey(item.model)
            GiveWeaponToPed(GetPlayerPed(-1), hash, 100, 0, false)
            SetCurrentPedWeapon(GetPlayerPed(-1), hash, 100)
            -- playAnimWhenBuy()
            -- ammunationsMenu:saveItem(item.model)
        end
        item.onLeft          = function() return false end
        item.onRight         = function() return false end
        item.onSelected      = function() return false end
        item.onBack          = function()
            ammunationsMenu:toMenu(ammunationsMenu:getLastMenu())
        end
    end
    return weaponsList
end

local ammunationsStores = {
    { ['x'] = 74.504, ['y'] = -1971.366, ['z'] = 19.788, ['markerWidth'] = 4.0001,  ['activationDist'] = 3.5 },
    { ['x'] = 252.414459228516, ['y'] = -48.1506080627441, ['z'] = 69.9410552978516, ['markerWidth'] = 7.0001,  ['activationDist'] = 7.5 },
    { ['x'] = -1305.58471679688, ['y'] = -392.492462158203, ['z'] = 36.6957702636719, ['markerWidth'] = 7.0001,  ['activationDist'] = 7.5}
}

ammunationsMenu:setMenu( "main","Ammunations",{
    {
        id="melee",
        name = "Armes de melee",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("melee")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    },
    {
        id="pistol",
        name = "Pistolets",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("pistol")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    },
    {
        id="machinegun",
        name = "machineguns",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("machinegun")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    },
    {
        id="shotgun",
        name = "Fusils a pompe",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("shotgun")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    },
    {
        id="assault",
        name = "Fusils d assault",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("assault")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    },
    {
        id="sniper",
        name = "Fusils d assault",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("sniper")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    },
    {
        id="heavy",
        name = "Armes lourdes",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("heavy")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    },
    {
        id="thrown",
        name = "Armes de jets",
        description = "",
        onClick = function()
            ammunationsMenu:toMenu("thrown")
        end,
        onLeft = function() return false end,
        onRight = function() return false end,
        onSelected = function() return false end,
        onBack = function() return false end
    }
}, false )
ammunationsMenu:setMenu( "melee", "Armes de melee", function() return ammunationsMenu:getListWithActions(meleeWeapons) end , true )
ammunationsMenu:setMenu( "pistol", "Pistolets",function() return ammunationsMenu:getListWithActions(pistolWeapons) end , true )
ammunationsMenu:setMenu( "machinegun", "machine guns",function() return ammunationsMenu:getListWithActions(machineGunWeapons) end , true )
ammunationsMenu:setMenu( "shotgun", "Fusils a pompes",function() return ammunationsMenu:getListWithActions(shotgunWeapons) end , true )
ammunationsMenu:setMenu( "assault", "Fusils d assault",function() return ammunationsMenu:getListWithActions(assaultWeapons) end , true )
ammunationsMenu:setMenu( "sniper", "Fusils de sniper",function() return ammunationsMenu:getListWithActions(sniperWeapons) end , true )
ammunationsMenu:setMenu( "heavy", "Armes lourdes",function() return ammunationsMenu:getListWithActions(heavyWeapons) end , true )
ammunationsMenu:setMenu( "thrown", "Armes de jet",function() return ammunationsMenu:getListWithActions(thrownWeapons) end , true )

Citizen.CreateThread(function()
    ammunationsMenu:setMapMarker(ammunationsStores, 110, 59, "Magasins d armes")
    while true do
        Citizen.Wait(0)
        if ammunationsMenu.opened == true then
            ammunationsMenu:display()
        end
        ammunationsMenu:setBlipAndMarker(ammunationsStores, 1, 255, 255, 0, 155)
    end
end)

