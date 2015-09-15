//
//  FirstPageViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "FirstPageViewController.h"
#import "FirstPageCollectionViewCell.h"
#import "TabBarController.h"
#import "SearchCollectionReusableView.h"
#import "FirstPageViewCollectionReusableView.h"

@interface FirstPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>


@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //他的下个页面底部视图（tabbar）会隐藏



  
   
    
    
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const identify= @"cell";
    FirstPageCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"无法创建，自定义不能进来");
    }
    
    
    [cell setScrollViewContentSize];
   
    return cell ;
    

    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
   
    FirstPageViewCollectionReusableView  *reusableView  = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseableView"
                                                                  forIndexPath:indexPath];
    [reusableView setScrollviewContentSize];
 

    return  reusableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
