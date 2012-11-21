//
//  gameMenuLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameMenuLayer.h"

@implementation GameMenuLayer
-(id) init{
    if( self = [super init]){
        info = [UserInfo sharedUserInfo];
        /*
        piece = 160;
        float width = 320/(int)piece;
        hpBatch = [[CCSpriteBatchNode alloc]initWithFile:@"hpBar.png" capacity:(int)piece];
        [self addChild:hpBatch];
        
        for(int i = 0 ; i < (int)piece ; i++){
            CCSprite* gauge = [CCSprite spriteWithTexture:hpBatch.texture rect:CGRectMake(width*i, 0, width, 30)];
            gauge.anchorPoint = CGPointZero;
            gauge.position = ccp(width * i,0);
            [hpBatch addChild:gauge z:0 tag:i];
        }*/
        
        coin = [[CCSprite alloc]initWithFile:@"coin.png"];
        coin.anchorPoint = ccp(0,0);
        coin.position = ccp(10, [CCDirector sharedDirector].winSize.height - coin.contentSize.height - 10);
        [self addChild:coin];
        
        heart = [[CCSprite alloc]initWithFile:@"heart.png"];
        heart.anchorPoint = ccp(0,0);
        heart.position = ccp(320-10-heart.contentSize.width,coin.position.y);
        [self addChild:heart];
        
        coinLabel = [CCLabelBMFont labelWithString:@"0" fntFile:@"coinFont.fnt"];
        coinLabel.anchorPoint = ccp(0,0);
        coinLabel.position = ccp(coin.position.x + 27 , coin.position.y+1);
        
        pointLabel = [CCLabelBMFont labelWithString:@"0" fntFile:@"coinFont.fnt"];
        pointLabel.anchorPoint = ccp(0.5,0);
        pointLabel.position = ccp(160,coinLabel.position.y);
        
        heartLabel = [CCLabelBMFont labelWithString:@"0" fntFile:@"coinFont.fnt"];
        heartLabel.anchorPoint = ccp(0,0);
        heartLabel.position = ccp(heart.position.x + 63 , heart.position.y+1);
        [self addChild:coinLabel];
        [self addChild:pointLabel];
        [self addChild:heartLabel];
        [self schedule:@selector(fillCombo) interval:0.1];
        [self schedule:@selector(addTime) interval:1];
        [self schedule:@selector(refreshScore)];
    }
    return self;
}
-(void) hpChange{
    /*if(0 < (presentHP - info.hp) && (presentHP - info.hp)){
        NSLog(@"hit");
    }
    presentHP = info.hp;
    float persent = (piece / 100.0) *((float)info.hp/(float)info.originalHP)*100;
    int count = (int)persent;
    for(CCSprite *gauge in [hpBatch children]){
        //NSLog(@"tag  %d   count %d",gauge.tag,count);
        if(gauge.tag < count){
            if(gauge.opacity + 15 < 255)
                gauge.opacity += 15;
        }
        else {
            if(gauge.opacity - 15 > 70)
                gauge.opacity -= 15;
        }
    }*/
    //NSLog(@"%d",info.hp);
}
-(void) fillCombo{
    combo += 1;
    if(combo == 100){
        combo = 0;
    }
}
-(void) addTime{
    ++time;
}
-(void) refreshScore{
    ++info.point;
    [coinLabel setString:[NSString stringWithFormat:@"%d",info.money]];
    [pointLabel setString:[NSString stringWithFormat:@"%d",info.point]];
    [heartLabel setString:[NSString stringWithFormat:@"%d",info.hp]];
    [self hpChange];
}
-(void) dealloc{
    //[hpBatch removeAllChildrenWithCleanup:YES];
    //[hpBatch release];
    [coin release];
    [heart release];
    NSLog(@"GameMenuLayer release");
    [super dealloc];
}
@end
