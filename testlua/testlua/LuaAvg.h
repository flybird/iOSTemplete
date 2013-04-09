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
    virtual bool init(void);
//	virtual LuaAvg(void);
//	LuaAvg(void) {}
    
    static LuaAvg* sharedDirector(void);
    static void runsomething(void);
    static void initLuaFunction(void);
};

#endif /* defined(__testlua__LuaAvg__) */
