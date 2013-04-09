//
//  LauInterface.cpp
//  testlua
//
//  Created by Neil on 13/2/4.
//
//
//  Call Lua Function From C/C++
//  http://gamedevgeek.com/tutorials/calling-lua-functions/
//

#include "LuaInterface.h"
#include "cocos2d.h"

USING_NS_CC;

extern "C"
{
    #include <stdio.h>
    #include "lua.h"
    #include "lualib.h"
    #include "lauxlib.h"
    
    int LuaInterface::add(int num1, int num2)
    {
        int result = 0;
        
        //call lua function
        lua_State *L = lua_open();
        luaL_openlibs(L);
        
        //        NSBundle * mainNSBundle = [NSBundle mainBundle];
        //        NSString * luaFilePath = [mainNSBundle pathForResource:@"lib1" ofType:@"lua" inDirectory:NULL forLocalization:NULL];
//        CCFileUtils::sharedFileUtils()->fullPathForFilename(<#const char *pszFileName#>)
        if (luaL_loadfile(L, "/Users/Neil/Documents/Project/IPhone/Templete/testlua/testlua/Resources/lib1.lua") || lua_pcall(L, 0, 0, 0)) {
            printf("error: %s", lua_tostring(L, -1));
            return -1;
        }
        lua_getglobal(L, "add");
        if(!lua_isfunction(L,-1))
        {
            lua_pop(L,1);
        }
        
        lua_pushnumber(L, num1);   /* push 1st argument */
        lua_pushnumber(L, num2);   /* push 2nd argument */
        
        /* do the call (2 arguments, 1 result) */
        if (lua_pcall(L, 2, 1, 0) != 0) {
            printf("error running function `norm': %s\n",lua_tostring(L, -1));
            return -1;
        }
        
        /* retrieve result */
        if (!lua_isnumber(L, -1)) {
            printf("function `norm' must return a number\n");
            return -1;
        }
        
        result = lua_tonumber(L, -1);
        
        lua_pop(L, 1);
        lua_close(L);
        
        return result;
    }
}