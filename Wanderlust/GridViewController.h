//
//  GridViewController.h
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WanderlustAppDelegate.h"

@interface GridViewController : UIViewController <FBRequestDelegate> {
    WanderlustAppDelegate *app;
}
- (IBAction)doLogout:(id)sender;
- (void)request:(FBRequest *)request didLoad:(id)result;
- (void)request:(FBRequest *)request didFailWithError:(NSError *)error;

@end
