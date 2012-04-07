//
//  UserQuery.h
//  Wanderlust
//
//  Created by Gene Hallman on 1/16/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserQuery : NSObject;

@property (nonatomic) NSInteger maxDistance;
@property (nonatomic) NSInteger maxAge;
@property (nonatomic) NSInteger minAge;
@property (nonatomic, retain) NSString *hometown;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *school;
@property (nonatomic, retain) NSString *job;
@property (nonatomic, retain) NSString *languages;
@property (nonatomic, retain) NSString *token;
@property (nonatomic) bool near;

- (NSString *)toQueryString;

@end
