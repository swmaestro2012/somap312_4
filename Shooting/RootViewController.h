//
//  RootViewController.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright __MyCompanyName__ 2012년. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface RootViewController : UIViewController  <FBRequestDelegate, FBDialogDelegate, FBSessionDelegate>{
    Facebook *facebook;
    NSArray* _permissions;
}
@property (readonly) Facebook *facebook;
@end
