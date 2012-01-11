//
//  WanderlustAppDelegate.h
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@class LoginViewController;

@interface WanderlustAppDelegate : NSObject <UIApplicationDelegate> {
    UIViewController *loginViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;
@property (nonatomic, retain) IBOutlet UIViewController *loginViewController;

- (void)showLogin;
- (void)hideLogin;

@end
