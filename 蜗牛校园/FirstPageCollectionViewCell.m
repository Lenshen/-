//
//  FirstPageCollectionViewCell.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/12.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "FirstPageCollectionViewCell.h"
#import "FirstPageViewController.h"

@implementation FirstPageCollectionViewCell
-(void)setScrollViewContentSize
{
//    CGSize size = controller.view.frame.size;
    FirstPageViewController *controller = [[FirstPageViewController alloc]init];
    self.FirstPageSmallScrollView.pagingEnabled = NO;
    self.FirstPageSmallScrollView.scrollEnabled = YES;
    self.FirstPageSmallScrollView.showsHorizontalScrollIndicator = YES;
    self.FirstPageSmallScrollView.showsVerticalScrollIndicator = NO;
    self.FirstPageSmallScrollView.contentSize = CGSizeMake(controller.view.frame.size.width*2, self.FirstPageSmallScrollView.frame.size.height);
    
    
}

@end
