//
//  DetailViewController.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
// Test Commit 3

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface DetailViewController : UIViewController<SubstitutableDetailViewController>
{
    UIToolbar *toolbar;
}

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;

-(IBAction)selectCreateDetailViewController:(id)sender;
-(IBAction)selectCallSingleton:(id)sender;

@end
