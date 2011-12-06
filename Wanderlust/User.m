//
//  User.m
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name;
@synthesize image_url;
@synthesize compatibility;
@synthesize languages;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (NSArray*)loadUsers {
    NSMutableArray *users = [NSMutableArray arrayWithCapacity:10];
    return users;
}

@end
