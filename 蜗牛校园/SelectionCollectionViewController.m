//
//  SelectionCollectionViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/11.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "SelectionCollectionViewController.h"
#import "SearchCollectionReusableView.h"
@interface SelectionCollectionViewController ()
@property (nonatomic , strong)SearchCollectionReusableView *reusableView;

@end

@implementation SelectionCollectionViewController
- (IBAction)black:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (!self.reusableView) {
        self.reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReuseableView"
                                                                      forIndexPath:indexPath];
    }
    
    if (indexPath.row == 0) {
        [self.reusableView searchBarHide];

    }

    return  self.reusableView;
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
