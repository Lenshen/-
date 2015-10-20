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
#import "DOPDropDownMenu.h"

@interface FirstPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,DOPDropDownMenuDelegate,DOPDropDownMenuDataSource>
@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic, strong)DOPDropDownMenu *menu;
@property (nonatomic, strong) NSArray *sorts;

@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //他的下个页面底部视图（tabbar）会隐藏
    self.topView.hidden = YES;
    [self initArray];
    self.menu.hidden = YES;

   
    
   
    
    
}
-(void)initArray
{
    if (!self.classifys)
    {
        self.classifys = @[@"全国",];
        self.cates = @[];
        self.areas = @[@"分类",@"学生用品",@"美妆护肤",@"服饰鞋帽",@"数码电子",@"运动户外",@"宿舍生活",@"其他二手"];
        self.sorts = @[@"排序",@"默认排序",@"认证用户",@"最新发布",@"价格最低",@"价格最高"];
    }
 
}
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.classifys.count;
    }else if (column == 1){
        return self.areas.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.classifys[indexPath.row];
    } else if (indexPath.column == 1){
        return self.areas[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
            return self.cates.count;
        } else if (row == 2){
            return self.movices.count;
        } else if (row == 3){
            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            return self.cates[indexPath.item];
        } else if (indexPath.row == 2){
            return self.movices[indexPath.item];
        } else if (indexPath.row == 3){
            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y>=140) {
        self.menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
        self.menu.delegate = self;
        self.menu.dataSource = self;
        self.menu.hidden = NO;
    }else
    {
        self.menu.hidden = YES;
    
    }
    NSLog(@"%f",scrollView.contentOffset.y);
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
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    [cell.useHeaderImageButton setBackgroundImage:savedImage forState:UIControlStateNormal];
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
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 141) andHeight:44];
   
    
    
    menu.delegate = self;
    menu.dataSource = self;
    [reusableView addSubview:menu];
 

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
