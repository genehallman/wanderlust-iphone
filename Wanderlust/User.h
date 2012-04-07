//
//  User.h
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface User : NSObject;

@property (nonatomic) NSInteger userId;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic) NSInteger distance;
@property (nonatomic, retain) NSString *languages;
@property (nonatomic, retain) NSString *friendUsername;
@property (nonatomic, retain) NSString *friendId;
@property (nonatomic) NSInteger age;
@property (nonatomic, retain) NSString *livedCountries;
@property (nonatomic, retain) NSString *hometown;
@property (nonatomic, retain) NSString *schools;
@property (nonatomic, retain) NSString *jobs;
@property (nonatomic, retain) NSString *story;
@property (nonatomic, retain) NSString *wantTo;

@end
