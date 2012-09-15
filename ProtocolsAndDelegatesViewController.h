//
//  ProtocolsAndDelegatesViewController.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "ProtocolAndDelegatesViewController2.h"



@interface ProtocolsAndDelegatesViewController : UIViewController<SubstitutableDetailViewController,ProtocolControllerDelegate>{

    ProtocolAndDelegatesViewController2 *toggleViewController;
    UIToolbar *toolbar;
    UISwitch *switchButton;
    UITextView *textView;
}

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) IBOutlet UISwitch *switchButton;
@property (nonatomic, strong) IBOutlet UITextView *textView;

@property (nonatomic, strong) ProtocolAndDelegatesViewController2 *toggleViewController;

-(IBAction)toggleView:(id)sender;
@end
