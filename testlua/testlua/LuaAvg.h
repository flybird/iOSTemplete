//
//  LuaAvg.h
//  testlua
//
//  Created by Neil on 13/2/4.
//
//

#ifndef __testlua__LuaAvg__
#define __testlua__LuaAvg__


#include "cocos2d.h"


class LuaAvg : public cocos2d::CCLayer
{
    
public:
    void average2(lua_State *L);
    static void initLuaFunction(void);
};

#endif /* defined(__testlua__LuaAvg__) */
