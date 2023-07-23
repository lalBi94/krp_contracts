fx_version 'adamant'
game 'gta5'

author "General Zod | Discord: bilaaaaaaaaaal"
description "Contrat script for Metropolis"

ui_page {
    "ui/main.html"
}

files {
    "ui/assets/discord_logo.png",
    "ui/assets/exit_logo.png",
    "ui/assets/pen_logo.gif",
    "ui/main.html",
    "ui/main.js",
    "ui/main.css"
}

client_scripts {
    "locales/locales.lua",
    "client/cl_uiFn.lua",
    "client/cl_main.lua",
    "AddOn/KRPContracts/KRPContracts.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "AddOn/KRPContracts/locales/locales.lua",
    "AddOn/KRPContracts/SKRPContracts.lua"
}

shared_scripts {
    "@ZODWorks/shared/ZODWorks.lua"
}