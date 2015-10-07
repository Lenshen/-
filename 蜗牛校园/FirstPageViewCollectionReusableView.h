//
//  FirstPageViewCollectionReusableView.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/12.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstPageViewCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic)NSTimer *myTimer;
@property (nonatomic)int i;
-(void)setScrollviewContentSize;
@end
