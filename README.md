# Configuration Ammunation Documentation

La configuration est définie dans le fichier `config.lua`. Voici une description des différentes options :

## Coords
Tableau des coordonnées des magasins d'armes. Chaque magasin est défini par un objet avec les propriétés suivantes :
- `pos` : la position du magasin sous forme de vecteur.
- `blips` : booléen indiquant si un blip doit être affiché sur la carte pour ce magasin.
- `id` : un identifiant unique pour chaque magasin.

Example:
```lua
Coords = {
    { pos = vector3(21.5255, -1107.0317, 29.7970), blips = true, id = 1}, -- Position de l'ammunation id 1
    { pos = vector3(17.8706, -1104.9207, 29.7970), blips = false, id = 2}, -- Position de l'ammunation id 2
    -- { pos = vector3(x, y, z), blips = true, id = id_shop}, -- Position de l'ammunation id 3
}
```

## MaxAmmo
La quantité maximum de munitions qu'un joueur peut acheter pour chaque arme.

Example:
```lua
MaxAmmo = 250
```

## money
La devise utilisée pour afficher les prix.

Example:
```lua
money = "$"
```

## CategoriesComponents
Tableau des différentes catégories d'armes et de munitions disponibles dans chaque magasin. Chaque magasin est défini par un objet avec les propriétés suivantes :
- `id` : l'identifiant unique du magasin auquel cette configuration s'applique.
- `Categories` : un tableau des différentes catégories d'armes et de munitions disponibles. Chaque catégorie est définie par un tableau contenant les éléments suivants :
  - `id` : l'identifiant unique de la catégorie.
  - `label` : le libellé de la catégorie.
  - `ppa` : booléen indiquant si la catégorie doit être visible dans le menu d'achat.
- `content` : un tableau contenant les différents éléments disponibles dans chaque catégorie. Chaque élément est défini par un tableau contenant les propriétés suivantes :
  - `type` : le type d'élément (weapon ou item).
  - `name` : le nom de l'élément.
  - `label` : le libellé de l'élément.
  - `price` : le prix de l'élément.

Example:
```lua
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
                    -- {type, name, label, prix, quantité}
                    {type = "weapon", name = "WEAPON_PISTOL", label = "Pistolet", price = 200},
                    {type = "weapon", name = "WEAPON_PISTOL_MK2", label = "Pistolet MK2", price = 500},
                    {type = "weapon", name = "WEAPON_APPISTOL", label = "Pistolet AP", price = 200},
                    {type = "weapon", name = "WEAPON_APPISTOL_MK2", label = "Pistolet AP MK2", price = 300},
                    {type = "weapon", name = "WEAPON_COMBATPISTOL", label = "Pistolet de combat", price
