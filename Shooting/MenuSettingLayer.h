//
//  MenuSettingLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 19..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItemLayer.h"
#import "cocos2d.h"

@interface MenuSettingLayer : MenuItemLayer {
    CCSprite *settingLine;
    CCMenu *settindMenuBox;
    CCMenuItem *coinPushOn,*coinPushOff;
    CCMenuItem *backgroundSoundOn,*backgroundSoundOff;
    CCMenuItem *effectSoundOn,*effectSoundOff;
    CCMenuItem *sens1,*sens2,*sens3;
}
-(void) visibleMenuBox;
-(void) invisibleMenuBox;
@end
