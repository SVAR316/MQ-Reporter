script_name("MQ Reporter")
script_author("zloymolodoy")
script_version("0.0.2")

local sampev = require 'lib.samp.events'
local encoding = require 'encoding'

--���������
encoding.default = 'cp1251'
u8 = encoding.UTF8

local active = false
local sendMessage = true

function main()
    repeat wait(0) until isSampAvailable()
    --..thisScript().script_version
    sampAddChatMessage("{2078be}[MQ]{FFFFFF}������ MQ reporter �������. /mq ��������� �������. ������:", -1)

    sampRegisterChatCommand("mq", function()
        if active == false then
            sampAddChatMessage("{2078be}MQ �������")
            active = true
        else
            sampAddChatMessage("{2078be}MQ ��������")
            active = false
        end
    end)

    function sendReportMessage()
        sampSendChat("/report mq")
    end

    function sampev.onSendSpawn()
        sendMessage = true
    end

    while true do wait(0)
        if active == true and sendMessage == true then
            if getCharHealth(PLAYER_PED) <= 0 then
                sendMessage = false
                sendReportMessage()
            end
        end
    end

end