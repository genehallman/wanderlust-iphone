//
//  MessageViewController.h
//  Wanderlust
//
//  Created by Gene Hallman on 1/16/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *messages;
}

@property (nonatomic, retain) IBOutlet UITableView *table;
@end
