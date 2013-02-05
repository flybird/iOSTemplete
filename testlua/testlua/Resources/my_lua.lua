--單行註釋
--[[
Scripting系統概論與Lua簡介 -> http://blog.monkeypotion.net/gameprog/beginner/introduction-of-scripting-system-and-lua
使用Lua實做GUI系統的遊戲實例 -> http://blog.monkeypotion.net/gameprog/advanced/lua-based-gui-system-from-commercial-game
深入Lua-based GUI系統架構與實做細節 -> http://blog.monkeypotion.net/gameprog/advanced/lua-based-gui-system

多行註釋
手冊(英)->http://www.lua.org/manual/5.2/
手冊(中)->http://www.codingnow.com/2000/download/lua_manual.html
腳本入門：
->http://blog.csdn.net/odustggg/article/category/1217403
->http://blog.xuite.net/vv009801/star/15184993
->https://groups.google.com/d/msg/lua5/MEz-I4NSrj0/Ttg7IgJVr7wJ
Lua Dictionary->http://lua-users.org/wiki/LuaDirectory

官方論壇
http://www.cocos2d-x.org/projects/cocos2d-x/boards/11
--]]

require "hello2"
-- log
CCLuaLog("USE LOG1")
print("USE LOG2\n")


-- variable
a,b,c,d,e,f,g = 0
a = 1
b = 2.5
c = "abcde"
f,e,d = a,b,c
print("result:"..d,e,f,"\n")


-- if
if a~=1 then
  print("NO\n")
elseif a==1 then
  print("YES\n")
else
  print("I don't know")
end


-- function
print("add:" .. myadd(2,5) .. "\n")



-- for(break)
count = 0;
for i=1,10,1 do
  count = count + i
  if i == 5 then break end
  print("i:",i)
end
print("count:",count .. "\n")


-- for(continue)
count = 0;
for i=1,10,2 do
  repeat
     if i == 5 then break end
     count = count + i
     print("i:",i)
  until true
end
print("count:",count .. "\n")


-- while/end
sum = 0
n = 0
while n <5 do
    sum = sum + 1
    n = n + 1
    print("n:",n);    
end
print("sum:",sum .. "\n");


-- repeat
sum = 0
n = -1
repeat
    sum = sum + a
    n = n + 1
    print("n:",n); 
until n == 5
print("sum:",sum .. "\n");


--table concept -> http://justbm.blogspot.tw/2011/05/lua-metatables.html
table = {name = 'goodman', age = 29,123,456,789}
for key, value in pairs(table) do
   print(key,value)
end
print("")

-- metatables
--print("fun add:",add(12,12))


-- load library
dofile("/Users/Neil/Documents/Project/IPhone/Templete/testlua/testlua/Resources/lib1.lua")
print("squrt:" .. norm(20,30))


-- CCScene & CCLayer
local sceneGame = CCScene:create()
local layerGame = CCLayer:create()
sceneGame:addChild(layerGame)


-- CCDirector
CCDirector:sharedDirector():runWithScene(sceneGame)


-- CCLabel
local mylabel = CCLabelTTF:create("第1手", "Sans", 28)
mylabel:setPosition(200,200)
layerGame:addChild(mylabel)