//
//  FirstPageViewCollectionReusableView.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/12.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "FirstPageViewCollectionReusableView.h"
#import "FirstPageViewController.h"

@implementation FirstPageViewCollectionReusableView

-(void)setScrollviewContentSize

{
    
     FirstPageViewController *controller = [[FirstPageViewController alloc]init];
    CGSize size = controller.view.frame.size;
    
        self.scrollView.pagingEnabled = YES;
        self.scrollView.scrollEnabled = YES;
        self.scrollView.contentSize = CGSizeMake(size.width*3, size.height);

//   self.myTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(scrollViewTime) userInfo:nil repeats:YES];
//    self.i = 0;
  
}
-(void)scrollViewTime
{
    
    self.i++;
    if (self.i>=3) {
        self.i=0;
    }
    [self.scrollView scrollRectToVisible:CGRectMake(self.i * 320.0, 0, 320.0, self.scrollView.frame.size.height) animated:YES];
}


@end
