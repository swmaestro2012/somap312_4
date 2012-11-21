//
//  gameBackgroundLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "BackgroundLayer.h"
#import "GameActionLayer.h"
@implementation BackgroundLayer
-(id) init{
    if(self = [super init]){
        cloud = [[Cloud alloc]init];
    }
    return self;
}
-(void) menuScene{
    NSLog(@"menu bg");
    CCSprite *sky = [CCSprite spriteWithFile:@"menuBackground.png"];
    sky.anchorPoint = CGPointZero;
    [self addChild:sky];
}
-(void) settingBackground:(int)type{
    open = [CCSprite spriteWithFile:[NSString stringWithFormat:@"open%d.png",type]];
    open.anchorPoint = ccp(0,0);
    open.position = ccp(0,0);
    
    move1 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"move%d.png",type]];
    move1.anchorPoint = ccp(0,0);
    move1.position = ccp(open.position.x + open.contentSize.width,0);
    move2 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"move%d.png",type]];
    move2.anchorPoint = ccp(0,0);
    move2.position = ccp(move1.position.x + move1.contentSize.width,0);
    
    [open.texture setAntiAliasTexParameters];
    [move1.texture setAntiAliasTexParameters];
    [move2.texture setAntiAliasTexParameters];

    
    [self addChild:open];
    [self addChild:move1];
    [self addChild:move2];
    [self schedule:@selector(moveBackground)];
}
-(void) moveBackground{
    if(open.position.x < open.contentSize.width * -1 ){
        move1.position = ccp(move1.position.x - 2,0);
        move2.position = ccp(move2.position.x - 2,0);
        if(move1.position.x <= move1.contentSize.width * -1){
            move1.position = ccp(move2.position.x + move2.contentSize.width,0);
        }
        if(move2.position.x <= move2.contentSize.width * -1){
            move2.position = ccp(move1.position.x + move1.contentSize.width,0);
        }
        if(isStart == NO){
            isStart = YES;
            [gameActionLayer startGame];
        }
    }else{
        open.position = ccp(open.position.x - 2,0);
        move1.position = ccp(move1.position.x - 2,0);
        move2.position = ccp(move2.position.x - 2,0);
    }
}
-(void) gameScene:(GameActionLayer*)layer{
    NSLog(@"game bg");
    gameActionLayer = layer;
    [self settingBackground:1];
    [self addChild:cloud];
}
-(void) dealloc{
    NSLog(@"BackgroundLayer release");
    [cloud release];
    [super dealloc];
}
@end
