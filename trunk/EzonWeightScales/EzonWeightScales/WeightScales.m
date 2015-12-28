//
//  WeightScales.m
//  EzonWeightScales
//
//  Created by apple on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WeightScales.h"
#import <QuartzCore/QuartzCore.h>
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180) 


@interface WeightScales ()

@end

@implementation WeightScales

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    //创建秤视图层
    tachLayer = [CALayer layer];
    tachLayer.bounds = CGRectMake(0,0,300,300);
    tachLayer.position = CGPointMake(160, 160);
    tachLayer.contents = (id)[UIImage imageNamed:@"speed.png"].CGImage;
	[self.view.layer addSublayer:tachLayer];
    
    //创建指针视图层
    pinLayer = [CALayer layer];
    pinLayer.bounds = CGRectMake(0, 0, 72, 54);
    pinLayer.contents = (id)[UIImage imageNamed:@"pin.png"].CGImage;
	pinLayer.position = CGPointMake(150, 150);
	pinLayer.anchorPoint = CGPointMake(1.0, 1.0);
    // Rotate to the left 50 degrees so it lines up with the 0 position on the gauge
	pinLayer.transform = CATransform3DRotate(pinLayer.transform, DEGREES_TO_RADIANS(-50), 0, 0, 1);
	[tachLayer addSublayer:pinLayer];

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)refresh{
}

@end
