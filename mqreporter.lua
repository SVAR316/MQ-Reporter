script_name("MQ Reporter")
script_author("zloymolodoy")
script_version("0.0")

local sampev = require 'lib.samp.events'
local encoding = require 'encoding'

--Кодировка
encoding.default = 'cp1251'
u8 = encoding.UTF8

local active = false
local sendMessage = true

function main()
    repeat wait(0) until isSampAvailable()
    --..thisScript().script_version
    sampAddChatMessage("{2078be}[MQ]{FFFFFF}Скрипт MQ reporter запущен. /mq активация скрипта. Версия:", -1)

    sampRegisterChatCommand("mq", function()
        if active == false then
            sampAddChatMessage("{2078be}MQ Включен")
            active = true
        else
            sampAddChatMessage("{2078be}MQ Выключен")
            active = false
        end
    end)

    function sendReportMessage()
        sampSendChat("/report mq")

    end

    function sampev.onSendSpawn()
        sendMessage = true
    end
    --4480
    --4482

    function sampev.onShowDialog(id, style, title, btn1, btn2, text)
        if active and not sendMessage and id == 4480  then
            sampSendDialogResponse(id, 0, -1, -1)
        end
        if active and not sendMessage and id == 4482 then
            sampSendDialogResponse(id, 1, -1, -1)
        end
    end

    while true do wait(0)
        if active and sendMessage then
            if getCharHealth(PLAYER_PED) <= 0 then
                sendReportMessage()
                sendMessage = false
            end
        end
        if isKeyJustPressed(87) then
            sendReportMessage()
        end
        end
    end