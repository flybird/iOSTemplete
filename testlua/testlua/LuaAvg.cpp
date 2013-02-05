//
//  LuaAvg.cpp
//  testlua
//
//  Created by Neil on 13/2/4.
//
//  Call C/C++ Function From Lue
//  http://gamedevgeek.com/tutorials/calling-c-functions-from-lua/
//

#include "LuaAvg.h"


extern "C"
{
    #include <stdio.h>
    #include "lua.h"
    #include "lualib.h"
    #include "lauxlib.h"


    /* the Lua interpreter */
    lua_State *L;
    
    int average(lua_State *L)
    {
        /* get number of arguments */
        int n = lua_gettop(L);
        double sum = 0;
        int i;
    
        /* loop through each argument */
        for (i = 1; i <= n; i++)
        {
            /* total the arguments */
            sum += lua_tonumber(L, i);
        }
    
        /* push the average */
        lua_pushnumber(L, sum / n);
    
        /* push the sum */
        lua_pushnumber(L, sum);
    
        /* return the number of results */
        return 2;
    }

    void LuaAvg::initLuaFunction(void)
    {
        /* initialize Lua */
        L = lua_open();
        
        /* load Lua base libraries */
        luaL_openlibs(L);
        
        /* register our function */
        lua_register(L, "average", average);
        
        /* run the script */
        luaL_dofile(L, "/Users/Neil/Documents/Project/IPhone/Templete/testlua/testlua/Resources/avg.lua");
        
        /* cleanup Lua */
        lua_close(L);
    }
}