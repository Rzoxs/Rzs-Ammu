ESX = nil
RZS = {
    AmmuMenu = false,
    SelectedCategories = nil,
    Basket = {},
    Quantite = {},
    PPA = false,
    List = {
        Index = 1,
        List = {"Liquide", "Banque"},
    }
}

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
                                RageUI.Button(a[2], nil, {RightLabel = "→→→"}, CheckPPACategorie(a[3], RZS.PPA), {
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
                                        if b.type == "item" then
                                            RageUI.List(b.label, {"1x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "2x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "3x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "4x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "5x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "6x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "7x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "8x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "9x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~", "10x | ~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money.."~s~" }, RZS.Quantite[b.name], nil, {}, true, {
                                                onListChange = function(Index, Item)
                                                    RZS.Quantite[b.name] = Index
                                                end,
                                                onSelected = function(Index, Item)
                                                    if Contains(RZS.Basket, b.name) then
                                                        ESX.ShowNotification("~r~Vous avez déjà cet objet dans votre panier")
                                                    else
                                                        table.insert(RZS.Basket, {name = b.name, label = b.label, price = b.price*RZS.Quantite[b.name], type = b.type, qty = RZS.Quantite[b.name]})
                                                        ESX.ShowNotification("Vous avez ajouté un objet à votre panier")
                                                    end
                                                end,
                                            })
                                        else
                                            RageUI.Button(b.label, "Ceci est une arme !", {RightLabel = "~g~"..ESX.Math.GroupDigits(b.price).." "..ConfigAmmu.money}, true, {
                                                onSelected = function()
                                                    if Contains(RZS.Basket, b.name) then
                                                        ESX.ShowNotification("~r~Vous avez déjà cet objet dans votre panier")
                                                    else
                                                        table.insert(RZS.Basket, {name = b.name, label = b.label, price = b.price*RZS.Quantite[b.name], type = b.type, qty = RZS.Quantite[b.name]})
                                                        ESX.ShowNotification("Vous avez ajouté un objet à votre panier")
                                                    end
                                                end
                                            })
                                        end
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
                            RageUI.Button(v.label, "~r~~h~ENTER~h~~r~ pour retirer l'article", {RightLabel = "~g~"..ESX.Math.GroupDigits(v.price).." "..ConfigAmmu.money.."~s~ | Quantité : ~g~"..v.qty}, true, {
                                onSelected = function()
                                    table.remove(RZS.Basket, _)
                                end
                            })
                        end
                        RageUI.line()
                        RageUI.List("Acheter | Total : ~g~"..ESX.Math.GroupDigits(Total()).." "..ConfigAmmu.money, RZS.List.List, RZS.List.Index, "Choisissez votre moyen de paiement", {}, true, {
                            onListChange = function(Index, Item)
                                RZS.List.Index = Index
                            end,

                            onSelected = function()
                                ESX.TriggerServerCallback('rzs_ammu:buy', function(response)
                                    if response then
                                        RZS.Basket = {}
                                    end
                                end, RZS.Basket, _, RZS.List.List[RZS.List.Index])
                            end
                        })
                    end
                end)
            end
        end)
    end
end

CreateThread(function()
    if string.gsub(GetResourceMetadata("es_extended", 'version'), " ", "") > "1.9.0" then
        ESX = exports['es_extended']:getSharedObject()
    else
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end

    while ESX == nil do Wait(100) end

    for _,v in pairs(ConfigAmmu.CategoriesComponents.shop) do
        for z,c in pairs(v.content) do
            for a,b in pairs(v.content[z]) do
                RZS.Quantite[b.name] = 1
            end
        end
    end

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
                        ESX.TriggerServerCallback("esx_license:checkLicense", function(cb) 
                            RZS.PPA = cb
                        end, GetPlayerServerId(PlayerId()), "weapon")
                    end
                end
            end
        end
        Wait(Sleep)
    end
end)
