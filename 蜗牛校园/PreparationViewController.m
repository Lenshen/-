//
//  PreparationViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/12.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "PreparationViewController.h"
#import "preparationCollectionViewCell.h"

@interface PreparationViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource>;
@property (weak, nonatomic) IBOutlet UITableView *preparationTabView;
@property (strong, nonatomic)NSArray *tabArray;
@end

@implementation PreparationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hideSearchBar];
    self.preparationTabView.delegate = self;
    self.preparationTabView.dataSource = self;
 
}
- (IBAction)nationalButton:(id)sender
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(400.0f, 0.0f, 300.0f, 233.0f);

    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:24.0f];
    button.backgroundColor = [UIColor blackColor];
    
    // 添加 action
    
//    [button addTarget:self action:@selector(toggleButton:) forControlEvents: UIControlEventTouchUpInside]
    
    [self.view addSubview:button];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"aaaa%ld",self.tabArray.count);
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.tabArray[indexPath.row];
    return cell;
}
- (IBAction)quanGuoButton:(id)sender
{
    self.tabArray = [NSArray arrayWithObjects:@"全国", nil];
    
}
- (IBAction)fenLeiButton:(id)sender
{
    self.tabArray = [NSArray arrayWithObjects:@"学习",@"美妆护肤",@"服饰鞋帽",@"",@"数码电子",@"运动户外",@"宿舍生活",@"其他二手", nil];
    NSLog(@"bbbb%ld",self.tabArray.count);
    
}
- (IBAction)paiXunButton:(id)sender
{
    self.tabArray = [NSArray arrayWithObjects:@"默认排序",@"认证用户",@"最新发布",@"价格最低",@"价格最高", nil];
}

-(void)hideSearchBar
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
- (IBAction)black:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    preparationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"preparationCollectionCell" forIndexPath:indexPath];
    return cell;
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
