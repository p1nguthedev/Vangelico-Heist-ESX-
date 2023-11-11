fx_version 'adamant'
games { 'gta5' }
author 'P1ngu Scripts'

lua54 'on'

client_scripts {
    "cl_main/*.lua"
} 

server_scripts {
    "sv_main/*.lua"
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
    "@es_extended/imports.lua"
}

escrow_ignore {
    'sv_main/*.lua',
    'config.lua',
    'cl_main/*.lua'
}
dependency '/assetpacks'