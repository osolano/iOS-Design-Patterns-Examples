//
//  MySingleton.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton
@synthesize num;

static MySingleton* _sharedMySingleton = nil;

+(MySingleton*)sharedMySingleton
{
	@synchronized([MySingleton class])
	{
		if (!_sharedMySingleton)
			[[self alloc] init];
        
		return _sharedMySingleton;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([MySingleton class])
	{
		NSAssert(_sharedMySingleton == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedMySingleton = [super alloc];
		return _sharedMySingleton;
	}
    
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
		// initialize stuff here
	}
    num = 0;
    NSLog(@"Initialize Singleton");
	return self;
}
-(void)test{
    NSLog(@"Hello World");
    num++;
    NSLog(@"num=%i",num);
    
}

+(BOOL)sharedSingletonExists{
    return (nil != _sharedMySingleton);
}

@end
