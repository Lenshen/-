//
//  UserGoodsViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/17.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "UserGoodsViewController.h"
#import "FirstPageCollectionViewCell.h"

@interface UserGoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation UserGoodsViewController
- (IBAction)black:(id)sender {
[self dismissViewControllerAnimated:YES completion:nil] ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
