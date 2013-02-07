
function createSecondScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    
    -- CCLabel
    local mylabel = CCLabelTTF:create("Second Scene", "Sans", 28)
    mylabel:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)

    -- Back button
    local function onGoMainScene()
        replaceScene(1)
    end
    
    local menuPopupItem = CCMenuItemImage:create("menu1.png", "menu1.png")
    menuPopupItem:registerScriptTapHandler(onGoMainScene)
    local menuPopup = CCMenu:createWithItem(menuPopupItem)
    menuPopup:setPosition(30, visibleSize.height - 30)
    
    local scene = CCScene:create()
    scene:addChild(mylabel)
    scene:addChild(menuPopup)
    
    return scene
end


--[[
--
-- the following code is about onEnter/onExit,but it's not work, The eventType always is nil;
-- reference: http://www.cocos2d-x.org/projects/cocos2d-x/wiki/New_Lua_Engine_Documents
--
local function createScene()
    local scene = CCScene:create()
    local function sceneEventHandler(eventType)
        print("kCCNodeOnEnter:",kCCNodeOnEnter)
        print("evnetType:",evnetType)
        if eventType == kCCNodeOnEnter then
            if scene.onEnter then scene:onEnter() end
            elseif evetType == kCCNodeOnExit then
            if scene.onExit then scene:onExit() end
        end
        
    end
    scene:registerScriptHandler(sceneEventHandler)
    return scene
end

local scene = createScene()
function scene:onEnter()
    print("on scene enter")
end
function scene:onExit()
    print("on scene exit")
end

CCDirector:sharedDirector():runWithScene(scene)

--]]