//
//  GridViewController.m
//  Wanderlust
//
//  Created by Gene Hallman on 11/12/11.
//  Copyright 2011 5th Finger. All rights reserved.
//

#import "GridViewController.h"
#import "AuthenticationManager.h"
#import "User.h"
#import "GridUserViewController.h"

@implementation GridViewController

@synthesize tabBar;
@synthesize messageViewController;
@synthesize container;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [tabBar setSelectedItem:[tabBar.items objectAtIndex:0]];
    query = [[UserQuery alloc] init];
    query.near = TRUE;
    
    messageViewController = [[MessageViewController alloc] initWithNibName:@"MessageView" bundle:[NSBundle mainBundle]];
    
    [self refreshView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doLogout:(id)sender {
    [[AuthenticationManager sharedAuthenticationManager] doLogout];
}

- (IBAction)doRefresh:(id)sender {
    [self refreshView];
}

- (void)tabBar:(UITabBar *)localTabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"tab bar clicked - %d", item.tag);
    if (item.tag < 2) {
        query.near = (item.tag == 0);
        if (query.near) {
            CGRect frame = container.frame;
            frame.origin.y = 81;
            frame.size.height = 335;
            container.frame = frame;
        } else {
            CGRect frame = container.frame;
            frame.origin.y = 49;
            frame.size.height = 367;
            container.frame = frame;            
        }
        [self refreshView];
    } else {
        [tabBar setSelectedItem:[[tabBar items] objectAtIndex:query.near ? 0 : 1]];
        [self.navigationController pushViewController:messageViewController animated:YES];
    }
}

- (void)refreshView {
    
    // check authentication
    if (![[AuthenticationManager sharedAuthenticationManager] isLoggedIn])
    {
        [[AuthenticationManager sharedAuthenticationManager] showLogin:@selector(refreshView) withTarget:self];
        return;
    }

    // remove all user controllers in the current view
    while (userControllers.count > 0) {        
        [((GridUserViewController*)[userControllers lastObject]).view removeFromSuperview];
        [userControllers removeLastObject];
    }
    
    // set up the query to send
    [query setToken:[[AuthenticationManager sharedAuthenticationManager] getToken]];
    [query setMinAge:20];
    [query setMaxAge:30];
    
    NSString* url = [NSString stringWithFormat:@"/users.json?%@", [query toQueryString]];
    
    // send query
    RKObjectMapping* userMapping = [[RKObjectManager sharedManager].mappingProvider objectMappingForClass:[User class]];
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:url objectMapping:userMapping delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    for (int i = 0; i < [objects count]; i++) {
        GridUserViewController *userController = [[GridUserViewController alloc] initWithNibName:@"GridUserView" bundle:[NSBundle mainBundle]];
        [userController becomeFirstResponder];
        [userController setUser:(User*)[objects objectAtIndex:i]];
        [userControllers addObject:userController];
        [container addSubview:[userController view]];
    }
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
    NSLog(@"did fail");
}


@end
