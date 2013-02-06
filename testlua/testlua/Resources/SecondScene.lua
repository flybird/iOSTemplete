
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
    
    local secondScene = CCScene:create()
    secondScene:addChild(mylabel)
    secondScene:addChild(menuPopup)
    
    return secondScene
end