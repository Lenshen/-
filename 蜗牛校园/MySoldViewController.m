//
//  MySoldViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/29.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "MySoldViewController.h"
#import "MySoldCollectionViewCell.h"

@interface MySoldViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation MySoldViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MySoldCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mySoldCell" forIndexPath:indexPath];
    
    return cell;
    
}
- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
