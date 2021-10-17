local QBCore = exports['qb-core']:GetCoreObject()
gasMaskOn = false
wearingMask = false
playerped = PlayerPedId()

PlayEmote = function()
    RequestAnimDict('mp_masks@standard_car@ds@')
    TaskPlayAnim(playerped, 'mp_masks@standard_car@ds@', 'put_on_mask', 8.0, 8.0, 800, 16, 0, false, false, false)
end 

RegisterNetEvent('qb-gasmask:client:updateMask', function()
    if not gasMaskOn then
        gasMaskOn = true
        SetEntityProofs(playerped, false, false, false, false, false, false, true, true, false)
        PlayEmote()              
        SetPedComponentVariation(PlayerPedId(), 1, Config.mask, 0, 1)
        QBCore.Functions.Notify({text = 'Gas Mask Put on', caption = "You've put on your gas mask"})
    else
        gasMaskOn = false
        SetEntityProofs(playerped, false, false, false, false, false, false, false, false, false)
        PlayEmote()
        SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 1)
        QBCore.Functions.Notify({text = 'Gas Mask Removed', caption = "You've removed your gas mask"})

    end
end)

-- WEARING MASK 

CreateThread(function()
    while true do 
        Wait(1)
        if Config.mask == GetPedDrawableVariation(PlayerPedId(), 1) then 
            wearingMask = true 
        else
            wearingMask = false 
        end

        if wearingMask then 
            gasMaskOn = true 
            SetEntityProofs(playerped, false, false, false, false, false, false, true, true, false)
        elseif not wearingMask then 
            gasMaskOn = false 
            SetEntityProofs(playerped, false, false, false, false, false, false, false, false, false) 
        end
    end
end)

