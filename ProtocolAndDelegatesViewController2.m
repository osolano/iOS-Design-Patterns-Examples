//
//  ProtocolAndDelegatesViewController2.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProtocolAndDelegatesViewController2.h"

@interface ProtocolAndDelegatesViewController2 ()

@end

@implementation ProtocolAndDelegatesViewController2
@synthesize delegate;
@synthesize textField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


-(IBAction)selectDismissModalViewControllerButton:(id)sender{
    [delegate dismissController];
}
-(IBAction)selectToggleSwitchButton:(id)sender{
 //   [self toggleSwitch];
    [delegate toggleSwitch];
}
-(IBAction)selectSaveButton:(id)sender{
    [delegate saveText:textField.text];
}

@end
