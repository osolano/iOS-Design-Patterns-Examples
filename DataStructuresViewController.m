//
//  DataStructuresViewController.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataStructuresViewController.h"
#import "IntegerClass.h"

@interface DataStructuresViewController ()

@end

@implementation DataStructuresViewController
@synthesize toolbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(NSArray *)createArray{
  //  NSInteger test = 3;
   // NSNumber *tes2 = [[NSNumber alloc] initWithInt:3];
    NSArray *array = [[NSArray alloc] initWithObjects:@"Japan",@"US",@"China",@"Italy",@"France",@"Colorado",@"ukraine", nil];
   // [array 
    return array;
}

-(NSArray *)createArray2{
    NSNumber *test2 = [[NSNumber alloc] initWithInt:3];
    NSArray *array = [[NSArray alloc] initWithObjects:test2, nil];
    return array;
}

-(NSArray *)createArray3{
   // NSInteger test3 = 4;
    IntegerClass *obj = [[IntegerClass alloc] init];
    obj.holdInt = 3;
    NSArray *array = [[NSArray alloc] initWithObjects:obj, nil];
    return array;
}

-(NSSet *)createSet{
    NSSet *set = [[NSSet alloc] initWithObjects:@"Japan",@"US",@"China",@"Italy",@"France",@"Colorado",@"ukraine", nil];
    return set;
}

-(NSDictionary *)createDictionary{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"Japan",@"Tokyo",@"US",@"DC",@"China",@"Beijing",@"Italy",@"Rome",@"France",@"Paris",@"Colorado",@"Denver",@"ukraine",@"Ukr", nil];
    return dictionary;
}

-(void)testCollections{
    //Enumaration
    for(NSString *string in [self createArray]){
        NSLog(@"Array:%@",string);
    }
    for(NSString *string in [self createSet]){
        NSLog(@"Set:%@",string);
    }
    for(NSString *string in [self createDictionary]){
        NSLog(@"Dictionary:%@",string);
    }
    //Dynamic Enumeration
    for(id objectid in [self createArray]){
        NSLog(@"Array using ID :%@",objectid);
    }
    for(id objectid in [self createSet]){
        NSLog(@"Set using ID :%@",objectid);
    }
    for(id objectid in [self createDictionary]){
        NSLog(@"Dictionary using ID :%@",objectid);
    }
    

    
    //Sorting
    NSArray *sortedArray = [[self createArray] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    for(NSString *string in sortedArray){
        NSLog(@"Array sorted:%@",string);
    }
    
   // [self createArray] sor
  //  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
   // NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
  //  NSArray *sortedArray = [[self createArray] sortedArrayUsingDescriptors:sortDescriptors];
   /*
    for (NSString *string in sortedArray) {
        NSLog(@"Sorted Array:%@",string);
    }
    */
    //Block-Based Enumeration
    //Using NSEnumeration
    
    //Enumerated Values
    NSLog(@"enum = %i, %i, %i",Japan, US, France);
    enum countries Country;
    Country = Japan;
    Country = France;
    NSLog(@"Country %i",Country);
    
    
    for(NSNumber *num in [self createArray2]){
        NSLog(@"%i",[num integerValue]);
    }
    
    for(IntegerClass *obj in [self createArray3]){
        NSLog(@"%i",obj.holdInt);
    }
}

-(IBAction)selectFunctionButton:(id)sender{
    [self testCollections];
}
#pragma mark -
#pragma mark Managing the popover

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Add the popover button to the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
    [itemsArray insertObject:barButtonItem atIndex:0];
    [toolbar setItems:itemsArray animated:NO];
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Remove the popover button from the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
    [itemsArray removeObject:barButtonItem];
    [toolbar setItems:itemsArray animated:NO];
}

@end
