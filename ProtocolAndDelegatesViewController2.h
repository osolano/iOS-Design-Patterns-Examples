//
//  ProtocolAndDelegatesViewController2.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProtocolControllerDelegate <NSObject>

-(void)dismissController;
-(void)toggleSwitch;
-(void)saveText:(NSString *)savedText;

@end

@interface ProtocolAndDelegatesViewController2 : UIViewController{
    id <ProtocolControllerDelegate> delegate;
    UITextField *textField;
}

@property (nonatomic, strong) id <ProtocolControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITextField *textField;

-(IBAction)selectDismissModalViewControllerButton:(id)sender;
-(IBAction)selectToggleSwitchButton:(id)sender;
-(IBAction)selectSaveButton:(id)sender;
@end
