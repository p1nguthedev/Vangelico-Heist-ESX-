Config = {
    {
        id = 1,
        broken = false,
        objPos = vector3(-627.735, -234.439, 37.875),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end'
    },
    {
        id = 2,
        broken = false,
        objPos = vector3(-626.716, -233.685, 37.8583),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end'
    },
    {
        id = 3,
        broken = false,
        objPos = vector3(-627.35, -234.947, 37.8531),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end'
    },
    {
        id = 4,
        broken = false,
        objPos = vector3(-626.298, -234.193, 37.8492),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end'
    },
    {
        id = 5,
        broken = false,
        objPos = vector3(-626.399, -239.132, 37.8616),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end'
    },
    {
        id = 6,
        broken = false,
        objPos = vector3(-625.376, -238.358, 37.8687),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end'
    },
    {
        id = 7,
        broken = false,
        objPos = vector3(-625.517, -227.421, 37.86),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end'
    },
    {
        id = 8,
        broken = false,
        objPos = vector3(-624.467, -226.653, 37.861),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end'
    },
    {
        id = 9,
        broken = false,
        objPos = vector3(-623.8118, -228.6336, 37.8522),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end'
    },
    {
        id = 10,
        broken = false,
        objPos = vector3(-624.1267, -230.7476, 37.8618),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end'
    },
    {
        id = 11,
        broken = false,
        objPos = vector3(-621.7181, -228.9636, 37.8425),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end'
    },
    {
        id = 12,
        broken = false,
        objPos = vector3(-622.7541, -232.614, 37.8638),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end'
    },
    {
        id = 13,
        broken = false,
        objPos = vector3(-620.3262, -230.829, 37.8578),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end'
    },
    {
        id = 14,
        broken = false,
        objPos = vector3(-620.6465, -232.9308, 37.8407),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end'
    },
    {
        id = 15,
        broken = false,
        objPos = vector3(-619.978, -234.93, 37.8537),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end'
    },
    {
        id = 16,
        broken = false,
        objPos = vector3(-618.937, -234.16, 37.8425),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end'
    },
    {
        id = 17,
        broken = false,
        objPos = vector3(-620.163, -226.212, 37.8266),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end'
    },
    {
        id = 18,
        broken = false,
        objPos = vector3(-619.384, -227.259, 37.8342),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end'
    },
    {
        id = 19,
        broken = false,
        objPos = vector3(-618.019, -229.115, 37.8302),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end'
    },
    {
        id = 20,
        broken = false,
        objPos = vector3(-617.249, -230.156, 37.8201),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end'
    },
}

Config.Doors = {
    ['vangelico_main_1'] = {
       doorHash = 'vangelico_main_1',
       modelHash = "p_jewel_door_r1",
       coordinates = vector3(-630.426514, -238.437546, 38.206532),
       Locked = 1, 
    },
    ['vangelico_main_2'] = {
       doorHash = 'vangelico_main_2',
       modelHash = "p_jewel_door_l",
       coordinates = vector3(-631.955383, -236.333267, 38.206532),
       Locked = 1,  
    },
    ['vangelico_inside_1'] = {
        doorHash = 'vangelico_inside_1',
        modelHash = "v_ilev_j2_door",
        coordinates = vector3(-628.6003, -229.7738, 38.0570),
        Locked = 1,  
     },
}

Config.StartHeistCoords = vec3(-596.228577, -283.859344, 50.308472)
Config.LockpickDoor = vec3(-628.6003, -229.7738, 38.0570)
Config.ComputerCoords = vec3(-631.305481, -230.162628, 38.041748)
Config.SearchPassword = vec3(-631.885742, -229.410980, 38.041748)
Config.sellJewelryPedCoords = vec3()

Config.policeJob = 'police'

Config.items = {
    {
        itemName = 'ring',
        itemChance = 50, -- Chance to get this item, between 1 and 100
        sellAmount = 400
    },
    {
        itemName = 'diamond',
        itemChance = 30,
        sellAmount = 300
    },
    {
        itemName = 'goldennecklace',
        itemChance = 20,
        sellAmount = 200
    },
}

Config.Use3DText = true

Config.itemChance = math.random(1, 6)

Config.useProgressbar = true

function alertMessage()
    ESX.ShowAdvancedNotification("Vangelico Robbery in progress", "", "Vangelico Robbery in progress, we marked it in your GPS!", "CHAR_CALL911", 1)
end

function Text3D(coords, text) -- settings of the 3D text
    local onScreen, x, y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z + 0.5)
    local factor = (string.len(text)) / 400

    SetTextScale(0.20, 0.20)
    SetTextOutline()
    SetTextCentre(true)
    SetTextDropShadow(2, 0, 0, 0, 255)
    SetTextEntry("STRING")
    SetTextColour(255, 255, 255, 255)
    AddTextComponentString(text)
    DrawText(x, y)
end

Config.Translation = {
    ["place_thermite"] = 'Place thermite',
    ["thermite_cooldown"] = 'This is not possible right now...',
    ["progbar_connecting"] = 'Connecting',
    ["lockpick_door"] = 'Lockpick Door',
    ["door_already_open"] = 'The door is already open..',
    ["doors_opened"] = 'The doors opened.',
    ["smash_glass"] = 'SMASH!',
    ["already_broken"] = 'This glass is already broken...',
    ["you_need_weapon"] = 'You need something stronger than this...',
    ["take_password"] = 'Take password',
    ["use_computer"] = 'Use computer',
    ["computer_menu_main"] = 'Computer',
    ["computer_menu_login"] = 'Log in',
    ["computer_dialog_main"] = 'Password...',
    ["computer_dialog_password"] = "Computer's password",
    ["progbar_finding_location"] = "Computer's password",
    ["computer_jewel_buyer_location"] = 'Searching for a buyer',
    ["you_got_location_on_map"] = 'You got the location of the jewelry buyer on your map',
    ["jewel_buyer"] = 'Jewel buyer',
    ["sell_jewelry"] = 'Sell jewelry',
    ["correct_password"] = 'The password was correct',
    ["incorrect_password"] = 'The password was incorrect',
    ["password"] = 'Password: ',
    ["3dtext_place_therimite"] = 'Place thermite'
}