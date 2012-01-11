//
//  WanderlustAppDelegate.m
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import "WanderlustAppDelegate.h"

#import "GridViewController.h"
#import "LoginViewController.h"
#import "AuthenticationManager.h"
#import <RestKit/RestKit.h>

@implementation WanderlustAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize loginViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window.rootViewController = self.viewController;

    [[AuthenticationManager sharedAuthenticationManager] initialize];
    [RKClient clientWithBaseURL:@"http://wanderlust.herokuapp.com"];
    
    if (![[AuthenticationManager sharedAuthenticationManager] isLoggedIn]) {
        [[AuthenticationManager sharedAuthenticationManager] showLogin];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[AuthenticationManager sharedAuthenticationManager].facebook handleOpenURL:url];
}

- (void)showLogin {
    [self.window addSubview:[self.loginViewController view]];
}

- (void)hideLogin {
    [self.window addSubview:[self.viewController view]];
}


- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
