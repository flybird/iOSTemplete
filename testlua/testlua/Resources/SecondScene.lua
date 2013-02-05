
function createSecondScene()
    local visibleSize = CCDirector:sharedDirector():getVisibleSize()
    local origin = CCDirector:sharedDirector():getVisibleOrigin()
    
    -- CCLabel
    local mylabel = CCLabelTTF:create("Second Scene", "Sans", 28)
    mylabel:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)

    local secondScene = CCScene:create()
    secondScene:addChild(mylabel)
    --CCDirector:sharedDirector():replaceScene(secondScene)
    
    return secondScene
end