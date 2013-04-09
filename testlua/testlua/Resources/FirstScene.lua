-- Neil
-- reference LuaCocos2d.cpp
-- http://www.cocos2d-x.org/projects/cocos2d-x/wiki/New_Lua_Engine_Documents
--

function createFirstScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    
    local container = CCLayerColor:create(ccc4(60,40,60,255))
    
    -- CCLabel
    local mylabel = CCLabelTTF:create("First Scene", "Sans", 28)
    mylabel:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height -20)
    container:addChild(mylabel)
    
    -- Back button
    local function onGoMainScene()
        replaceScene(1)
    end
    
    local menuPopupItem = CCMenuItemImage:create("menu1.png", "menu1.png")
    menuPopupItem:registerScriptTapHandler(onGoMainScene)
    local menuPopup = CCMenu:createWithItem(menuPopupItem)
    menuPopup:setPosition(30, visibleSize.height - 30)
    container:addChild(menuPopup)
    
    -- random number
    math.randomseed(os.time())
    math.random(1,20)
    
    -- card's double number,(1,1,2,2,...,10,10), total:20
    randomTable = {}
    numTable = {}
    for i=1,20 do
        numTable[i] = math.floor((i-1)/2)
    end
    
    -- craate card's background
    -- put random num
    bgTable = {}
    local index = 1
    
    for i=1,5 do
        for j=1,4 do
            local cardbg = CCSprite:create("b_big_08.png",CCRectMake(6,10,34,42))
            --local rect = CCRectMake(10,10,32,42)
            --cardbg:setAnchorPoint(CCPoint(0.5,0.5))
            --cardbg:setContentSize(CCSize(32,42))
            --cardbg.containsPoint = CCPoint(100,20);
            cardbg:setPosition(visibleSize.width/2+46*i - 46*5/2,visibleSize.height/2+60*j-160)
            --cardbg:setColor(ccc3(20,20,20));
            container:addChild(cardbg)
            table.insert(bgTable,cardbg)
            
            local totalNum = table.getn(numTable)
            local randIndex = math.random(1,totalNum)
            randomTable[index] = numTable[randIndex]
            table.remove(numTable,randIndex)
            index = index + 1
        end
    end

    -- touch events
    local firstTouchNum = -1
    local secondTouchNum = -1
    local firstTouchCard = nil
    local secondTouchCard = nil
    local isAnime = false
    local scheduler = container:getScheduler()
    local handle = nil;
    local alreadyOKCound = 0;
    
    local function cleanAll()
        firstTouchNum = -1
        secondTouchNum = -1
        firstTouchCard = nil
        secondTouchCard = nil
    end
    
    -- change image
    local function changeImage(target,index)
        local imgName = nil
        if index == -1 then
            imgName = "b_big_08.png"
        else
            imgName = "c_big_".. (index+11) ..".png"
        end
        local newImg = CCSprite:create(imgName)
        local imgtexture = newImg:getTexture()
        target:setTexture(imgtexture);
    end
    
    -- check is the same
    local function anime()
        scheduler:unscheduleScriptEntry(handle)
        changeImage(firstTouchCard,-1)
        changeImage(secondTouchCard,-1)
        isAnime = false
        cleanAll()
    end
    
    -- check is finish
    local function goBackLa()
        scheduler:unscheduleScriptEntry(handle)
        onGoMainScene()
    end
    local function isFinish()
        alreadyOKCound = alreadyOKCound + 2;
        if alreadyOKCound == 20 then
            handle = scheduler:scheduleScriptFunc(goBackLa,2,false)
        end
    end
    
    --touch events
    local function onTouchEnded(x, y)
        --print("onTouchEnded:", x, "\t", y)
        if isAnime then
            return
        end
        touchLocation = CCDirector:sharedDirector():convertToGL(CCPoint(x,y))
        local isTouched = false;
        for i=1,table.getn(bgTable) do
            if bgTable[i]:boundingBox():containsPoint(CCPoint(x,y)) then
                
                -- open first card
                if firstTouchNum == -1 then
                    firstTouchNum = randomTable[i]
                    firstTouchCard = bgTable[i]
                    changeImage(firstTouchCard,firstTouchNum)
                -- open second card
                elseif secondTouchNum == -1 then
                    secondTouchNum = randomTable[i]
                    secondTouchCard = bgTable[i]
                    changeImage(secondTouchCard,secondTouchNum)
                end
                
                -- check first card is equal second card
                if firstTouchNum ~= -1 and secondTouchNum ~=-1 then
                    if firstTouchNum == secondTouchNum then
                        cleanAll()
                        isFinish()
                    else
                        isAnime = true
                        handle = scheduler:scheduleScriptFunc(anime,1,false)
                    end
                end
                isTouched = true;
                break;
            end
        end
        
        if isTouched == false then
            if firstTouchCard then
                changeImage(firstTouchCard,-1)
            end
            if secondTouchCard then
                changeImage(secondTouchCard,-1)
            end
            cleanAll()
        end
    end
    local function onTouchBegan(x, y)
        --print("onTouchBegan:", x, "\t", y)
    end
    
    local function onTouchMoved(x, y)
        --print("onTouchMoved", x, y)
    end
    
    local function onTouches(eventType, touches)
        for i = 1, #touches, 2 do
            local x, y = touches[i], touches[i + 1]
            if eventType == CCTOUCHBEGAN then
                return onTouchBegan(x, y)
            elseif eventType == CCTOUCHMOVED then
                return onTouchMoved(x, y)
            elseif eventType == CCTOUCHENDED then
                return onTouchEnded(x, y)
            end
        end
    end
    container:registerScriptTouchHandler(onTouches,true)
    container:setTouchEnabled(true)
    
    local scene = CCScene:create()
    scene:addChild(container)
    
    return scene
end




