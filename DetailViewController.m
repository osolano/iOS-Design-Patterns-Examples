//
//  DetailViewController.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "NavigationDetailViewController.h"
#import "MySingleton.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize toolbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.navigationController = [UINa
     //   self.navigationController = [UINavigationController alloc] ini
    
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)viewDidLoad{
}

#pragma mark -
#pragma mark Managing the popover

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Add the popover button to the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
    [itemsArray insertObject:barButtonItem atIndex:0];
    [toolbar setItems:itemsArray animated:NO];
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Remove the popover button from the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
    [itemsArray removeObject:barButtonItem];
    [toolbar setItems:itemsArray animated:NO];
}

-(IBAction)selectCreateDetailViewController:(id)sender{
    NavigationDetailViewController *detailViewController = [[NavigationDetailViewController alloc] initWithNibName:@"NavigationDetailViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    [self presentModalViewController:navigationController animated:YES];
    [navigationController setNavigationBarHidden:NO animated:YES];
}

-(IBAction)selectCallSingleton:(id)sender{
    //MySingleton *mySingleton = [[MySingleton alloc] init];
    //[mySingleton test];
    MySingleton *mySingleton = [MySingleton sharedMySingleton];
    //id singletonObject = 
    [mySingleton test];
}

@end
