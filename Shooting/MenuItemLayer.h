//
//  MenuSettingLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 15..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class MenuLayer;
@interface MenuItemLayer : CCLayer {
    CGSize window;
    CCSprite *roof,*board,*line;
    CCMenu *backMenuBox;
    
    MenuLayer *menuLayer;
}
-(void) createRoof;
-(void) createBackItem;
-(void) receiveBack;
-(void) createMenuItem;
-(void) selectItem:(CCMenuItem*)item;
-(void) visibleSetting:(MenuLayer*)layer;
-(void) invisibleSetting;
@end
