-- avoid memory leak
collectgarbage("setpause", 100)
collectgarbage("setstepmul", 5000)

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

require "MainScene"
require "FirstScene"
require "SecondScene"
----------------------------------------------------------------

local mainScene = CCScene:create();
--mainScene:addChild(createMainScene());
mainScene:addChild(createFirstScene());
CCDirector:sharedDirector():runWithScene(mainScene)

function replaceScene(index)
    local scene = nil;
    if index == 1 then
        scene = createMainScene()
    elseif index == 2 then
        scene = createFirstScene()
    else
        scene = createSecondScene()
    end
                                   
    local trans = CCTransitionFade:create(.3,scene)
    CCDirector:sharedDirector():replaceScene(trans)
end