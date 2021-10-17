local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("gasmask", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("qb-gasmask:client:updateMask", src)
    end
end)
