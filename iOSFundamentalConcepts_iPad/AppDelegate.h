//
//  AppDelegate.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasterViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    UISplitViewController *splitViewController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (strong, nonatomic) IBOutlet UISplitViewController *splitViewController;

@end
