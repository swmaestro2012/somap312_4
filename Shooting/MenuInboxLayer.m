//
//  MenuInboxLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 19..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuInboxLayer.h"


@implementation MenuInboxLayer
-(void) createRoof{
    roof = [[CCSprite alloc]initWithFile:@"roof_inbox.png"];
    roof.anchorPoint = ccp(0,0);
    roof.position = ccp(0,window.height);
    [self addChild:roof];
}
@end
