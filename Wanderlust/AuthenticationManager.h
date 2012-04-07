//
//  AuthenticationManager.h
//  Wanderlust
//
//  Created by Gene Hallman on 1/10/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"
#import <RestKit/RestKit.h>
#import "LoginViewController.h"

@interface AuthenticationManager : NSObject <RKRequestDelegate, FBSessionDelegate, FBRequestDelegate> {
    Facebook* facebook;
    LoginViewController *loginViewController;
    id loginTarget;
    SEL loginCallback;
}

@property (nonatomic, retain) Facebook* facebook;

+ (AuthenticationManager*)sharedAuthenticationManager;

- (void) initialize;
- (void)fbDidLogin;
- (void)fbDidLogout;
- (Boolean)isLoggedIn;
- (void)showLogin;
- (void)showLogin:(SEL)callback withTarget:(id)target;
- (void)hideLogin;
- (NSString*)getToken;
- (void)doLoginWithEmail:(NSString*)email andPassword:(NSString*)password;
- (void)doLoginWithFacebook;
- (void)doLogout;

@end
