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
#import "User.h"
#import "UserQuery.h"

@implementation WanderlustAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window.rootViewController = self.viewController;

    [AuthenticationManager sharedAuthenticationManager];
    [self configureRestKit];
        
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)configureRestKit {
    if (![RKClient sharedClient]) {
        [RKClient clientWithBaseURL:@"http://localhost:3000"];
    }
    [RKObjectManager objectManagerWithBaseURL:@"http://localhost:3000"];
    
    RKObjectMapping* userMapping = [RKObjectMapping mappingForClass:[User class]];
    [userMapping mapKeyPath:@"id" toAttribute:@"userId"];
    [userMapping mapKeyPath:@"username" toAttribute:@"username"];
    [userMapping mapKeyPath:@"email" toAttribute:@"email"];
    [userMapping mapKeyPath:@"image_url" toAttribute:@"imageUrl"];
    [userMapping mapKeyPath:@"distance" toAttribute:@"distance"];
    [userMapping mapKeyPath:@"languages" toAttribute:@"languages"];
    [userMapping mapKeyPath:@"friendUsername" toAttribute:@"friendUsername"];
    [userMapping mapKeyPath:@"friendId" toAttribute:@"friendId"];
    [userMapping mapKeyPath:@"age" toAttribute:@"age"];
    [userMapping mapKeyPath:@"livedCountries" toAttribute:@"livedCountries"];
    [userMapping mapKeyPath:@"hometown" toAttribute:@"hometown"];
    [userMapping mapKeyPath:@"schools" toAttribute:@"schools"];
    [userMapping mapKeyPath:@"jobs" toAttribute:@"jobs"];
    [userMapping mapKeyPath:@"story" toAttribute:@"story"];
    [userMapping mapKeyPath:@"wantTo" toAttribute:@"wantTo"];    
    
    [[RKObjectManager sharedManager].mappingProvider addObjectMapping:userMapping];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[AuthenticationManager sharedAuthenticationManager].facebook handleOpenURL:url];
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
