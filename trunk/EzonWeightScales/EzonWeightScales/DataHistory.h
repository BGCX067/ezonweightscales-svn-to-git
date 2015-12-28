//
//  DataHistory.h
//  EzonWeightScales
//
//  Created by apple on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DataHistory : UIViewController{
    NSArray* segmentControlTitles;
}
@property (nonatomic,strong) UITableView *listViewForHistroy;
@property (nonatomic,strong) UIView *graphViewForHistory;

-(void)chooseTimeType:(id)sender;
-(void)segmentActionForDateTypeChoose:(UISegmentedControl *) seg;
-(void)segmentActionForDisplayTypeChoose:(UISegmentedControl *) seg;
@end
