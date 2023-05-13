ESX = nil
ESXV = false

if string.gsub(GetResourceMetadata("es_extended", 'version'), " ", "") > "1.9.0" then
    ESXV = true
    ESX = exports['es_extended']:getSharedObject()
else
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

ESX.RegisterServerCallback('rzs_ammu:buy', function(source, cb, a, b, c)
    local xPlayer = ESX.GetPlayerFromId(source)
    local total = Total(a)

    if b ~= nil or a ~= nil then
        if xPlayer.getMoney() >= total and c == "Liquide" or ESXV and xPlayer.getAccount('bank').money >= total and c == "Banque" or ESXV == false and xPlayer.getBank() >= total and c == "Banque" then
            if c == "Liquide" then
                xPlayer.removeMoney(total)
            elseif c == "Banque" then
                if ESXV then
                    xPlayer.removeAccountMoney('bank', total)
                else
                    xPlayer.removeBank(total)
                end
            end

            for _,v in pairs(a) do
                if v.type == "weapon" then
                    xPlayer.addWeapon(v.name, ConfigAmmu.MaxAmmo)
                elseif v.type == "item" then
                    xPlayer.addInventoryItem(v.name, v.qty)
                end
            end
            TriggerClientEvent("esx:showNotification", source, "Vous avez acheté toutes ce qui est dans votre panier pour ~g~"..ESX.Math.GroupDigits(total).." "..ConfigAmmu.money)
            cb(true)
        else
            TriggerClientEvent("esx:showNotification", source, "~r~Il vous manque de l'argent pour acheter tout ce qui est dans votre panier !")
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
