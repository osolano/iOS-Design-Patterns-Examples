//
//  DataStructuresViewController.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface DataStructuresViewController : UIViewController<SubstitutableDetailViewController>{
    UIToolbar *toolbar;
}

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
-(IBAction)selectFunctionButton:(id)sender;


enum countries {Japan,US,China,Italy,France,Colorado,ukraine};
@end
