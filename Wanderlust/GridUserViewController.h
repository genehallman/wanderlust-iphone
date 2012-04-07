//
//  GridUserViewController.h
//  Wanderlust
//
//  Created by Gene Hallman on 1/17/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface GridUserViewController : UIViewController {
    User *user;
}

@property (nonatomic, retain) IBOutlet UIImageView *profilePic;
@property (nonatomic, retain) IBOutlet UIImageView *friendFlag;
@property (nonatomic, retain) IBOutlet UIImageView *language1;
@property (nonatomic, retain) IBOutlet UIImageView *language2;
@property (nonatomic, retain) IBOutlet UIImageView *language3;

- (void)setUser:(User*)localUser;

@end
