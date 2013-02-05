
function replaceScene(index)
    if index == 1 then
        CCDirector:sharedDirector():replaceScene(createFirstScene())
    elseif index == 2 then
        CCDirector:sharedDirector():replaceScene(createSecondScene())
    end
end

function CreateMainScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    local layerMenu = CCLayer:create()
    local menuPopup, menuTools

    local function onGoFirstScene()
        print("first scene");
        replaceScene(1)
    end

    local function onGoSecondScene()
        print("second scene");
        replaceScene(2)
    end
        
    -- add a first scene menu
    local menuPopupItem = CCMenuItemImage:create("menu2.png", "menu2.png")
    menuPopupItem:setPosition(0, 0)
    menuPopupItem:registerScriptTapHandler(onGoFirstScene)
    menuPopup = CCMenu:createWithItem(menuPopupItem)
    menuPopup:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
    layerMenu:addChild(menuPopup)

    -- add a second scene menu
    local menuToolsItem = CCMenuItemImage:create("menu1.png", "menu1.png")
    menuToolsItem:setPosition(0, 0)
    menuToolsItem:registerScriptTapHandler(onGoSecondScene)
    menuTools = CCMenu:createWithItem(menuToolsItem)
    local itemWidth = menuToolsItem:getContentSize().width
    local itemHeight = menuToolsItem:getContentSize().height
    menuTools:setPosition(origin.x + visibleSize.width/2, origin.y + itemHeight/2)
    layerMenu:addChild(menuTools)
    
    return layerMenu
end


--[[
local function replaceScene(index)
    if index == 1 then
        CCDirector:sharedDirector():replaceScene(createFirstScene())
    elseif index == 2 then
        CCDirector:sharedDirector():replaceScene(createSecondScene())
    end
end

local function main()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()

-- create menu
    local function createLayerMenu()
        local layerMenu = CCLayer:create()

        local menuPopup, menuTools, effectID
        
        local function onGoFirstScene()
            print("first scene");
            replaceScene(1)
        end

        local function onGoSecondScene()
            print("second scene");
            replaceScene(2)
        end

        -- add a first scene menu
        local menuPopupItem = CCMenuItemImage:create("menu2.png", "menu2.png")
        menuPopupItem:setPosition(0, 0)
        menuPopupItem:registerScriptTapHandler(onGoFirstScene)
        menuPopup = CCMenu:createWithItem(menuPopupItem)
        menuPopup:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
        layerMenu:addChild(menuPopup)

        -- add a second scene menu
        local menuToolsItem = CCMenuItemImage:create("menu1.png", "menu1.png")
        menuToolsItem:setPosition(0, 0)
        menuToolsItem:registerScriptTapHandler(onGoSecondScene)
        menuTools = CCMenu:createWithItem(menuToolsItem)
        local itemWidth = menuToolsItem:getContentSize().width
        local itemHeight = menuToolsItem:getContentSize().height
        menuTools:setPosition(origin.x + visibleSize.width/2, origin.y + itemHeight/2)
        layerMenu:addChild(menuTools)

        return layerMenu
    end
    
    -- run
    sceneGame = CCScene:create()
    sceneGame:addChild(createLayerMenu())
    CCDirector:sharedDirector():runWithScene(sceneGame)
    
    print("Main Scene");
end
]]-- 
--xpcall(main, __G__TRACKBACK__)