//
//  ResultLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 19..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuItemLayer.h"
@interface ResultLayer : MenuItemLayer {
    CCSprite *resultBackground;
    CCLabelBMFont *score,*coin;
}
@end
