//
//  UserQuery.m
//  Wanderlust
//
//  Created by Gene Hallman on 1/16/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import "UserQuery.h"

@implementation UserQuery

@synthesize maxDistance;
@synthesize maxAge;
@synthesize minAge;
@synthesize hometown;
@synthesize location;
@synthesize school;
@synthesize job;
@synthesize languages;
@synthesize token;
@synthesize near;

- (NSString*)toQueryString {
    NSString* query = [NSString stringWithFormat:@"token=%@&near=%s", token, near?"true":"false"];
    if (maxDistance) {
        query = [NSString stringWithFormat:@"%@&max_distance=%d", query, maxDistance];
    }
    if (maxAge) {
        query = [NSString stringWithFormat:@"%@&max_age=%d", query, maxAge];
    }
    if (minAge) {
        query = [NSString stringWithFormat:@"%@&min_age=%d", query, minAge];
    }
    if (hometown) {
        query = [NSString stringWithFormat:@"%@&hometown=1", query];
    }
    if (location) {
        query = [NSString stringWithFormat:@"%@&location=1", query];
    }
    if (school) {
        query = [NSString stringWithFormat:@"%@&school=1", query];
    }
    if (job) {
        query = [NSString stringWithFormat:@"%@&job=1", query];
    }
    if (languages) {
        query = [NSString stringWithFormat:@"%@&languages=%@", query, languages];
    }
    return query;
}

@end
