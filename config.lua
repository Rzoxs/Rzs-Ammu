ConfigAmmu = {
    Coords = {
        { pos = vector3(21.5255, -1107.0317, 29.7970), blips = true, id = 1},
        { pos = vector3(17.8706, -1104.9207, 29.7970), blips = false, id = 2},

    },
    Ammo = 250,
    money = "$",

    CategoriesComponents = {
        shop = {
            {
                id = 1,
                Categories = {
                    {"weapons", "Armes"},
                    {"ammunitions", "Munitions"},
                    {"items", "Objets"},
                },
                content = {
                    ["weapons"] = {
                        {type = "weapon", name = "WEAPON_PISTOL", label = "Pistolet", price = 200, qty = 1},
                        {type = "weapon", name = "WEAPON_PISTOL_MK2", label = "Pistolet MK2", price = 500, qty = 1},
                        {type = "weapon", name = "WEAPON_APPISTOL", label = "Pistolet AP", price = 200, qty = 1},
                        {type = "weapon", name = "WEAPON_APPISTOL_MK2", label = "Pistolet AP MK2", price = 300, qty = 1},
                        {type = "weapon", name = "WEAPON_COMBATPISTOL", label = "Pistolet de combat", price = 700, qty = 1},
                        {type = "weapon", name = "WEAPON_COMBATPISTOL_MK2", label = "Pistolet de combat MK2", price = 900, qty = 1},
                        {type = "weapon", name = "WEAPON_REVOLVER", label = "Revolver", price = 1, qty = 1},
                        {type = "weapon", name = "WEAPON_REVOLVER_MK2", label = "Revolver MK2", price = 5, qty = 1},
                        {type = "weapon", name = "WEAPON_DAGGER", label = "Dague", price = 80, qty = 1},
                        {type = "weapon", name = "WEAPON_HAMMER", label = "Hammer", price = 120, qty = 1},
                        {type = "weapon", name = "WEAPON_HATCHET", label = "Hache", price = 70, qty = 1},
                        {type = "weapon", name = "WEAPON_MACHETE", label = "Machete", price = 15, qty = 1},
                        {type = "weapon", name = "WEAPON_FLASHLIGHT", label = "Lampe torche", price = 60, qty = 1},
                        {type = "weapon", name = "WEAPON_NIGHTSTICK", label = "Couteau", price = 820, qty = 1},
                        {type = "weapon", name = "WEAPON_STUNGUN", label = "Tazer", price = 529, qty = 1},
                        {type = "weapon", name = "WEAPON_PISTOL50", label = "Pistolet .50", price = 254, qty = 1},
                        {type = "weapon", name = "WEAPON_SNSPISTOL", label = "Pistolet SNS", price = 394, qty = 1},
                        {type = "weapon", name = "WEAPON_SNSPISTOL_MK2", label = "Pistolet SNS MK2", price = 358, qty = 1},
                        {type = "weapon", name = "WEAPON_HEAVYPISTOL", label = "Pistolet lourd", price = 741, qty = 1},
                        {type = "weapon", name = "WEAPON_VINTAGEPISTOL", label = "Pistolet vintage", price = 250, qty = 1},
                        {type = "weapon", name = "WEAPON_MARKSMANPISTOL", label = "Pistolet marksman", price = 345, qty = 1},
                    },
                    ["ammunations"] = {
                    },
                    ["items"] = {
                        {type = "item", name = "radio", label = "Radio", price = 1200, qty = 1},
                        {type = "item", name = "bread", label = "Pain", price = 50, qty = 10},
                    }
                }
            },

            {
                id = 2,
                Categories = {
                    {"weapons", "Armes"},
                    {"items", "Objets"},
                },
                content = {
                    ["weapons"] = {
                        {type = "weapon", name = "WEAPON_PISTOL", label = "Pistolet", price = 200, qty = 1},
                        {type = "weapon", name = "WEAPON_PISTOL_MK2", label = "Pistolet MK2", price = 500, qty = 1},
                    },
                    ["items"] = {
                        {type = "item", name = "tel", label = "Téléphone", price = 1200, qty = 5},
                    }
                }
            }
        }
    },
}