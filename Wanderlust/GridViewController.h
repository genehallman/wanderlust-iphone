//
//  GridViewController.h
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "WanderlustAppDelegate.h"
#import "UserQuery.h"
#import "MessageViewController.h"

@interface GridViewController : UIViewController <RKObjectLoaderDelegate, UITabBarDelegate> {
    UserQuery *query;
    MessageViewController *messageViewController;
    NSMutableArray *userControllers;
}

@property (nonatomic, retain) IBOutlet UITabBar *tabBar;
@property (nonatomic, retain) IBOutlet UIView *container;
@property (nonatomic, retain) MessageViewController *messageViewController;

- (IBAction)doLogout:(id)sender;
- (IBAction)doRefresh:(id)sender;
- (void)refreshView;

@end
