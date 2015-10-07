//
//  tribeDetailCollectionViewCell.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/16.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "tribeDetailCollectionViewCell.h"


@implementation tribeDetailCollectionViewCell
-(void)setScrollViewContentSize
{
    CGSize size = self.tribeIssueScrollView.frame.size;
    
    self.tribeIssueScrollView.pagingEnabled = YES;
    self.tribeIssueScrollView.scrollEnabled = YES;
    self.tribeIssueScrollView.showsHorizontalScrollIndicator = YES;
    self.tribeIssueScrollView.contentSize = CGSizeMake(size.width*2, size.height);
}
@end
