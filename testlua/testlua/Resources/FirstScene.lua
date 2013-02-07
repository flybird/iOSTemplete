function createFirstScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    
    local container = CCLayerColor:create(ccc4(60,40,60,255))
    
    -- CCLabel
    local mylabel = CCLabelTTF:create("First Scene", "Sans", 28)
    mylabel:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height -20)
    container:addChild(mylabel)
    
    -- bg
    bgTable = {}
    for i=1,5 do
        for j=1,4 do
            local cardbg = CCSprite:create("b_big_08.png")
            contentSize = CCSize(32,42)
            cardbg:setContentSize(contentSize);
            cardbg:setPosition(visibleSize.width/2+46*i - 46*5/2,visibleSize.height/2+60*j-140)
            --cardbg:setScale(0.5);
            --cardbg:setContentSize(CCRectMake(0,0,40,40));
            cardbg:setColor(ccc3(20,20,20));
            container:addChild(cardbg)
            table.insert(bgTable,cardbg)
        end
    end
    
    -- touch events
    local function onTouchBegan(x, y)
        --print("onTouchBegan:", x, "\t", y)
        touchLocation = CCDirector:sharedDirector():convertToGL(CCPoint(x,y))
        for i=1,table.getn(bgTable) do
            boundingBox = bgTable[i]:boundingBox()
            --print("boundingBox:",boundingBox.origin.x);
            
            --contentSize = bgTable[i]:getContentSize()
            
            --contentPoint = CCPoint(8,13)
            --contentPoint = CCPoint(boundingBox.origin.x,boundingBox.origin.y)
            --bgTable[i]:setContentSize(contentSize);
            --bgTable[i]:setPosition(contentPoint);
            
            --print("contentSize:",contentSize.height);
            
            if bgTable[i]:boundingBox():containsPoint(CCPoint(x,y)) then
                --print("boundingBox:",boundingBox.origin);
                --print("boundingBox:",boundingBox.size);
                print("clicked bg:",i)
                break;
            end
        end
    end
    
    local function onTouchMoved(x, y)
        --cclog("onTouchMoved: %0.2f, %0.2f", x, y)
    end
    
    local function onTouchEnded(x, y)
        --print("onTouchEnded:", x, "\t", y)
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
    container:registerScriptTouchHandler(onTouch,false)
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
    
    local scene = CCScene:create()
    scene:addChild(container)
    
    return scene
end




