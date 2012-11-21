//
//  MenuInviteLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 19..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuInviteLayer.h"


@implementation MenuInviteLayer
-(void) createRoof{
    roof = [[CCSprite alloc]initWithFile:@"roof_invite.png"];
    roof.anchorPoint = ccp(0,0);
    roof.position = ccp(0,window.height);
    [self addChild:roof];
}
@end
