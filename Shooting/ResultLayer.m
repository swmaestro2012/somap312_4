//
//  ResultLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 19..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "ResultLayer.h"
#import "UserInfo.h"
@implementation ResultLayer
-(void) createMenuItem{
    resultBackground = [[CCSprite alloc] initWithFile:@"result.png"];
    resultBackground.anchorPoint = ccp(0,0);
    resultBackground.position = ccp(0,window.height);
    
    [self addChild:resultBackground];
    
    NSNumberFormatter *frmtr = [[NSNumberFormatter alloc] init];
    [frmtr setGroupingSize:3];
    [frmtr setGroupingSeparator:@","];
    [frmtr setUsesGroupingSeparator:YES];
    score = [CCLabelBMFont labelWithString:[frmtr stringFromNumber:[NSNumber numberWithInt:[UserInfo sharedUserInfo].point]] fntFile:@"pointFont.fnt"];
    coin = [CCLabelBMFont labelWithString:[frmtr stringFromNumber:[NSNumber numberWithInt:[UserInfo sharedUserInfo].money]] fntFile:@"pointFont.fnt"];
    [frmtr release];
  
    score.anchorPoint = ccp(0,0);
    score.position = ccp(190,268);
    score.visible = NO;
    
    coin.anchorPoint = ccp(0,0);
    coin.position = ccp(190,228);
    coin.visible = NO;
    
    [self addChild:score];
    [self addChild:coin];
}
-(void) selectItem:(CCMenuItem*)item{
    switch (item.tag) {
    }
}
-(void) createRoof{
    roof = [[CCSprite alloc]initWithFile:@"roof_result.png"];
    roof.anchorPoint = ccp(0,0);
    roof.position = ccp(0,window.height);
    [self addChild:roof];
}
-(void) visibleSetting:(MenuLayer*)layer{
    [roof stopAllActions];
    [backMenuBox stopAllActions];
    [line stopAllActions];
    [board stopAllActions];
    
    menuLayer = layer;
    
    roof.position = ccp(0,window.height - roof.contentSize.height);
    backMenuBox.position = ccp(0,window.height - backMenuBox.contentSize.height);
    line.position = ccp(0,window.height - line.contentSize.height);
    board.position = ccp(0,114);
    resultBackground.position = ccp(0,window.height-resultBackground.contentSize.height);
    score.visible = YES;
    coin.visible = YES;

}
-(void) invisibleSetting{
    [line stopAllActions];
    [board stopAllActions];
    [board stopAllActions];
    [backMenuBox stopAllActions];
    score.visible = NO;
    coin.visible = NO;
    [roof runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    [line runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    [board runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    [backMenuBox runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,100)]];
    [resultBackground runAction:[CCMoveTo actionWithDuration:0.5 position:ccp(0,window.height)]];
    //    roof.position = ccp(0,window.height);
    //    backMenuBox.position = ccp(0,window.height);
}
@end
