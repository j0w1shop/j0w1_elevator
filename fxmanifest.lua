fx_version 'adamant'
lua54 'yes'
game 'gta5'

author 'j0w1xR | XR'
description 'Script de Ascensor para FiveM usando ox_target'
version '1.0.0'

client_scripts {
    'config.lua',
    'client/client.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/logo.png',
    'ui/script.js'
}

dependencies {
    'ox_target'
}
