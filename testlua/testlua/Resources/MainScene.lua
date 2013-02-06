--MainScene

function createMainScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    local container = CCLayer:create()
    local menuPopup, menuTools

    local function onGoFirstScene()
        print("first scene");
        replaceScene(2)
    end

    local function onGoSecondScene()
        print("second scene");
        replaceScene(3)
    end
        
    -- add a first scene menu
    local menuPopupItem = CCMenuItemImage:create("menu2.png", "menu2.png")
    menuPopupItem:setPosition(0, 0)
    menuPopupItem:registerScriptTapHandler(onGoFirstScene)
    menuPopup = CCMenu:createWithItem(menuPopupItem)
    menuPopup:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
    container:addChild(menuPopup)

    -- add a second scene menu
    local menuToolsItem = CCMenuItemImage:create("menu1.png", "menu1.png")
    menuToolsItem:setPosition(0, 0)
    menuToolsItem:registerScriptTapHandler(onGoSecondScene)
    menuTools = CCMenu:createWithItem(menuToolsItem)
    local itemWidth = menuToolsItem:getContentSize().width
    local itemHeight = menuToolsItem:getContentSize().height
    menuTools:setPosition(origin.x + visibleSize.width/2, origin.y + itemHeight/2)
    container:addChild(menuTools)
    
    local scene = CCScene:create()
    scene:addChild(container)
    return scene
end