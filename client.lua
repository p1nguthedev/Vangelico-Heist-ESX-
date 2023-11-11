local thermite = false
local canUseJewelComputer = false

RegisterNetEvent('esx_p1ngu_vangelicoheist:client:variable', function()
    
    canUseJewelComputer = true
    
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:client:thermite', function()
    thermite = true
end)

function target()
    exports.ox_target:addSphereZone({
        coords = vector3(Config.StartHeistCoords),
        radius = 0.7,
        debug = drawZones,
        options = {
            {
                name = 'jewel-juuttujuttu',
                icon = 'fa-solid fa-circle',
                label = Config.Translation["place_thermite"],
                canInteract = function()
                    return not thermite
                end,
                onSelect = function()
                    minigame()
                end,
            }
        },
    })
end

CreateThread(function()
    if Config.Use3DText == false then
    target()
    else 
    end
    while true do
        local wait = 500
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - Config.StartHeistCoords)

        if Config.Use3DText and distance < 3.0 then
            wait = 0
            Text3D(Config.StartHeistCoords, Config.Translation["3dtext_place_therimite"])
            if IsControlJustPressed(0, 38) then 
            minigame()
        end
    end
        Wait(wait)  -- Changed the wait time to 500 milliseconds (0.5 seconds)
    end
end)

if Config.Use3DText == false then
exports.ox_target:addSphereZone({
    coords = vec3(Config.LockpickDoor),
    radius = 0.7,
    debug = drawZones,
    options = {
        {
        name = 'jewel-juuttujuttu235',
        icon = 'fa-solid fa-circle',
        label = Config.Translation["lockpick_door"],
        onSelect = function()
            if thermite then return lockpick() end
        end,
    }
},
})else 
end
    local wait = 500
    local playerCoords = GetEntityCoords(PlayerPedId())
    local distance = #(playerCoords - Config.LockpickDoor)

    if Config.Use3DText and distance < 3.0 then
        wait = 0
        Text3D(Config.LockpickDoor, Config.Translation["3dtext_lockpick_door"])
        if IsControlJustPressed(0, 38) then 
        lockpick()
    end
end


local lockpickV = false

if Config.Use3DText == false then
exports.ox_target:addSphereZone({
    coords = vec3(-631.305481, -230.162628, 38.041748),
    radius = 1.0,
    debug = drawZones,
    options = {
        {
        name = 'jewel-juuttujuttu235',
        icon = 'fa-solid fa-circle',
        label = Config.Translation["use_computer"],
        onSelect = function()
            if not lockpickV then return end
            if not canUseJewelComputer then lib.showContext('jewelComputer_main') return end
            lib.showContext('jewelComputer_final')
        end,
    }
},
}) else 
end 
local wait = 500
local playerCoords = GetEntityCoords(PlayerPedId())
local distance = #(playerCoords - Config.LockpickDoor)

if Config.Use3DText and distance < 3.0 then
    wait = 0
    Text3D(Config.LockpickDoor, Config.Translation["3dtext_lockpick_door"])
    if IsControlJustPressed(0, 38) then 
    lockpick()
end
end

lib.registerContext({
    id = 'jewelComputer_main',
    title = Config.Translation["computer_menu_main"],
    options = {
        {
            title = Config.Translation["computer_menu_login"],
            onSelect = function()
                local input = lib.inputDialog(Config.Translation["computer_dialog_main"], {Config.Translation["computer_dialog_password"]})
                if not input then return end
                local passwordParam = input[1]
                TriggerServerEvent('esx_p1ngu_vangelicoheist:server:passwordInput', passwordParam)
            end,
            icon = 'bars'
        },
        {
            title = "?????",
            onSelect = function()
                
            end,
            icon = 'bars',
            disabled = true
        },
    }
})

lib.registerContext({
    id = 'jewelComputer_final',
    title = Config.Translation["computer_menu_main"],
    options = {
        {
            Config.Translation["computer_menu_login"],
            onSelect = function()
            end,
            icon = 'bars',
            disabled = true
        },
        {
            title = Config.Translation["computer_jewel_buyer_location"],
            onSelect = function()
                jewelBuyer()
            end,
            icon = 'bars',
            disabled = false
        },
    }
})


local function searchPass()
    
    TriggerServerEvent('esx_p1ngu_vangelicoheist:server:password')
end

local passwordHide = false

local function hidePassword()
    TriggerServerEvent('esx_p1ngu_vangelicoheist:server:generatePassword')
    passwordHide = exports.ox_target:addSphereZone({
        coords = vec3(Config.SearchPassword),
        radius = 1,
        debug = drawZones,
        options = {
            {
                name = 'password-juttu',
                icon = 'fa-solid fa-circle',
                label = Config.Translation["take_password"],              
                onSelect = function()
                    searchPass()
                end,
            }
        },
    })
else 
    if passwordHide == false then
        local wait = 500
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - Config.SearchPassword)
        
        if Config.Use3DText and distance < 3.0 then
            wait = 0
            Text3D(Config.SearchPassword, Config.Translation["3dtext_take_password"])
            if IsControlJustPressed(0, 38) then 
            searchPass()
        end
    end 
end

local sellJewelry3dtext = false

function jewelBuyer()
    if not Config.useProgressbar then
        notProgbar2()
        return
    end

    if lib.progressCircle({
        duration = 1000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
    }) then
    end

    local options = {
        {
            name = 'jewelry-buyer',
            icon = 'fa-solid fa-road',
            label = Config.Translation["sell_jewelry"],
            distance = 1,
            onSelect = function()
                sellJewelry()
            end,
        },
    }

    if not Config.Use3DText then
        exports.ox_target:addLocalEntity(ped1, options)
    else
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - Config.sellJewelryPedCoords)

        if sellJewelry3dtext == false then
            if distance < 3.0 then
                wait = 0
                Text3D(Config.sellJewelryPedCoords, Config.Locales["3dtext_crab_packages"])

                if IsControlJustPressed(0, 38) then
                    sellJewelry()
                    sellJewelry3dtext = true
                    ClearPedTasks(PlayerPedId())
                end
            end
        end
    end

    if notProgbar2() then
        buyerBlip = AddBlipForCoord(-732.0348, -2023.8901, 8.8926)
        SetBlipRoute(buyerBlip, true)
        SetBlipColour(buyerBlip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Translation["jewel_buyer"])
        EndTextCommandSetBlipName(buyerBlip)
        ESX.ShowNotification(Config.Translation["you_got_location_on_map"])
        ClearArea(-732.0348, -2023.8901, 8.8926, 50.0, 0, false, false, 0)

        lib.requestModel('s_m_m_bouncer_01', 50)
        lib.requestModel('csb_thornton', 50)
        lib.requestModel('baller3', 50)
        ped1 = CreatePed(28, "csb_thornton", -731.8315, -2028.8278, 7.8975, 294.0009, true, false)
        ped2 = CreatePed(28, 's_m_m_bouncer_01', -732.0348, -2023.8901, 7.8926, 236.1324, true, false)
        TaskStartScenarioInPlace(ped1, "WORLD_HUMAN_AA_SMOKE", 0, 0)
        TaskStartScenarioInPlace(ped2, "WORLD_HUMAN_STAND_MOBILE", 0, 0)

        ballerVehicle = CreateVehicle("baller3", -734.4916, -2026.5055, 8.8971, 93.2163, true, false)

        SetBlockingOfNonTemporaryEvents(ped1, true)
        SetPedDiesWhenInjured(ped1, false)
        SetPedCanPlayAmbientAnims(ped1, true)
        SetPedCanRagdollFromPlayerImpact(ped1, false)
        SetEntityInvincible(ped1, true)
        FreezeEntityPosition(ped1, true)

        SetBlockingOfNonTemporaryEvents(ped2, true)
        SetPedDiesWhenInjured(ped2, false)
        SetPedCanPlayAmbientAnims(ped2, true)
        SetPedCanRagdollFromPlayerImpact(ped2, false)
        SetEntityInvincible(ped2, true)
        FreezeEntityPosition(ped2, true)

        SetEntityInvincible(ballerVehicle, true)
        SetVehicleTyresCanBurst(ballerVehicle, false)
        FreezeEntityPosition(ballerVehicle, false)
        SetVehicleDoorsLockedForAllPlayers(ballerVehicle, true)
    end
end

RegisterNetEvent("pd_vangelico:client:notify", function(msg, time, type, sound)
    if Config.Notify == "esx" then
        ESX.ShowNotification(msg)
    elseif Config.Notify == "qbcore" then  -- Changed "else if" to "elseif"
        QBCore.Functions.Notify(msg, "error", 3000)  -- Changed "type" to "success" and added "time"
    elseif Config.Notify == "custom" then
        customFrameworkNotification()
    elseif Config.Notify == "qs" then 
        exports['qs-notify']:Alert(msg, TIME(3000), 'error')
    elseif Config.Notify == "okok" then
        exports['okokNotify']:Alert('', msg, 3000, 'error', true)
    else
        print("Notify script not supported!!! Check config.lua for any issues. Open a ticket if needed!")
    end
end)


function notProgbar2()
    buyerBlip = AddBlipForCoord(-931.2271, -2655.1760, 38.9658)
            SetBlipRoute(buyerBlip, true)
            SetBlipColour(buyerBlip, 5)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Translation["jewel_buyer"])
            EndTextCommandSetBlipName(buyerBlip)
            msg = Config.Translation["you_got_location_on_map"]
            TriggerEvent("pd_vangelico:client:notify", msg, time, type, sound)
            ClearArea(-931.2271, -2655.1760, 38.9658, 50.0, 0, false, false, 0)
            lib.requestModel('s_m_m_bouncer_01', 50)
            lib.requestModel('csb_thornton', 50)
            lib.requestModel('baller3', 50)
            ped1 = CreatePed(28, "csb_thornton", -932.8268, -2652.1943, 38.0890, 89.6030, true, false)
            ped2 = CreatePed(28, 's_m_m_bouncer_01', -934.3198, -2655.4143, 37.9904, 20.0330, true, false)
            TaskStartScenarioInPlace(ped1, "WORLD_HUMAN_AA_SMOKE", 0, 0)
            TaskStartScenarioInPlace(ped2, "WORLD_HUMAN_STAND_MOBILE", 0, 0)

            ballerVehicle = CreateVehicle("baller3", -931.2271, -2655.1760, 38.9658, 243.5883, true, false)

            SetBlockingOfNonTemporaryEvents(ped1, true)
	        SetPedDiesWhenInjured(ped1, false)
	        SetPedCanPlayAmbientAnims(ped1, true)
  	        SetPedCanRagdollFromPlayerImpact(ped1, false)
 	        SetEntityInvincible(ped1, true)
	        FreezeEntityPosition(ped1, true)

            SetBlockingOfNonTemporaryEvents(ped2, true)
	        SetPedDiesWhenInjured(ped2, false)
	        SetPedCanPlayAmbientAnims(ped2, true)
  	        SetPedCanRagdollFromPlayerImpact(ped2, false)
 	        SetEntityInvincible(ped2, true)
	        FreezeEntityPosition(ped2, true)
    
            SetEntityInvincible(ballerVehicle, true)
            SetVehicleTyresCanBurst(ballerVehicle, false)
            FreezeEntityPosition(ballerVehicle, false)
            SetVehicleDoorsLockedForAllPlayers(ballerVehicle, true)

            local options = {
                {
                    name = 'jewelry-buyer',
                    icon = 'fa-solid fa-road',
                    label = Config.Translation["sell_jewelry"],
                    distance = 1,
                    onSelect = function()
                        sellJewelry()
                    end,
                },
            }
            
            exports.ox_target:addLocalEntity(ped1, options)
        end

function sellJewelry()
   RemoveBlip(buyerBlip)
   ClearPedTasks(ped1)
   Wait(200)
   RequestAnimDict("mp_common")            
   while not HasAnimDictLoaded("mp_common") do
	   Wait(0)
   end
   TaskPlayAnim(ped1, "mp_common", "givetake2_a", 8.0, 4.0, -1, 48, 0, 0, 0, 0)
   TaskPlayAnim(PlayerPedId(), "mp_common", "givetake2_a", 8.0, 4.0, -1, 48, 0, 0, 0, 0)
   TriggerServerEvent("esx_p1ngu_vangelicoheist:server:sellItem")
   ClearPedTasks(ped2)
   FreezeEntityPosition(ped1, false)
   FreezeEntityPosition(ped2, false)
   TaskEnterVehicle(ped2, ballerVehicle, -1, 0, 1.0, 0)
   Wait(4000)
   TaskEnterVehicle(ped1, ballerVehicle, -1, -1, 1.0, 0)
   TaskVehicleDriveWander(ped1, ballerVehicle, 20.0, 1073742211)
   Wait(4000)
   SetEntityAsNoLongerNeeded(ballerVehicle)
   Wait(60000)
   DeleteEntity(ballerVehicle)
   DeleteEntity(ped1)
   DeleteEntity(ped2)
end

RegisterNetEvent('esx_p1ngu_vangelicoheist:client:updateLockpickCooldown')
AddEventHandler('esx_p1ngu_vangelicoheist:client:updateLockpickCooldown', function(isOnCooldown)
    lockpickV = isOnCooldown
end)

function lockpick()
    if lockpickV then
        ESX.ShowNotification(Config.Translation["door_already_open"])
        return
    end

    local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'e', 'e', 'e'})
    if success then
        hidePassword()
        local lockState = 0
        TriggerServerEvent('esx_p1ngu_vangelicoheist:server:openDoor', lockState)
        TriggerServerEvent('esx_p1ngu_vangelicoheist:server:lockpick')
    end
end

function minigame()
    if thermite then ESX.ShowNotification(Config.Translation["thermite_cooldown"]) return end
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, 0)
    TriggerServerEvent('esx_p1ngu_vangelicoheist:server:thermite')
    if not Config.useProgressbar then notProgbar() return end
    exports['progressbar']:Progress({
        name = "random_task",
        duration = 7000,
        label = Config.Translation["progbar_connecting"],
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,    
        },
     }, function(cancelled)
        if not cancelled then
            exports["memorygame"]:thermiteminigame(1, 3, 3, 10,
                function()
                ClearPedTasks(PlayerPedId())
                Wait(4000)
                termit()
                end,
                function()
                ClearPedTasks(PlayerPedId())
            end)
        else
            ClearPedTasks(PlayerPedId())
        end
    end)
  end

function notProgbar()
    Wait(7000)
        exports["memorygame"]:thermiteminigame(1, 3, 3, 10,
                function()
                ClearPedTasks(PlayerPedId())
                Wait(4000)
                termit()
                end,
                function()
                ClearPedTasks(PlayerPedId())
            end)
end

function termit()
    local ped = PlayerPedId()
        SetEntityHeading(ped, 298.3191)
        Wait(100)
        local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
        local bagscene = NetworkCreateSynchronisedScene(-596.0172, -283.7856, 50.4375, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
        local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), -596.0172, -283.7856, 50.4375, true, true, false)

        SetEntityCollision(bag, false, true)
        NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        NetworkStartSynchronisedScene(bagscene)
        Wait(1500)
        local x, y, z = table.unpack(GetEntityCoords(ped))
        local Thermite = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3, true, true, true)
        
        SetEntityCollision(Thermite, false, true)
        AttachEntityToEntity(Thermite, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
        Wait(2000)
        DeleteObject(bag)
        SetPedComponentVariation(ped, 5, 45, 0, 0)
        DetachEntity(Thermite, 1, 1)
        FreezeEntityPosition(Thermite, true)
        
        RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
        RequestModel("hei_p_m_bag_var22_arm_s")
        RequestNamedPtfxAsset("scr_ornate_heist")
        while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and
              not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
            Wait(50)
        end
        SetPtfxAssetNextCall("scr_ornate_heist")
        
        Wait(500)
        
        local particleX, particleY, particleZ = GetEntityCoords(Thermite)
        local particleName = "scr_heist_ornate_thermal_burn"
        local particleScale = 1.0
        local particleLooped = true
        local particleUsePlayerAsOrigin = false
        local particleRange = false
        local particleAxisX = 0.0
        local particleAxisY = 0.0
        local particleAxisZ = 0.0
        
        if HasNamedPtfxAssetLoaded("scr_ornate_heist") then
            UseParticleFxAssetNextCall("scr_ornate_heist")
            burn = StartParticleFxLoopedAtCoord(particleName, particleX, particleY, particleZ, particleAxisX, particleAxisY, particleAxisZ, particleScale, particleLooped, particleUsePlayerAsOrigin, particleRange)
        end
        
        NetworkStopSynchronisedScene(bagscene)
        Wait(100)
        ClearPedTasks(ped)
        Wait(10500)
        DetachEntity(Thermite, 0, 0)
        StopParticleFxLooped(burn, 0)
        Wait(400)
        DeleteEntity(Thermite)
        TriggerServerEvent("esx_pd_jewelTargets:server")
        ESX.ShowNotification(Config.Translation["doors_opened"])
        local lockState = 0
        TriggerServerEvent('esx_p1ngu_vangelicoheist:server:openDoors', lockState)
end

local currentJewelId = nil



    local jewelTargets = {}  -- Table to store the created jewel targets
RegisterNetEvent('esx_pd_jewelTargets', function ()
    for _, jewel in ipairs(Config) do
        if jewel.id then
            local jewelId = jewel.id

            local mTarget = exports.ox_target:addSphereZone({
                coords = jewel.objPos,
                radius = 0.7,
                debug = drawZones,
                options = {
                    {
                        name = 'jewelheist-juttujuttu',
                        icon = 'fa-solid fa-circle',
                        label = Config.Translation["smash_glass"],
                        onSelect = function()
                            currentJewelId = jewelId
                            TriggerServerEvent('esx_p1ngu_vangelicoheist:server:jewels', jewelId)
                        end,
                    }
                },
            })

            table.insert(jewelTargets, mTarget)  -- Store the target in the jewelTargets table
        end
    end
end)

    function removeAllJewelTargets()
        for _, target in ipairs(jewelTargets) do
            exports.ox_target:removeZone(target)  -- Remove each target from the zone
        end
        jewelTargets = {}  -- Clear the jewelTargets table
    end

local grabJewels = {
    {
       anim = "smash_case_e", 
       time  = 2600
    },
    {
        anim = "smash_case_f", 
        time  = 2400
     },
     {
        anim = "smash_case_d", 
        time  = 3000
     },
     {
        anim = "smash_case_c", 
        time  = 3000
     },
     {
        anim = "smash_case_b", 
        time  = 3000
     },
     {
        anim = "smash_case_tray_b", 
        time  = 3000
     },
     {
        anim = "smash_case_tray_a", 
        time  = 3000
     },
     {
        anim = "smash_case_necklace_skull", 
        time  = 3000
     },
     {
        anim = "smash_case_necklace", 
        time  = 3000
     },
}

local jewelCooldowns = {}

RegisterNetEvent('esx_p1ngu_vangelicoheist:client:updateCooldown')
AddEventHandler('esx_p1ngu_vangelicoheist:client:updateCooldown', function(jewelId, isOnCooldown)
    jewelCooldowns[jewelId] = isOnCooldown
end)

function IsJewelOnCooldown(jewelId)
    return jewelCooldowns[jewelId] or false
end

RegisterNetEvent('esx_p1ngu_vangelicoheist:client:jewels', function(jewelId)
    if IsJewelOnCooldown(jewelId) then
        ESX.ShowNotification(Config.Translation["already_broken"])
        return
    end

    local randomIndex = math.random(1, #grabJewels)
    local grabJewel = grabJewels[randomIndex]

    if not IsPedArmed(PlayerPedId(), 4) or GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_CROWBAR") then
        ESX.ShowNotification(Config.Translation["you_need_weapon"])
        return
    end

    TriggerServerEvent('esx_p1ngu_vangelicoheist:server:cabCooldown', jewelId)
    loadAnimDict("missheist_jewel")
    TaskPlayAnim(PlayerPedId(), "missheist_jewel", grabJewel.anim, 8.0, 1.0, -1, 2, 0, 0, 0, 0)
    TriggerServerEvent("esx_pd_glassbreaksync:server", jewelId)
     
    
    Wait(grabJewel.time)
    TriggerServerEvent("esx_p1ngu_vangelicoheist:server:addItem")
    ClearPedTasks(PlayerPedId())
    print("working")
    TriggerServerEvent("esx_pd_alarmrob:server")
end)

RegisterNetEvent('esx_pd_glassbreaksync:client', function (jewelId)
    PlaySoundFromCoord(-1, "Glass_Smash", Config[jewelId].objPos, 0, 0, 0)
    CreateModelSwap(Config[jewelId].objPos, 0.3, GetHashKey(Config[jewelId].oldModel), GetHashKey(Config[jewelId].newModel), 1)
end)

local blipppi = nil -- Define the blip variable outside the function

-- Function to remove the blip after a delay
local function RemoveBlipAfterDelay(blip)
    Citizen.Wait(120000) -- Wait for 5 seconds before removing the blip
    RemoveBlip(blip)
end

RegisterNetEvent('policealert', function ()
    StartAlarm("JEWEL_STORE_HEIST_ALARMS", 0)
    local policeAlertCooords = vector3(-633.0686, -239.4547, 38.0867)
    local job = ESX.GetPlayerData().job

    if job and job.name == Config.policeJob then
        local blip = AddBlipForCoord(policeAlertCooords.x, policeAlertCooords.y, policeAlertCooords.z)
        SetBlipSprite(blip, 225)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 2)
        SetBlipAsShortRange(blip, false)
        SetBlipScale(blip, 0.9)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Translation["alert_blip"])
        EndTextCommandSetBlipName(blip)
        alertMessage()

        -- Start a new thread to remove the blip after a delay
        Citizen.CreateThread(function()
            RemoveBlipAfterDelay(blip)
        end)

        Wait(120000) -- Wait 5 seconds before stopping the alarm
        StopAlarm("JEWEL_STORE_HEIST_ALARMS", true)
    end
end)

looted = 0
RegisterNetEvent('esx_pd_alarmrob', function ()
    looted = looted + 1
    if looted == 1 then
    TriggerServerEvent("esx_pd_alarmpolice:server")
    end
end)

CreateThread(function()

    local doorz = GlobalState.doorz
 
    if not doorz then 
        return
    end
 
    for k,v in pairs(doorz) do
        AddDoorToSystem(v.doorHash, v.modelHash, v.coordinates)
        DoorSystemSetDoorState(v.doorHash, v.Locked)
     end
 end)

RegisterNetEvent('nipa-doors:openDoors', function(doorName, doorName2, lockState)
    DoorSystemSetDoorState(Config.Doors[doorName].doorHash, lockState)
    DoorSystemSetDoorState(Config.Doors[doorName2].doorHash, lockState)
end)

RegisterNetEvent('nipa-doors:openDoor', function(doorName, lockState)
    DoorSystemSetDoorState(Config.Doors[doorName].doorHash, lockState)
end)

function loadAnimDict(dict)  
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(0)
    end
end 

RegisterNetEvent('esx_p1ngu_vangelicoheist:client:updateThermiteStatus', function(update)
    thermite = update
end)

RegisterNetEvent('esx_p1ngu_vangelicoheist:client:resetHeist', function()
    if DoesEntityExist(ballerVehicle) then
    DeleteEntity(ballerVehicle)
    end
    if DoesEntityExist(ped1) then
    DeleteEntity(ped1)
    end
    if DoesEntityExist(ped2) then
    DeleteEntity(ped2)
    end
    RemoveBlip(buyerBlip)
    exports.ox_target:removeZone(mTarget)
    exports.ox_target:removeZone(passwordHide)
    passwordHide = true 
    mTarget = true 
    canUseJewelComputer = false
    removeAllJewelTargets()
    CreateModelSwap(Config[currentJewelId].objPos, 0.3, GetHashKey(Config[currentJewelId].newModel), GetHashKey(Config[currentJewelId].oldModel), 1)
    ClearAreaOfObjects(-630.426514, -238.437546, 38.206532, 300.0, 0)
end)