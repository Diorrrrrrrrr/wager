fx_version 'cerulean'

author 'smilez'
game 'gta5'

ui_page 'html/index.html'

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    'config.lua'
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css'
}
