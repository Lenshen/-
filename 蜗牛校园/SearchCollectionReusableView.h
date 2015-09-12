//
//  SearchCollectionReusableView.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/11.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCollectionReusableView : UICollectionReusableView
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
- (void)searchBarHide;
@end
