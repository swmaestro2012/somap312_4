//
//  MenuSettingLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 19..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuSettingLayer.h"
#import "UserInfo.h"
enum{COINON = 100,COINOFF,BACKON,BACKOFF,EFFECTON,EFFECTOFF,SENS1,SENS2,SENS3};
@implementation MenuSettingLayer

-(void) createMenuItem{
    coinPushOn = [CCMenuItemImage itemFromNormalImage:@"on.png" selectedImage:@"on.png" target:self selector:@selector(selectItem:)];
    coinPushOn.tag = COINON;
    coinPushOn.anchorPoint = ccp(0,0);
    coinPushOn.position = ccp(224,308);
    coinPushOff = [CCMenuItemImage itemFromNormalImage:@"off.png" selectedImage:@"off.png" target:self selector:@selector(selectItem:)];
    coinPushOff.tag = COINOFF;
    coinPushOff.anchorPoint = ccp(0,0);
    coinPushOff.position = ccp(224,308);
    if([UserInfo sharedUserInfo].isPush)
        coinPushOff.visible = NO;
    else
        coinPushOn.visible = NO;
    
    backgroundSoundOn = [CCMenuItemImage itemFromNormalImage:@"on.png" selectedImage:@"on.png" target:self selector:@selector(selectItem:)];
    backgroundSoundOn.tag = BACKON;
    backgroundSoundOn.anchorPoint = ccp(0,0);
    backgroundSoundOn.position = ccp(224,268);
    backgroundSoundOff = [CCMenuItemImage itemFromNormalImage:@"off.png" selectedImage:@"off.png" target:self selector:@selector(selectItem:)];
    backgroundSoundOff.tag = BACKOFF;
    backgroundSoundOff.anchorPoint = ccp(0,0);
    backgroundSoundOff.position = ccp(224,268);
    if([UserInfo sharedUserInfo].isBgm)
        backgroundSoundOff.visible = NO;
    else
        backgroundSoundOn.visible = NO;
    
    effectSoundOn = [CCMenuItemImage itemFromNormalImage:@"on.png" selectedImage:@"on.png" target:self selector:@selector(selectItem:)];
    effectSoundOn.tag = EFFECTON;
    effectSoundOn.anchorPoint = ccp(0,0);
    effectSoundOn.position = ccp(224,228);
    effectSoundOff = [CCMenuItemImage itemFromNormalImage:@"off.png" selectedImage:@"off.png" target:self selector:@selector(selectItem:)];
    effectSoundOff.tag = EFFECTOFF;
    effectSoundOff.anchorPoint = ccp(0,0);
    effectSoundOff.position = ccp(224,228);
    if([UserInfo sharedUserInfo].isEffect)
        effectSoundOff.visible = NO;
    else
        effectSoundOn.visible = NO;
    
    sens1 = [CCMenuItemImage itemFromNormalImage:@"sens1.png" selectedImage:@"sens1.png" target:self selector:@selector(selectItem:)];
    sens1.tag = SENS1;
    sens1.anchorPoint = ccp(0,0);
    sens1.position = ccp(224,188);
    sens2 = [CCMenuItemImage itemFromNormalImage:@"sens2.png" selectedImage:@"sens2.png" target:self selector:@selector(selectItem:)];
    sens2.tag = SENS2;
    sens2.anchorPoint = ccp(0,0);
    sens2.position = ccp(224,188);
    sens3 = [CCMenuItemImage itemFromNormalImage:@"sens3.png" selectedImage:@"sens3.png" target:self selector:@selector(selectItem:)];
    sens3.tag = SENS3;
    sens3.anchorPoint = ccp(0,0);
    sens3.position = ccp(224,188);
    if([UserInfo sharedUserInfo].sensitive == 1){
        sens2.visible = NO;
        sens3.visible = NO;
    }else if([UserInfo sharedUserInfo].sensitive == 2 ){
        sens1.visible = NO;
        sens3.visible = NO;
    }else if([UserInfo sharedUserInfo].sensitive == 3){
        sens1.visible = NO;
        sens2.visible = NO;
    }
    
    
    settindMenuBox = [CCMenu menuWithItems:coinPushOn,coinPushOff,backgroundSoundOn,backgroundSoundOff,effectSoundOn,effectSoundOff,sens1,sens2,sens3, nil];
    settindMenuBox.anchorPoint = ccp(0,0);
    settindMenuBox.position = ccp(0,0);
    settindMenuBox.visible = NO;
    [self addChild:settindMenuBox];
}
-(void) selectItem:(CCMenuItem*)item{
    switch (item.tag) {
        case COINON:
            coinPushOn.visible = NO;
            coinPushOff.visible = YES;
            [UserInfo sharedUserInfo].isPush = NO;
            break;
        case COINOFF:
            coinPushOn.visible = YES;
            coinPushOff.visible = NO;
            [UserInfo sharedUserInfo].isPush = YES;
            break;
        case BACKON:
            backgroundSoundOn.visible = NO;
            backgroundSoundOff.visible = YES;
            [UserInfo sharedUserInfo].isBgm = NO;
            break;
        case BACKOFF:
            backgroundSoundOn.visible = YES;
            backgroundSoundOff.visible = NO;
            [UserInfo sharedUserInfo].isBgm = YES;
            break;
        case EFFECTON:
            effectSoundOn.visible = NO;
            effectSoundOff.visible = YES;
            [UserInfo sharedUserInfo].isEffect = NO;
            break;
        case EFFECTOFF:
            effectSoundOn.visible =YES;
            effectSoundOff.visible = NO;
            [UserInfo sharedUserInfo].isEffect = YES;
            break;
        case SENS1:
            sens2.visible = YES;
            sens1.visible = NO;
            [UserInfo sharedUserInfo].sensitive = 2;
            break;
        case SENS2:
            sens3.visible = YES;
            sens2.visible = NO;
            [UserInfo sharedUserInfo].sensitive = 3;
            break;
        case SENS3:
            sens1.visible = YES;
            sens3.visible = NO;
            [UserInfo sharedUserInfo].sensitive = 1;
            break;
        default:
            NSLog(@"MenuSettingLayer error");
            break;
    }
}
-(void) visibleMenuBox{
    settindMenuBox.visible = YES;
}
-(void) invisibleMenuBox{
    settindMenuBox.visible = NO;
}
-(void) createRoof{
    roof = [[CCSprite alloc]initWithFile:@"roof_setting.png"];
    roof.anchorPoint = ccp(0,0);
    roof.position = ccp(0,window.height);
    [self addChild:roof];
    
    settingLine = [[CCSprite alloc]initWithFile:@"settingLine.png"];
    settingLine.anchorPoint = ccp(0,0);
    settingLine.position = ccp(0,window.height);
    [self addChild:settingLine];
}
-(void) visibleSetting:(MenuLayer *)layer{
    [super visibleSetting:layer];
    [settingLine stopAllActions];
    [settingLine runAction:[CCSequence actions:[CCMoveTo actionWithDuration:0.3 position:ccp(0,window.height-settingLine.contentSize.height-30)],[CCMoveTo actionWithDuration:0.2 position:ccp(0,window.height-settingLine.contentSize.height)],[CCCallFunc actionWithTarget:self selector:@selector(visibleMenuBox)], nil]];
}
-(void) invisibleSetting{
    [super invisibleSetting];
    [self invisibleMenuBox];
    [settingLine stopAllActions];
    [settindMenuBox stopAllActions];
    [settingLine runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    //[settindMenuBox runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
}
-(void) dealloc{
    [settingLine release];
    [super dealloc];
}
@end
