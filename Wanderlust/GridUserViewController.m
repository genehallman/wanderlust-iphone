//
//  GridUserViewController.m
//  Wanderlust
//
//  Created by Gene Hallman on 1/17/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import "GridUserViewController.h"

@implementation GridUserViewController

@synthesize profilePic;
@synthesize friendFlag;
@synthesize language1;
@synthesize language2;
@synthesize language3;

- (void)setUser:(User*)localUser {
    user = localUser;
    NSLog(@"got here!!!!");
    // set up all the view mappings
    if (user.imageUrl) {
        NSURL *url = [NSURL URLWithString:user.imageUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        profilePic.image = img;
    }
    
    //NSDictionary* languages = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Languages"];
    
    language1.image = [UIImage imageNamed:@"ara.png"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
