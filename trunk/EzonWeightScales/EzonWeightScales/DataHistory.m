//
//  DataHistory.m
//  EzonWeightScales
//
//  Created by apple on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataHistory.h"
#define kLeftMargin				20.0
#define kTopMargin				15.0
#define kRightMargin			20.0
#define kSegmentedHeight        30.0
#define kTransitionDuration 0.75

@interface DataHistory ()

@end

@implementation DataHistory
@synthesize listViewForHistroy, graphViewForHistory;

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
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"选择范围" style:UIBarButtonItemStylePlain target:self action:@selector(chooseTimeType:)];
    
    //添加nav中间的列表和图形段选择器
    segmentControlTitles = [NSArray arrayWithObjects:@"列表", @"图形", nil]; 
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentControlTitles];
    segmentedControl.frame = CGRectMake(0.0, 0.0, 120, 30);
    segmentedControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segmentedControl;
    [segmentedControl addTarget:self action:@selector(segmentActionForDisplayTypeChoose:) forControlEvents:UIControlEventValueChanged];
    
    segmentControlTitles = [NSArray arrayWithObjects:@"全部",@"周",@"月",nil];
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentControlTitles];
    CGFloat yPlacement = kTopMargin;
    CGRect frame = CGRectMake(kLeftMargin, yPlacement, self.view.bounds.size.width - (kRightMargin * 2.0), kSegmentedHeight);
    segmentedControl.frame = frame;
    [segmentedControl addTarget:self action:@selector(segmentActionForDateTypeChoose:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentedControl];
    //init the tableview for history
    frame = CGRectMake(0, yPlacement+kSegmentedHeight, self.view.bounds.size.width, self.view.bounds.size.height - (yPlacement+kSegmentedHeight));
    self.listViewForHistroy = [[UITableView alloc]initWithFrame:frame];
    [self.view addSubview:self.listViewForHistroy];
    
    //init the view for graph
    self.graphViewForHistory = [[UIView alloc]initWithFrame:frame];
    
    
    
    
    
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
                                              
-(void)chooseTimeType:(id)sender{
}
-(void)segmentActionForDateTypeChoose:(UISegmentedControl *) seg{
}
-(void)segmentActionForDisplayTypeChoose:(UISegmentedControl *) seg{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:kTransitionDuration];
	
	[UIView setAnimationTransition:([self.listViewForHistroy superview] ?
									UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight)
						   forView:self.view cache:YES];
    NSInteger index = seg.selectedSegmentIndex;
    //NSLog(@"%d",index);
    switch (index) {
        case 0:
            if([self.graphViewForHistory superview])
            {
                [self.graphViewForHistory removeFromSuperview];
                [self.view addSubview:self.listViewForHistroy];
            }
            break;
        case 1:
            if ([self.listViewForHistroy superview]) {
                [self.listViewForHistroy removeFromSuperview];
                [self.view addSubview:graphViewForHistory];
            }
            break;
        default:
            break;
    }
    [UIView commitAnimations];

}

@end
