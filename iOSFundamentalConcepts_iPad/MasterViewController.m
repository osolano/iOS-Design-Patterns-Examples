//
//  MasterViewController.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "ProtocolsAndDelegatesViewController.h"
#import "PolymorphismViewController.h"
#import "SingletonViewController.h"
#import "TargetSelectionViewController.h"
#import "NotificationCenterViewController.h"
#import "ProtectedPublicPrivateViewController.h"
#import "MultithreadingViewController.h"
#import "DataStructuresViewController.h"



@implementation MasterViewController

@synthesize splitViewController;
@synthesize popoverController, rootPopoverButtonItem;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {

[super viewDidLoad];
// Set the content size for the popover: there are just two rows in the table view, so set to rowHeight*2.
self.contentSizeForViewInPopover = CGSizeMake(310.0, self.tableView.rowHeight*2.0);
}

-(void) viewDidUnload {
[super viewDidUnload];
}

#pragma mark -
#pragma mark Rotation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
return YES;
}


- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {

// Keep references to the popover controller and the popover button, and tell the detail view controller to show the button.
barButtonItem.title = @"Master View Controller";
self.popoverController = pc;
self.rootPopoverButtonItem = barButtonItem;
UIViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
[detailViewController showRootPopoverButtonItem:rootPopoverButtonItem];
}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {

// Nil out references to the popover controller and the popover button, and tell the detail view controller to hide the button.
UIViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
[detailViewController invalidateRootPopoverButtonItem:rootPopoverButtonItem];
self.popoverController = nil;
self.rootPopoverButtonItem = nil;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {

// Two sections, one for each detail view controller.
return 9;
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

static NSString *CellIdentifier = @"MasterViewControllerCellIdentifier";

// Dequeue or create a cell of the appropriate type.
UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]; 
}

// Set appropriate labels for the cells.
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Detail View Controller";
            break;
        case 1:
            cell.textLabel.text = @"Protocols and Delegates";
            break;
        case 2:
            cell.textLabel.text = @"Polymorphism";
            break;
        case 3:
            cell.textLabel.text = @"Singleton";
            break;
        case 4:
            cell.textLabel.text = @"Target Selection";
            break;
        case 5:
            cell.textLabel.text = @"Protected, Public, Private Instances";
            break;
        case 6:
            cell.textLabel.text = @"Notification Center";
            break;
        case 7:
            cell.textLabel.text = @"MultiThreading";
            break;
        case 8:
            cell.textLabel.text = @"DataStructures";
            break;
        default:
            break;
    }

return cell;
}


#pragma mark -
#pragma mark Table view selection

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

/*
 Create and configure a new detail view controller appropriate for the selection.
 */
NSUInteger row = indexPath.row;

UIViewController <SubstitutableDetailViewController> *detailViewController = nil;
 //   UINavigationController *navigationController;
    
if (row == 0) {
    DetailViewController *newDetailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailViewController = newDetailViewController;
}

if (row == 1) {
    ProtocolsAndDelegatesViewController *newDetailViewController = [[ProtocolsAndDelegatesViewController alloc] initWithNibName:@"ProtocolsAndDelegatesViewController" bundle:nil];
    detailViewController = newDetailViewController;
}
    if (row == 2) {
        PolymorphismViewController *newDetailViewController = [[PolymorphismViewController alloc] initWithNibName:@"PolymorphismViewController" bundle:nil];
        detailViewController = newDetailViewController;
    }
    if (row == 3) {
        SingletonViewController *newDetailViewController = [[SingletonViewController alloc] initWithNibName:@"SingletonViewController" bundle:nil];
        detailViewController = newDetailViewController;
    }
    if (row == 4) {
        TargetSelectionViewController *newDetailViewController = [[TargetSelectionViewController alloc] initWithNibName:@"TargetSelectionViewController" bundle:nil];
        detailViewController = newDetailViewController;
    }
  
    if (row == 5) {
        ProtectedPublicPrivateViewController *newDetailViewController = [[ProtectedPublicPrivateViewController alloc] initWithNibName:@"ProtectedPublicPrivateViewController" bundle:nil];
        detailViewController = newDetailViewController;
    }
    if (row == 6) {
        NotificationCenterViewController *newDetailViewController = [[NotificationCenterViewController alloc] initWithNibName:@"NotificationCenterViewController" bundle:nil];
        detailViewController = newDetailViewController;
    }
    if (row == 7) {
        MultithreadingViewController *newDetailViewController = [[MultithreadingViewController alloc] initWithNibName:@"MultithreadingViewController" bundle:nil];
        detailViewController = newDetailViewController;
    }
    if (row == 8) {
        DataStructuresViewController *newDetailViewController = [[DataStructuresViewController alloc] initWithNibName:@"DataStructuresViewController" bundle:nil];
        detailViewController = newDetailViewController;
    }
    
 // Update the split view controller's view controllers array.
NSArray *viewControllers = [[NSArray alloc] initWithObjects:self.navigationController, detailViewController, nil];
splitViewController.viewControllers = viewControllers;

// Dismiss the popover if it's present.
if (popoverController != nil) {
    [popoverController dismissPopoverAnimated:YES];
}

// Configure the new view controller's popover button (after the view has been displayed and its toolbar/navigation bar has been created).
if (rootPopoverButtonItem != nil) {
    [detailViewController showRootPopoverButtonItem:self.rootPopoverButtonItem];
}

}


@end
