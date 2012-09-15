//
//  ProtocolsAndDelegatesViewController.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProtocolsAndDelegatesViewController.h"

#import "ProtocolAndDelegatesViewController2.h"

@interface ProtocolsAndDelegatesViewController ()

@end

@implementation ProtocolsAndDelegatesViewController
@synthesize toolbar;
@synthesize switchButton;
@synthesize toggleViewController;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
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

-(IBAction)toggleView:(id)sender{
    self.toggleViewController = [[ProtocolAndDelegatesViewController2 alloc] initWithNibName:@"ProtocolAndDelegatesViewController2" bundle:nil];
    self.toggleViewController.delegate = self;
    [self presentModalViewController:self.toggleViewController animated:YES];
  //  self.toggleViewController
}

#pragma mark - 
#pragma mark ToggleSwitchDelegate

-(void)toggleSwitch{
    if (self.switchButton.on) {
        [self.switchButton setOn:NO animated:YES];
    }
    else {
        [self.switchButton setOn:YES animated:YES];
    }
}

-(void)dismissController{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)saveText:(NSString *)savedText{
    self.textView.text = savedText;
}

@end
