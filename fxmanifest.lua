fx_version 'cerulean'
games { 'gta5' };

shared_script "config.lua"

client_scripts {
    -- RageUI
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

    "cl_*.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "sv_*.lua",
}

dependencies {
    "es_extended"
}
