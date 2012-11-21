//
//  Cloud.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Cloud.h"
#define MAXCLOUD 9

@implementation Cloud
-(id) init{
    if(self = [super init]){
        for(int i = 0 ; i < MAXCLOUD ; i++)
            [self createCloud:i];
    }
    return self;
}
-(void) createCloud:(int)i{
    cloud[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"deco%d.png",i+1]];
    int x = 320 + arc4random()%1000;
    int y = arc4random()%(int)(480-cloud[i].contentSize.height);
    cloud[i].anchorPoint = CGPointZero;
    cloud[i].position = ccp(x,y );
    cloud[i].tag = i;
    x *= -1;
    x -= cloud[i].contentSize.width;
    float delay = (x*-1) / 105.0;
    [cloud[i] runAction:[CCSequence actions:[CCMoveBy actionWithDuration:delay position:ccp(x,0)],[CCDelayTime actionWithDuration:1],[CCCallFuncN actionWithTarget:self selector:@selector(removeCloud:)] , nil]];
    [self addChild:cloud[i]];
    cloud[i].opacity = 180;
}
-(void) removeCloud:(id)sender{
    CCSprite *receive = sender;
    int i = receive.tag;
    [self removeChild:cloud[i] cleanup:YES];
    [self createCloud:i];
}
-(void) dealloc{
    NSLog(@"Cloud release");
    [super dealloc];
}
@end
