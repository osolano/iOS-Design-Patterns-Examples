//
//  AppDelegate.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize splitViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
    return YES;
}


@end
