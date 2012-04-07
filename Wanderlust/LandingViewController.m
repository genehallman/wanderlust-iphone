//
//  LandingViewController.m
//  Wanderlust
//
//  Created by Gene Hallman on 1/12/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import "LandingViewController.h"

@implementation LandingViewController

@synthesize nav;

- (void)viewDidLoad
{    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hideLanding) userInfo:nil repeats:NO];
    [super viewDidLoad];
}

- (void)hideLanding
{
    UIWindow *window = [[self view] window];
    [window insertSubview:[nav view] belowSubview:[[window subviews] lastObject]];
    [[self view] removeFromSuperview];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
