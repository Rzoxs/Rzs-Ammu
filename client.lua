local ESX = nil
local RZS = {
    AmmuMenu = false,
    Menu = {},
    SelectedCategories = nil,
    Basket = {},
    Total = {},
}

CreateThread(function() 
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    while ESX == nil do Wait(100) end

    for _,v in pairs(ConfigAmmu.Coords) do
        if v.blips then
            local blip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)

            SetBlipSprite(blip, 110)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.6)
            SetBlipColour(blip, 81)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString("Ammunation")
            EndTextCommandSetBlipName(blip)
        end
    end
end)

local AmmuMenuR = RageUI.CreateMenu("Ammunation","Ammunation of Los Santos")
local AmmuMenuCategories = RageUI.CreateSubMenu(AmmuMenuR,"Ammunation","Ammunation of Los Santos")
local BasketMenu = RageUI.CreateSubMenu(AmmuMenuR,"Ammunation","Ammunation of Los Santos")
AmmuMenuR.Closed = function()
    RZS.AmmuMenu = false
end

function AmmunationMenu(idAmmu)
    if RZS.AmmuMenu then
        AmmuMenu = false
    else
        RZS.AmmuMenu = true
        RageUI.Visible(AmmuMenuR, true)
        Citizen.CreateThread(function()
            while RZS.AmmuMenu do
                Wait(1)
                RageUI.IsVisible(AmmuMenuR, function()
                    for _,v in pairs(ConfigAmmu.CategoriesComponents.shop) do
                        if v.id == idAmmu then
                            for k,a in pairs(v.Categories) do
                                RageUI.Button(a[2], nil, {RightLabel = "→→→"}, true, {
                                    onSelected = function()
                                        RZS.SelectedCategories = a[1]
                                    end
                                }, AmmuMenuCategories)
                            end
                        end
                    end
                    RageUI.line()
                    RageUI.Button("Paniers", nil, {RightLabel = "→→→"}, true, {
                        onSelected = function()
                            RZS.SelectedCategories = "paniers"
                        end
                    }, BasketMenu)
                end)

                RageUI.IsVisible(AmmuMenuCategories, function()
                    for _,v in pairs(ConfigAmmu.CategoriesComponents.shop) do
                        if idAmmu == v.id then
                            for z,c in pairs(v.content) do
                                if RZS.SelectedCategories == z then
                                    for a,b in pairs(v.content[z]) do
                                        RageUI.Button(b.label, "Quantité : ~g~"..b.qty, {RightLabel = "~g~"..b.price.." "..ConfigAmmu.money}, true, {
                                            onSelected = function()
                                                if Contains(RZS.Basket, b.name) then
                                                    ESX.ShowNotification("~r~Vous avez déjà cet objet dans votre panier")
                                                else
                                                    table.insert(RZS.Basket, {name = b.name, label = b.label, price = b.price, type = b.type, qty = b.qty})
                                                    ESX.ShowNotification("Vous avez ajouté un objet à votre panier")
                                                end
                                            end
                                        })
                                    end
                                end
                            end
                        end
                    end
                end)

                RageUI.IsVisible(BasketMenu, function()
                    if #RZS.Basket == 0 then
                        RageUI.Separator('')
                        RageUI.Separator('~r~Votre panier est vide !')
                        RageUI.Separator('')
                        RZS.Basket = {}
                    else
                        for _,v in pairs(RZS.Basket) do
                            RZS.Total = 
                            RageUI.Button(v.label, "~r~~h~ENTER~h~~r~ pour retirer l'article", {RightLabel = "~g~"..v.price.." "..ConfigAmmu.money.."~s~ | Quantité : ~g~"..v.qty}, true, {
                                onSelected = function()
                                    table.remove(RZS.Basket, _)
                                end
                            })
                        end
                        RageUI.line()
                        RageUI.Button("Achetez", nil, {RightLabel = "Total : ~g~"..Total().." "..ConfigAmmu.money.."~w~→"}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('rzs_ammu:buy', function(response)
                                    if response then
                                        RZS.Basket = {}
                                    end
                                end, Total(), RZS.Basket)
                            end
                        })
                    end
                end)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        Sleep = 1500
        for _,v in pairs(ConfigAmmu.Coords) do
            dist = #(GetEntityCoords(PlayerPedId()) - v.pos)
            if dist < 7.0 then
                Sleep = 0
                DrawMaker(v.pos)
                if dist < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir l'Ammunation")
                    if IsControlJustPressed(0, 38) then
                        AmmunationMenu(v.id)
                    end
                end
            end
        end
        Wait(Sleep)
    end
end)

RegisterCommand("ammu", function(source, args, raw)
    AmmunationMenu()
end)

Total = function()
    local total = 0
    for _,v in pairs(RZS.Basket) do
        total = total + (v.price)
    end
    return total
end

Contains = function(table, element)
    for _, value in pairs(table) do
        if value.name == element then
            return true
        end
    end
    return false
end

DrawMaker = function(coords)
    DrawMarker(6, coords.x, coords.y, coords.z-0.97, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 255, 255, 150, false, false, 2,  false, nil, false)
    DrawMarker(1, coords.x, coords.y, coords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 255, 255, 255, 150, false, false, 2,  false, nil, false)
end