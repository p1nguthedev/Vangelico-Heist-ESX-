local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

local function generatePassword(length)
    math.randomseed(GetGameTimer())
    local str = ""
    for i = 1, length do
        if i == 4 then
            str = str .. ""
        else
            str = str .. charset[math.random(1, #charset)]
        end
    end
    return str
end

CreateThread(function()
    GlobalState.doorz = Config.Doors
    print(Config.Doors)
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:server:openDoors', function(lockState)
    
    local doors = GlobalState.doorz
    local doorName = "vangelico_main_1"
    local doorName2 = "vangelico_main_2"

    if not doorName or not doors[doorName] and not doorName2 or not doors[doorName2] then
        return
    end

    if not lockState or (lockState ~= 0 and lockState ~= 1) then 
        return
    end

    doors[doorName].locked = lockState
    doors[doorName2].locked = lockState

    GlobalState.doorz = doors
    
    TriggerClientEvent('nipa-doors:openDoors', -1, doorName, doorName2, lockState)
    
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:server:openDoor', function(lockState)
    local doors = GlobalState.doorz
    local doorName = "vangelico_inside_1"

    if not doorName or not doors[doorName] then
        return
    end

    if not lockState or (lockState ~= 0 and lockState ~= 1) then 
        return
    end

    doors[doorName].locked = lockState

    GlobalState.doorz = doors
    
    TriggerClientEvent('nipa-doors:openDoor', -1, doorName, lockState)
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:server:generatePassword', function()
    realJewelPassword = generatePassword(math.random(5,7))
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:server:password', function()
    local source = source
    local player = ESX.GetPlayerFromId(source)
    if player then 
        TriggerClientEvent('esx:showNotification', source, Config.Translation["password"] .. realJewelPassword)
    end
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:server:passwordInput', function(passwordParam)
        if tostring(passwordParam) == realJewelPassword then
        local source = source
        TriggerClientEvent('esx:showNotification', source, Config.Translation["correct_password"])
        TriggerClientEvent('esx_p1ngu_vangelicoheist:client:variable', -1)
    else
        TriggerClientEvent('esx:showNotification', source, Config.Translation["incorrect_password"])
    end
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:server:thermite', function()
    thermite = true
    TriggerClientEvent('esx_p1ngu_vangelicoheist:client:updateThermiteStatus', -1, thermite)
    Wait(3600000)
    lockpickCooldown = false
    TriggerClientEvent('esx_p1ngu_vangelicoheist:client:updateLockpickCooldown', -1, false)
    TriggerClientEvent('esx_p1ngu_vangelicoheist:client:resetHeist', -1)
    thermite = false
    TriggerClientEvent('esx_p1ngu_vangelicoheist:client:updateThermiteStatus', -1, thermite)
    ResetAllCooldowns()
    lockState = 1
    TriggerEvent('esx_p1ngu_vangelicoheist:server:openDoor', lockState)
    lockState = 1
    TriggerEvent('esx_p1ngu_vangelicoheist:server:openDoors', lockState)
end)

local jewelCooldowns = {}

RegisterServerEvent('esx_p1ngu_vangelicoheist:server:cabCooldown')
AddEventHandler('esx_p1ngu_vangelicoheist:server:cabCooldown', function(jewelId)
    if jewelCooldowns[jewelId] then
        return
    end

    jewelCooldowns[jewelId] = true
    TriggerClientEvent('esx_p1ngu_vangelicoheist:client:updateCooldown', -1, jewelId, true)
end)

function ResetAllCooldowns()
    for jewelId, _ in pairs(jewelCooldowns) do
        jewelCooldowns[jewelId] = false
        TriggerClientEvent('esx_p1ngu_vangelicoheist:client:updateCooldown', -1, jewelId, false)
    end
end

RegisterServerEvent('esx_p1ngu_vangelicoheist:server:jewels', function(jewelId)
    local source = source
    TriggerClientEvent('esx_p1ngu_vangelicoheist:client:jewels', source, jewelId)
end)

RegisterServerEvent('esx_p1ngu_vangelicoheist:server:addItem', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        for c = 1, #Config.items do
            local item = Config.items[c].itemName
            local itemChance = Config.items[c].itemChance or 100 -- Default chance if not provided in Config

            if item then
                if math.random(1, 100) <= itemChance then
                    xPlayer.addInventoryItem(item, 1)
                end
            end
        end
    end
end)

lockpickCooldown = false

RegisterNetEvent('esx_p1ngu_vangelicoheist:server:lockpick', function()
    if lockpickCooldown then
        return
    end

    lockpickCooldown = true
    TriggerClientEvent('esx_p1ngu_vangelicoheist:client:updateLockpickCooldown', -1, true)
end)

RegisterNetEvent('esx_pd_jewelTargets:server', function ()
    TriggerClientEvent("esx_pd_jewelTargets", -1)
end)

RegisterServerEvent('esx_p1ngu_vangelicoheist:server:sellItem', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
  
    if xPlayer then
        for c = 1, #Config.items do
        local getitem = xPlayer.getInventoryItem(Config.items[c].itemName).count
        xPlayer.removeInventoryItem(Config.items[c].itemName, getitem)
        xPlayer.addMoney(Config.items[c].sellAmount * getitem)
        end
    end
end)

RegisterNetEvent('esx_pd_alarmrob:server', function ()
    TriggerClientEvent("esx_pd_alarmrob", -1)
end)

RegisterNetEvent('esx_pd_alarmpolice:server', function ()
    TriggerClientEvent("policealert", -1)
end)

RegisterNetEvent('esx_pd_glassbreaksync:server', function (jewelId)
    TriggerClientEvent("esx_pd_glassbreaksync:client", -1, jewelId)
end)