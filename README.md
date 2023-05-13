

# ConfigAmmu Documentation

The `ConfigAmmu` table is used to configure ammunition shops in a video game. It contains the following fields:

## Coords
An array of tables, each containing the following fields:
- `pos` - The location of the ammunition shop as a vector3.
- `blips` - A boolean indicating whether to show a blip on the map for the ammunition shop.
- `id` - A unique identifier for the ammunition shop.

Example:
```lua
Coords = {
    { pos = vector3(21.5255, -1107.0317, 29.7970), blips = true, id = 1}, -- Position de l'ammunation id 1
    { pos = vector3(17.8706, -1104.9207, 29.7970), blips = false, id = 2}, -- Position de l'ammunation id 2
    -- { pos = vector3(x, y, z), blips = true, id = id_shop}, -- Position de l'ammunation id 3
}
```

## MaxAmmo
An integer representing the maximum amount of ammunition a player can carry.

Example:
```lua
MaxAmmo = 250
```

## money
A string representing the currency symbol used in the shop.

Example:
```lua
money = "$"
```

## CategoriesComponents
An array of tables, each representing an ammunition shop and containing the following fields:
- `id` - A unique identifier for the ammunition shop.
- `Categories` - An array of tables, each representing a category of items in the shop and containing the following fields:
  - `id` - A unique identifier for the category.
  - `label` - The label to be displayed for the category.
  - `ppa` - A boolean indicating whether to display the category by default.
- `content` - A table representing the items in the shop, with the keys being the categories and the values being an array of tables, each representing an item and containing the following fields:
  - `type` - The type of item (e.g., weapon, item).
  - `name` - The name of the item as defined in the game files.
  - `label` - The label to be displayed for the item.
  - `price` - The price of the item.

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
