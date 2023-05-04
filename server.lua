local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('rzs_ammu:buy', function(source, cb, a, b)
    local xPlayer = ESX.GetPlayerFromId(source)
    local total = Total(a)
    if b ~= nil or  then
        if xPlayer.getMoney() >= total then
            xPlayer.removeMoney(total)
            for _,v in pairs(a) do
                if v.type == "weapon" then
                    xPlayer.addWeapon(v.name, ConfigAmmu.Ammo)
                elseif v.type == "item" then
                    xPlayer.addInventoryItem(v.name, v.qty)
                end
            end
            TriggerClientEvent("esx:showNotification", source, "Vous avez acheté toutes ce qui est dans votre panier pour ~g~"..total.." "..ConfigAmmu.money)
            cb(true)
        else
            TriggerClientEvent("esx:showNotification", source, "~r~Il vous manque de l'argent pour acheter tout ce qui est dans votre panier "..total-xPlayer.getMoney().." "..ConfigAmmu.money)
            cb(false)
        end
    end
end)

Total = function(val)
    local total = 0
    for _,v in pairs(val) do
        total = total + (v.price)
    end
    return total
end
