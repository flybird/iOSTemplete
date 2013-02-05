-- avoid memory leak
collectgarbage("setpause", 100)
collectgarbage("setstepmul", 5000)

require "MainScene"
require "FirstScene"
require "SecondScene"

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end
----------------------------------------------------------------

local scene = CCScene:create()
scene:addChild(CreateMainScene())
CCDirector:sharedDirector():runWithScene(scene)