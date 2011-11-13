//
//  WanderlustAppDelegate.h
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GridViewController;

@interface WanderlustAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GridViewController *viewController;

@end
