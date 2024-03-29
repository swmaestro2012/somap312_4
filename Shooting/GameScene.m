//
//  GameScene.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "GameDebugLayer.h"
#import "MenuScene.h"
#import "SimpleAudioEngine.h"
#import "UserInfo.h"
@implementation GameScene
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];

    // 'layer' is an autorelease object.
    GameScene *layer = [GameScene node];

    // add layer as a child to scene
    [scene addChild: layer];

    // return the scene
    return scene;
}
-(id) init{
    if(self = [super init]){
        if([UserInfo sharedUserInfo].isBgm)
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"gameBackground.mp3" loop:YES];
        bg = [[BackgroundLayer alloc]init];
        [self addChild:bg z:0]; // add background
        
        [UserInfo sharedUserInfo].point = 0;
        [UserInfo sharedUserInfo].money = 0;
        
        gameActionLayer = [[GameActionLayer alloc]init];
        [self addChild:gameActionLayer z:2];
        
        gameMenuLayer = [[GameMenuLayer alloc]init];
        [self addChild:gameMenuLayer z:1];
        
        [bg gameScene:gameActionLayer];
        //GameDebugLayer *debug = [[GameDebugLayer alloc]init];
        //[self addChild:debug];
    }
    //[self performSelector:@selector(t) withObject:nil afterDelay:7];
    return self;
}
-(void)t{
    [[CCDirector sharedDirector]replaceScene:[MenuScene scene]];
}
-(void) dealloc{
    NSLog(@"GameScene release");
    [bg release];
    [gameMenuLayer release];
    [gameActionLayer release];
    [super dealloc];
}
@end
