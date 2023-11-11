fx_version 'adamant'
games { 'gta5' }
author 'P1ngu Scripts'

lua54 'on'

client_scripts {
    "client.lua"
} 

server_scripts {
    "server.lua"
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
    "@es_extended/imports.lua"
}