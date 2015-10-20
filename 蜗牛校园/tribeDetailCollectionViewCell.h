//
//  tribeDetailCollectionViewCell.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/16.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tribeDetailCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *tribeIssueScrollView;
@property (weak, nonatomic) IBOutlet  UIButton *useheaderimage;

-(void)setScrollViewContentSize;
@end
