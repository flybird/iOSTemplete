require "MainScene"

function createFirstScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    
    -- CCLabel
    local mylabel = CCLabelTTF:create("First Scene", "Sans", 28)
    mylabel:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)

    -- Back button
    local function onGoMainScene()
        scene = CCScene:create()
        scene:addChild(CreateMainScene())
        CCDirector:sharedDirector():replaceScene(scene)
    end
      
    local menuPopupItem = CCMenuItemImage:create("menu1.png", "menu1.png")
    menuPopupItem:registerScriptTapHandler(onGoMainScene)
    local menuPopup = CCMenu:createWithItem(menuPopupItem)
    menuPopup:setPosition(30, visibleSize.height - 30)

    local firstScene = CCScene:create()
    firstScene:addChild(mylabel)
    firstScene:addChild(menuPopup)

    -- http://blog.csdn.net/odustggg/article/details/8197289#t1
    --trans = CCTransitionFade:create(.5,firstScene)
    --CCDirector:sharedDirector():replaceScene(trans)
    
    return firstScene
end