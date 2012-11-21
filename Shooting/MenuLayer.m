//
//  MenuLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 13..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "GameScene.h"
enum {ADD = 1000};
enum {STATUS = 100,STORE,SETTING,INVITE,INBOX,START,RESULT};
@implementation MenuLayer
@synthesize selectMenu;
-(id) init{
    if(self = [super init]){
        [self createBoard];
        [self createAboveItem];
        [self createBelowItem];
        [self createResult];
        [self createInbox];
        [self createinvite];
        [self createSetting];
        [self coinSetting];
        
        if([UserInfo sharedUserInfo].result){
            [UserInfo sharedUserInfo].result = NO;
            [resultLayer visibleSetting:self];
            start.visible = NO;
            restart.visible = YES;
            for(int i = 0 ; i < 5 ; i++){
                gameCoin[i].visible = NO;
            }
            selectMenu = RESULT;
        }else{
            [self visibleSetting];
        }
    }
    return self;
}
-(void) coinSetting{
    for(int i = 0 ; i < 5 ; i++){
        gameCoin[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"gameCoin%d.png",i+1]];
        gameCoin[i].anchorPoint = ccp(0,1);
        gameCoin[i].position = ccp(0,window.height);
        if(i < [UserInfo sharedUserInfo].gameCoin){
            
        }else{
            gameCoin[i].visible = NO;
        }
        [self addChild:gameCoin[i]];
    }
}
-(void) createBoard{
    window = [CCDirector sharedDirector].winSize;
    line = [[CCSprite alloc]initWithFile:@"line.png"];
    line.anchorPoint = ccp(0,0);
    line.position = ccp(0,window.height);
    board = [[CCSprite alloc]initWithFile:@"board.png"];
    board.anchorPoint = ccp(0,0);
    board.position = ccp(0,window.height);
    roof = [[CCSprite alloc]initWithFile:@"roof_main.png"];
    roof.anchorPoint = ccp(0,0);
    roof.position = ccp(0,window.height);
    
    [self addChild:line];
    [self addChild:board];
    [self addChild:roof];
}
-(void) visibleSetting{
    for(int i = 0 ; i < 5 ; i++){
        if(i < [UserInfo sharedUserInfo].gameCoin){
            gameCoin[i].visible = YES;
        }else{
            gameCoin[i].visible = NO;
        }
    }
    //[roof runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height - roof.contentSize.height)]];
    [line runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height - line.contentSize.height)]];
    [board runAction:[CCSequence actions:[CCMoveTo actionWithDuration:0.3 position:ccp(0,114-30)],[CCMoveTo actionWithDuration:0.2 position:ccp(0,114)], nil]];
    //[coinAdd runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    coinAdd.position = ccp(0,window.height);
    roof.position = ccp(0,window.height - roof.contentSize.height);
    start.visible = YES;
    restart.visible = NO;
}
-(void) invisibleSetting{
    start.visible = YES;
    restart.visible = NO;
    [line runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    [board runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    //[roof runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    //[coinAdd runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height+coinAdd.contentSize.height)]];
    coinAdd.position = ccp(0,window.height+coinAdd.contentSize.height);
    roof.position = ccp(0,window.height);
    for(int i = 0 ; i < 5 ; i++){
        gameCoin[i].visible = NO;
    }
}
-(void) createAboveItem{
    start = [CCMenuItemImage itemFromNormalImage:@"start.png" selectedImage:@"start_s.png" target:self selector:@selector(selectItem:)];
    start.tag = START;
    start.anchorPoint = ccp(0.5,0.5);
    start.position = ccp(160,110);
    
    restart = [CCMenuItemImage itemFromNormalImage:@"restart.png" selectedImage:@"restart_s.png" target:self selector:@selector(selectItem:)];
    restart.tag = START;
    restart.anchorPoint = ccp(0.5,0.5);
    restart.position = ccp(160,110);
    restart.visible = NO;
    
    coinAdd = [CCMenuItemImage itemFromNormalImage:@"add.png" selectedImage:@"add_s.png" target:self selector:@selector(selectItem:)];
    coinAdd.tag = ADD;
    coinAdd.anchorPoint = ccp(0,1);
    coinAdd.position = ccp(0,window.height);
    
    AboveMenuNavigation = [CCMenu menuWithItems:start,restart,coinAdd, nil];
    AboveMenuNavigation.anchorPoint = ccp(0,0);
    AboveMenuNavigation.position = ccp(0,0);
    [self addChild:AboveMenuNavigation];

}
-(void) createBelowItem{
    status = [CCMenuItemImage itemFromNormalImage:@"status.png" selectedImage:@"status_s.png" target:self selector:@selector(selectItem:)];
    status.tag = STATUS;
    status.anchorPoint = ccp(0,0);
    status.position = ccp(0,0);
    
    store = [CCMenuItemImage itemFromNormalImage:@"store.png" selectedImage:@"store_s.png" target:self selector:@selector(selectItem:)];
    store.tag = STORE;
    store.anchorPoint = ccp(0,0);
    store.position = ccp(64 * 1,0);
    
    invite = [CCMenuItemImage itemFromNormalImage:@"invite.png" selectedImage:@"invite_s.png" target:self selector:@selector(selectItem:)];
    invite.tag = INVITE;
    invite.anchorPoint = ccp(0,0);
    invite.position = ccp(64 * 2,0);
    
    inbox = [CCMenuItemImage itemFromNormalImage:@"inbox.png" selectedImage:@"inbox_s.png" target:self selector:@selector(selectItem:)];
    inbox.tag = INBOX;
    inbox.anchorPoint = ccp(0,0);
    inbox.position = ccp(64 * 3,0);
    
    setting = [CCMenuItemImage itemFromNormalImage:@"setting.png" selectedImage:@"setting_s.png" target:self selector:@selector(selectItem:)];
    setting.tag = SETTING;
    setting.anchorPoint = ccp(0,0);
    setting.position = ccp(64 * 4,0);
    
    belowMenuNavigation = [CCMenu menuWithItems:status,store,invite,inbox,setting, nil];
    belowMenuNavigation.anchorPoint = ccp(0,0);
    belowMenuNavigation.position = ccp(0,0);
    [self addChild:belowMenuNavigation];
}
-(void) createinvite{
    inviteLayer = [[MenuInviteLayer alloc]init];
    [self addChild:inviteLayer];
}
-(void) createInbox{
    inboxLayer = [[MenuInboxLayer alloc]init];
    [self addChild:inboxLayer];
}
-(void) createSetting{
    settingLayer = [[MenuSettingLayer alloc]init];
    [self addChild:settingLayer];
}
-(void) createResult{
    resultLayer = [[ResultLayer alloc]init];
    [self addChild:resultLayer];
}
-(void) allInvisible{
    [self invisibleSetting];
    [inviteLayer invisibleSetting];
    [inboxLayer invisibleSetting];
    [settingLayer invisibleSetting];
    [resultLayer invisibleSetting];
}
-(void)selectItem:(CCMenuItem*)item{
    switch (item.tag) {
        case START:
            if([UserInfo sharedUserInfo].gameCoin > 0){
                --[UserInfo sharedUserInfo].gameCoin;
                start.visible = NO;
                [[CCDirector sharedDirector]replaceScene:[GameScene scene]];
            }
            break;
        case INVITE:
            [self stopAllActions];
            if(selectMenu == INVITE){
                selectMenu = NO;
                [self runAction:[CCSequence actions:[CCCallFunc actionWithTarget:inviteLayer selector:@selector(invisibleSetting)],[CCDelayTime actionWithDuration:0.3],[CCCallFuncN actionWithTarget:self selector:@selector(visibleSetting)], nil]];
            }
            else{   
                selectMenu = INVITE;
                [self runAction:[CCSequence actions:[CCCallFunc actionWithTarget:self selector:@selector(allInvisible)],[CCDelayTime actionWithDuration:0.3],[CCCallFuncN actionWithTarget:inviteLayer selector:@selector(visibleSetting:)], nil]];
            }
            break;
        case INBOX:
            [self stopAllActions];
            if(selectMenu == INBOX){
                selectMenu = NO;
                [self runAction:[CCSequence actions:[CCCallFunc actionWithTarget:inboxLayer selector:@selector(invisibleSetting)],[CCDelayTime actionWithDuration:0.3],[CCCallFuncN actionWithTarget:self selector:@selector(visibleSetting)], nil]];
            }
            else{   
                selectMenu = INBOX;
                [self runAction:[CCSequence actions:[CCCallFunc actionWithTarget:self selector:@selector(allInvisible)],[CCDelayTime actionWithDuration:0.3],[CCCallFuncN actionWithTarget:inboxLayer selector:@selector(visibleSetting:)], nil]];
            }
            break;
        case SETTING:
            [self stopAllActions];
            if(selectMenu == SETTING){
                selectMenu = NO;
               [self runAction:[CCSequence actions:[CCCallFunc actionWithTarget:settingLayer selector:@selector(invisibleSetting)],[CCDelayTime actionWithDuration:0.3],[CCCallFuncN actionWithTarget:self selector:@selector(visibleSetting)], nil]];
            }
            else{   
                selectMenu = SETTING;
                [self runAction:[CCSequence actions:[CCCallFunc actionWithTarget:self selector:@selector(allInvisible)],[CCDelayTime actionWithDuration:0.3],[CCCallFuncN actionWithTarget:settingLayer selector:@selector(visibleSetting:)], nil]];
            }
            break;
        case ADD:
            NSLog(@"ADD");
            break;
        default:
            break;
    }
}
-(void) dealloc{
    NSLog(@"menulayer release");
    [settingLayer release];
    [inboxLayer release];
    [inviteLayer release];
    [resultLayer release];
    [super dealloc];
}
@end
