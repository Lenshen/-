//
//  TribeCollectionReusableView.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/15.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "tribeModel.h"
#import "TribeDetailsViewController.h"

@interface TribeCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UISegmentedControl *tribeReusableViewSegment;
@property (weak, nonatomic) IBOutlet UIImageView *tribeImage;
@property (strong, nonatomic)tribeModel *tribeModel;
@property (weak, nonatomic) IBOutlet UILabel *tribeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tribeSignLabel;
@property (strong, nonatomic) TribeDetailsViewController *tribeDetailsViewController;
-(void)willAppear;
-(void)controlPressed:(UISegmentedControl *)sender;
@end
