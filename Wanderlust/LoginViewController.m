//
//  LoginViewController.m
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import "LoginViewController.h"
#import "AuthenticationManager.h"

@implementation LoginViewController

@synthesize email;
@synthesize password;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doLogin:(id)sender
{
    [[AuthenticationManager sharedAuthenticationManager] doLoginWithEmail:self.email.text andPassword:self.password.text];
}

- (IBAction)fbConnect:(id)sender
{
    [[AuthenticationManager sharedAuthenticationManager] doLoginWithFacebook];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES; 
}
@end
