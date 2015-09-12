//
//  SearchCollectionReusableView.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/11.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "SearchCollectionReusableView.h"

@implementation SearchCollectionReusableView
- (void)searchBarHide
{
   
        for (UIView *view in self.searchBar.subviews)
        {
            if ([view isKindOfClass:NSClassFromString(@"UISeacrchBackground")])
            {
                [view removeFromSuperview];
                break;
            }
            if ([view isKindOfClass:NSClassFromString(@"UIView")]&&view.subviews.count > 0 )
            {
                [[view.subviews objectAtIndex:0]removeFromSuperview];
            }
        }
}



  

   


@end


