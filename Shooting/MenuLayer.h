//
//  MenuLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 13..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuSettingLayer.h"
#import "MenuInboxLayer.h"
#import "MenuInviteLayer.h"
#import "ResultLayer.h"

@interface MenuLayer : CCLayer {
    CCMenuItem *status,*store,*invite,*inbox,*setting,*start,*restart,*coinAdd;
    CCMenu *belowMenuNavigation,*AboveMenuNavigation;
    
    MenuSettingLayer *settingLayer;
    MenuInboxLayer *inboxLayer;
    MenuInviteLayer *inviteLayer;
    ResultLayer *resultLayer;
    int selectMenu;
    
    CGSize window;
    CCSprite *roof,*board,*line;
    CCSprite *gameCoin[5];
}
@property int selectMenu;
-(void) createBoard;
-(void) visibleSetting;
-(void) invisibleSetting;
-(void) coinSetting;

-(void) createAboveItem;
-(void) createBelowItem;

-(void) createinvite;
-(void) createInbox;
-(void) createSetting;
-(void) createResult;

-(void)selectItem:(CCMenuItem*)item;
@end
