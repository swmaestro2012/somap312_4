//
//  MenuSettingLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 15..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuItemLayer.h"
#import "UserInfo.h"
#import "MenuLayer.h"
@implementation MenuItemLayer
-(id) init{
    if( self = [super init] ){
        window = [CCDirector sharedDirector].winSize;
        line = [[CCSprite alloc]initWithFile:@"line.png"];
        line.anchorPoint = ccp(0,0);
        line.position = ccp(0,window.height);
        board = [[CCSprite alloc]initWithFile:@"board.png"];
        board.anchorPoint = ccp(0,0);
        board.position = ccp(0,window.height);
        
        [self addChild:line];
        [self addChild:board];
        [self createRoof];
        [self createBackItem];
        [self createMenuItem];
    }
    return self;
}
-(void) createRoof{
    roof = [[CCSprite alloc]initWithFile:@"roof_setting.png"];
    roof.anchorPoint = ccp(0,0);
    roof.position = ccp(0,window.height);
    [self addChild:roof];
}
-(void) createBackItem{
    CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"back.png" selectedImage:@"back_s.png" target:self selector:@selector(receiveBack)];
    back.position = ccp(30,window.height-25);
    backMenuBox = [CCMenu menuWithItems:back, nil];
    backMenuBox.anchorPoint = ccp(0,0);
    backMenuBox.position = ccp(0,100);
    [self addChild:backMenuBox];
}
-(void) receiveBack{
    menuLayer.selectMenu = NO;
    [self runAction:[CCSequence actions:[CCCallFunc actionWithTarget:self selector:@selector(invisibleSetting)],[CCDelayTime actionWithDuration:0.3],[CCCallFuncN actionWithTarget:menuLayer selector:@selector(visibleSetting)], nil]];
}
-(void) createMenuItem{

}
-(void) selectItem:(CCMenuItem*)item{
    switch (item.tag) {
    }
}
-(void) visibleSetting:(MenuLayer*)layer{
    [roof stopAllActions];
    [backMenuBox stopAllActions];
    [line stopAllActions];
    [board stopAllActions];
    
    menuLayer = layer;
    roof.position = ccp(0,window.height - roof.contentSize.height);
    backMenuBox.position = ccp(0,window.height - backMenuBox.contentSize.height);
//    [roof runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height - roof.contentSize.height)]];
//    [backMenuBox runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height - backMenuBox.contentSize.height)]];
    [line runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height - line.contentSize.height)]];
    [board runAction:[CCSequence actions:[CCMoveTo actionWithDuration:0.3 position:ccp(0,114-30)],[CCMoveTo actionWithDuration:0.2 position:ccp(0,114)], nil]];
}
-(void) invisibleSetting{
    [line stopAllActions];
    [board stopAllActions];
    [board stopAllActions];
    [backMenuBox stopAllActions];
    
    [roof runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    [line runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    [board runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    [backMenuBox runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,100)]];
    //    roof.position = ccp(0,window.height);
    //    backMenuBox.position = ccp(0,window.height);
}
-(void) dealloc{
    [roof release];
    [line release];
    [board release];
    [super dealloc];
}
@end
