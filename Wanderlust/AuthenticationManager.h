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

@interface AuthenticationManager : NSObject <RKRequestDelegate, FBSessionDelegate> {
    Facebook* facebook;
}

@property (nonatomic, retain) Facebook* facebook;

+ (AuthenticationManager*)sharedAuthenticationManager;

- (void) initialize;
- (void)fbDidLogin;
- (void)fbDidLogout;
- (Boolean)isLoggedIn;
- (void)showLogin;
- (void)hideLogin;
- (NSString*)getToken;
- (void)doLoginWithEmail:(NSString*)email andPassword:(NSString*)password;
- (void)doLoginWithFacebook;
- (void)doLogout;

@end
