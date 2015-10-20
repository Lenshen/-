//
//  TribeDetailsViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/15.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "TribeDetailsViewController.h"
#import "TribeCollectionReusableView.h"
#import "tribeDetailCollectionViewCell.h"
#import "tribeModel.h"

@interface TribeDetailsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)TribeCollectionReusableView  *tribeReusableView;
@property (nonatomic, strong)NSArray *imagaArray;


@end

@implementation TribeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tribeCollectionView.scrollEnabled =  NO;
    self.string = @"ai";
    
    self.imagaArray = [NSArray arrayWithObjects:@"兴趣01",@"兴趣02",nil];

    
}
-(UIViewController *)initWithStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TribeDetailsViewController *td = [storyboard instantiateViewControllerWithIdentifier:@"TribeDetailsViewController"];
    td.tribeCollectionView.scrollEnabled = NO;
    return td;

}
- (IBAction)black:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    tribeDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];

    [cell.useheaderimage setBackgroundImage:savedImage forState:UIControlStateNormal] ;
    [cell setScrollViewContentSize];
    return cell;
    
}
#pragma mark - 注册collection头部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    self.tribeReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"tribeDetailReuseable"
                                                                                          forIndexPath:indexPath];
    tribeModel *model = [[tribeModel alloc]initWithArray];
    self.tribeReusableView.tribeImage.image = model.tribeImageArray[
    self.index];
    self.tribeReusableView.tribeNameLabel.text = model.tribeNameArray[self.index];
    self.tribeReusableView.tribeSignLabel.text = model.tribeSignArray[self.index];
    [self.tribeReusableView willAppear];
    return self.tribeReusableView;
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
