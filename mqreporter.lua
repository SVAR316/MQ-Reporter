script_name("MQ Reporter")
script_author("zloymolodoy")
script_version("0.0.1")

local sampev   = require 'lib.samp.events'
local encoding = require 'encoding'

encoding.default = 'cp1251'
u8 = encoding.UTF8