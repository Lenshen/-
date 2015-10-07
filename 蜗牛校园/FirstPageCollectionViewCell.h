//
//  FirstPageCollectionViewCell.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/12.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FirstPageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *FirstPageSmallScrollView;
-(void)setScrollViewContentSize;

@end
