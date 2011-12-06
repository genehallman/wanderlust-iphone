//
//  User.h
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject {
    NSString *name;
    NSString *image_url;
    NSInteger *compatibility;
    NSArray *languages;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *image_url;
@property (nonatomic) NSInteger *compatibility;
@property (nonatomic, retain) NSArray *languages;


+ (NSArray*)loadUsers;

@end
