//
//  MySingleton.h
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject{
    NSInteger num;
}

@property (nonatomic) NSInteger num;

+(MySingleton*)sharedMySingleton;
-(void)test;
@end
