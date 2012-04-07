//
//  AuthenticationManager.m
//  Wanderlust
//
//  Created by Gene Hallman on 1/10/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import "AuthenticationManager.h"
#import "WanderlustAppDelegate.h"

@implementation AuthenticationManager

@synthesize facebook;

static AuthenticationManager* sharedManager = nil;

+ (AuthenticationManager*)sharedAuthenticationManager
{
    if (sharedManager == nil) {
        sharedManager = [[super allocWithZone:NULL] init];
        [sharedManager initialize];
    }
    return sharedManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self sharedAuthenticationManager] retain];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (oneway void)release
{
}

- (id)autorelease
{
    return self;
}

-(void)initialize
{
    // Setup facebook creds
    facebook = [[Facebook alloc] initWithAppId:@"219219838149802" andDelegate:self];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    
    // setup login view controller and add subview to window
    loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginView" bundle:[NSBundle mainBundle]];
    CGRect frame = loginViewController.view.frame;
    frame.origin.y = 480.0; // Move view down 100 pixels
    loginViewController.view.frame = frame;
    
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:[loginViewController view]];
}

- (void)showLogin {
    [self showLogin:nil withTarget:nil];
}

- (void)showLogin:(SEL)callback withTarget:(id)target {
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    [window bringSubviewToFront:[loginViewController view]];

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];

    CGRect frame = loginViewController.view.frame;
    frame.origin.y = 20.0; // Move view down 100 pixels
    loginViewController.view.frame = frame;

    [UIView commitAnimations];
    
    loginTarget = target;
    loginCallback = callback;
}

- (void)hideLogin {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];

    CGRect frame = loginViewController.view.frame;
    frame.origin.y = 480.0; // Move view down 100 pixels
    loginViewController.view.frame = frame;

    [UIView commitAnimations];
    
    if (loginCallback && loginTarget) {
        [loginTarget performSelector:loginCallback];
        loginTarget = nil;
        loginCallback = nil;
    }
}

- (Boolean)isLoggedIn {
    return [self getToken] != nil;
}

- (NSString*)getToken {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:@"WanderlustToken"];
}

- (void)doLoginWithEmail:(NSString*)email andPassword:(NSString*)password {
    // call out to website
    RKParams* params = [RKParams params];
    [params setValue:email forParam:@"user_session[email]"];
    [params setValue:password forParam:@"user_session[password]"];
    
    // Send it for processing!
    [[RKClient sharedClient] post:@"/user_session.json" params:params delegate:self];
}

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
    if ([response isOK])
    {
        NSString* token = [response bodyAsString];
        NSLog(@"Login Succeeded: %@", token);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:token forKey:@"WanderlustToken"];
        [defaults synchronize];
        [self hideLogin];
    }
    else
    {
        NSLog(@"Login Failed: %@", [response bodyAsString]);
        [self doLogout];
    }
}

- (void)doLoginWithFacebook {
    [facebook authorize:nil];
}

- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    [facebook requestWithGraphPath:@"me" andDelegate:self];
}

- (void)request:(FBRequest *)request didLoad:(id)result
{
    NSLog(@"%@", result);
    RKParams* params = [RKParams params];
    [params setValue:[facebook accessToken] forParam:@"user_session[token]"];
    [params setValue:@"1" forParam:@"user_session[user_id]"];
    
    // Send it for processing!
    [[RKClient sharedClient] post:@"/user_session.json" params:params delegate:self];
}

- (void)fbDidLogout {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"FBAccessTokenKey"];
    [defaults removeObjectForKey:@"FBExpirationDateKey"];
    [defaults synchronize];
}

-(void)doLogout {
    [facebook logout:self];
    [self showLogin];
}

@end
