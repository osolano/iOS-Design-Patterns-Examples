//
//  MultithreadingViewController.m
//  iOSFundamentalConcepts_iPad
//
//  Created by Oliver Solano on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MultithreadingViewController.h"
#import <dispatch/dispatch.h>

@interface MultithreadingViewController ()

@end

@implementation MultithreadingViewController
@synthesize imageViewNormal, imageViewDispatch, imageViewDispatch2, imageViewDispatch3;
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
  //  self.imageViewNormal = [[UIImageView alloc] init];
  //  self.imageViewDispatch = [[UIImageView alloc] init];
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

-(IBAction)selectNormalButton:(id)sender{
    NSURL *networkURL = [NSURL URLWithString:@"http://oliversolano.com/sample_projects/weddingalbum/files/Image_4_H.png"];
    NSData *imageData = [NSData dataWithContentsOfURL:networkURL]; // long time!
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    self.imageViewNormal.image = image;
   
}

-(IBAction)selectDispatchButtonThread11:(id)sender{
    NSURL *networkURL = [NSURL URLWithString:@"http://oliversolano.com/sample_projects/weddingalbum/files/Image_4_H.png"];
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("image loader", NULL);
    dispatch_async(downloadQueue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:networkURL]; // long time!
        dispatch_async(dispatch_get_main_queue(), ^ {
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageViewDispatch.image = image;
        });
    });
    dispatch_release(downloadQueue);
    

    
}

-(IBAction)selectDispatchButtonThread1:(id)sender{
    NSURL *networkURL = [NSURL URLWithString:@"http://oliversolano.com/sample_projects/weddingalbum/files/Image_10_P.png"];
    //Although this is on the same labeled queue, it is still creates a new thread to download the data. This is no different than adding a thread on a different labeled queue.
    dispatch_queue_t downloadQueue = dispatch_queue_create("image loader", NULL);
    dispatch_async(downloadQueue, ^{
        NSData *imageData1 = [NSData dataWithContentsOfURL:networkURL]; // long time!
        dispatch_async(dispatch_get_main_queue(), ^ {
            UIImage *image1 = [UIImage imageWithData:imageData1];
            self.imageViewDispatch3.image = image1;
        });
    });
    dispatch_release(downloadQueue);

}

-(IBAction)selectDispatchButtonThread2:(id)sender{
    NSURL *networkURL = [NSURL URLWithString:@"http://oliversolano.com/sample_projects/weddingalbum/files/Image_4_H.png"];
    
    dispatch_queue_t downloadQueue2 = dispatch_queue_create("image loader2", NULL);
    dispatch_async(downloadQueue2, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:networkURL]; // long time!
        dispatch_async(dispatch_get_main_queue(), ^ {
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageViewDispatch2.image = image;
        });
    });
    dispatch_release(downloadQueue2);
}

-(IBAction)selectDispatchButtonRunAllOnThread1:(id)sender{
    NSURL *networkURL = [NSURL URLWithString:@"http://oliversolano.com/sample_projects/weddingalbum/files/Image_4_H.png"];
    dispatch_queue_t downloadQueueAll = dispatch_queue_create("image load all", NULL);
    dispatch_async(downloadQueueAll, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:networkURL]; // long time!
        NSData *imageData2 = [NSData dataWithContentsOfURL:networkURL]; // long time!
        NSData *imageData3 = [NSData dataWithContentsOfURL:networkURL]; // long time!
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageViewDispatch.image = image;
            UIImage *image2 = [UIImage imageWithData:imageData2];
            self.imageViewDispatch2.image = image2;
            UIImage *image3 = [UIImage imageWithData:imageData3];
            self.imageViewDispatch3.image = image3;
        });
    });
    dispatch_release(downloadQueueAll);
}


-(IBAction)reset:(id)sender{
    
    self.imageViewDispatch.image = nil;
    self.imageViewNormal.image = nil;
    self.imageViewDispatch2.image = nil;
    self.imageViewDispatch3.image = nil;
   // [self.imageViewNormal removeFromSuperview];
   // [self.imageViewDispatch removeFromSuperview];
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

///Add methods that use NSOperations

@end
