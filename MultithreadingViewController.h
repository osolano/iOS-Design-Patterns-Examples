//
//  MultithreadingViewController.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface MultithreadingViewController : UIViewController<SubstitutableDetailViewController> {

    UIToolbar *toolbar;

    UIImageView *imageViewNormal;
    UIImageView *imageViewDispatch;
    UIImageView *imageViewDispatch2;
    UIImageView *imageViewDispatch3;
}

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;

@property (nonatomic, strong) IBOutlet UIImageView *imageViewNormal;
@property (nonatomic, strong) IBOutlet UIImageView *imageViewDispatch;
@property (nonatomic, strong) IBOutlet UIImageView *imageViewDispatch2;
@property (nonatomic, strong) IBOutlet UIImageView *imageViewDispatch3;

-(IBAction)selectNormalButton:(id)sender;
-(IBAction)selectDispatchButtonThread11:(id)sender;
-(IBAction)selectDispatchButtonThread1:(id)sender;
-(IBAction)selectDispatchButtonThread2:(id)sender;
-(IBAction)selectDispatchButtonRunAllOnThread1:(id)sender;


-(IBAction)reset:(id)sender;

@end
