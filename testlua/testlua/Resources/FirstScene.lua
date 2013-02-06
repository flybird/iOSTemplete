
function createFirstScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    
    local container = CCLayer:create()
    
    -- CCLabel
    local mylabel = CCLabelTTF:create("First Scene", "Sans", 28)
    mylabel:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height -20)
    container:addChild(mylabel)
    
    -- bg
    for i=1,5 do
        for j=1,4 do
            local cardbg = CCSprite:create("b_big_08.png")
            cardbg:setPosition(visibleSize.width/2+40*i - 40*5/2,visibleSize.height/2+54*j-120)
            cardbg:setScale(0.5);
            container:addChild(cardbg)
        end
    end
    
    -- touch events
    local function onTouchBegan(x, y)
        cclog("onTouchBegan: %0.2f, %0.2f", x, "\t", y)
    end
    
    local function onTouchMoved(x, y)
        --cclog("onTouchMoved: %0.2f, %0.2f", x, y)
    end
    
    local function onTouchEnded(x, y)
        cclog("onTouchEnded: %0.2f, %0.2f", x, "\t", y)
    end
    
    local function onTouch(eventType, x, y)
        if eventType == CCTOUCHBEGAN then
            return onTouchBegan(x, y)
        elseif eventType == CCTOUCHMOVED then
            return onTouchMoved(x, y)
        else
            return onTouchEnded(x, y)
        end
    end
    container:registerScriptTouchHandler(onTouch)
    container:setTouchEnabled(true)
    
    -- Back button
    local function onGoMainScene()
        replaceScene(1)
    end
    
    local menuPopupItem = CCMenuItemImage:create("menu1.png", "menu1.png")
    menuPopupItem:registerScriptTapHandler(onGoMainScene)
    local menuPopup = CCMenu:createWithItem(menuPopupItem)
    menuPopup:setPosition(30, visibleSize.height - 30)
    container:addChild(menuPopup)
    
    -- change scene
    local firstScene = CCScene:create()
    firstScene:addChild(container)
    
    return firstScene
end