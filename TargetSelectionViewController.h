//
//  TargetSelectionViewController.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface TargetSelectionViewController : UIViewController<SubstitutableDetailViewController>{
    UIToolbar *toolbar;
}

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;

@end
