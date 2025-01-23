fx_version 'cerulean'
game 'gta5'

description 'Farming System'

author 'NxCqU'
version '1.0.0'

server_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'Config.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'Config.lua',
    'client/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependencies {
    'es_extended'
}
