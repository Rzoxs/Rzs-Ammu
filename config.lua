ConfigAmmu = {

    Coords = {
        { pos = vector3(21.5255, -1107.0317, 29.7970), blips = true, id = 1}, -- Position de l'ammunation id 1
        { pos = vector3(17.8706, -1104.9207, 29.7970), blips = false, id = 2}, -- Position de l'ammunation id 2
        -- { pos = vector3(x, y, z), blips = true, id = id_shop}, -- Position de l'ammunation id 3
    },

    MaxAmmo = 250, -- Quantité maximum de munitions
    money = "$", -- Devise

    CategoriesComponents = {
        -- Liste des ammunations
        shop = {
            {
                id = 1, -- Id de l'ammunation
                Categories = {
                    -- {id, label, ppa}
                    {"weapons", "Armes", true},
                    {"ammunitions", "Munitions", false},
                    {"items", "Objets", false},
                },
                content = {
                    ["weapons"] = {
                        -- {type, name, label, prix}
                        {type = "weapon", name = "WEAPON_PISTOL", label = "Pistolet", price = 200},
                        {type = "weapon", name = "WEAPON_PISTOL_MK2", label = "Pistolet MK2", price = 500},
                        {type = "weapon", name = "WEAPON_APPISTOL", label = "Pistolet AP", price = 200},
                        {type = "weapon", name = "WEAPON_APPISTOL_MK2", label = "Pistolet AP MK2", price = 300},
                        {type = "weapon", name = "WEAPON_COMBATPISTOL", label = "Pistolet de combat", price = 700},
                        {type = "weapon", name = "WEAPON_COMBATPISTOL_MK2", label = "Pistolet de combat MK2", price = 900},
                        {type = "weapon", name = "WEAPON_REVOLVER", label = "Revolver", price = 1},
                        {type = "weapon", name = "WEAPON_REVOLVER_MK2", label = "Revolver MK2", price = 5},
                        {type = "weapon", name = "WEAPON_DAGGER", label = "Dague", price = 80},
                        {type = "weapon", name = "WEAPON_HAMMER", label = "Hammer", price = 120},
                        {type = "weapon", name = "WEAPON_HATCHET", label = "Hache", price = 70},
                        {type = "weapon", name = "WEAPON_MACHETE", label = "Machete", price = 15},
                        {type = "weapon", name = "WEAPON_FLASHLIGHT", label = "Lampe torche", price = 60},
                        {type = "weapon", name = "WEAPON_NIGHTSTICK", label = "Couteau", price = 820},
                        {type = "weapon", name = "WEAPON_STUNGUN", label = "Tazer", price = 529},
                        {type = "weapon", name = "WEAPON_PISTOL50", label = "Pistolet .50", price = 254},
                        {type = "weapon", name = "WEAPON_SNSPISTOL", label = "Pistolet SNS", price = 394},
                        {type = "weapon", name = "WEAPON_SNSPISTOL_MK2", label = "Pistolet SNS MK2", price = 358},
                        {type = "weapon", name = "WEAPON_HEAVYPISTOL", label = "Pistolet lourd", price = 741},
                        {type = "weapon", name = "WEAPON_VINTAGEPISTOL", label = "Pistolet vintage", price = 250},
                        {type = "weapon", name = "WEAPON_MARKSMANPISTOL", label = "Pistolet marksman", price = 345},
                    },
                    ["ammunations"] = {
                    },
                    ["items"] = {
                        {type = "item", name = "radio", label = "Radio", price = 1200},
                        {type = "item", name = "bread", label = "Pain", price = 500},
                    }
                }
            },

            {
                id = 2,
                Categories = {
                    {"weapons", "Armes", true},
                    {"items", "Objets", false},
                },
                content = {
                    ["weapons"] = {
                        {type = "weapon", name = "WEAPON_PISTOL", label = "Pistolet", price = 200},
                        {type = "weapon", name = "WEAPON_PISTOL_MK2", label = "Pistolet MK2", price = 500},
                    },
                    ["items"] = {
                        {type = "item", name = "tel", label = "Téléphone", price = 1200},
                    }
                }
            }
        }
    },
}
