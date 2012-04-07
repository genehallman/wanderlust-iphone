//
//  MessageViewController.m
//  Wanderlust
//
//  Created by Gene Hallman on 1/16/12.
//  Copyright (c) 2012 5th Finger. All rights reserved.
//

#import "MessageViewController.h"

@implementation MessageViewController

@synthesize table;

- (void)viewWillAppear:(BOOL)animated {
    if (!messages) {
        messages = [[NSMutableArray alloc] init];
        [messages addObject:@"1"];
        [messages addObject:@"2"];
        [messages addObject:@"3"];
        [messages addObject:@"4"];
        [table reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"x";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
    }
    cell.textLabel.text = [messages objectAtIndex:[indexPath row]];
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
