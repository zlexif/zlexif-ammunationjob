fx_version 'cerulean'
author '# Ahmad'
Description 'An Ammunation job script made by # Ahmad.'
game 'gta5'
lua54 'yes'

shared_scripts { 
    "config/**.lua",
    '@ox_lib/init.lua',

}

server_script { 
    "@oxmysql/lib/MySQL.lua",
    "server/**.lua",
}

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    "client/**.lua",
}

dependencies {
    'qb-core',
    'PolyZone'
}
