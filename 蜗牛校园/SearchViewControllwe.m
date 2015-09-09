//
//  SearchViewControllwe.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/7.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "SearchViewControllwe.h"
#import "SearchTableViewCell.h"
#import "FirstPageViewController.h"


@interface SearchViewControllwe ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;
@property (strong, nonatomic)NSArray *imageArray;
@property (strong, nonatomic)NSArray *bigLabelArray;
@property (strong, nonatomic)NSArray *smallOneArray;
@property (strong, nonatomic)NSArray *smallTwoArray;
@property (strong, nonatomic)NSArray *smallTreeArray;


@end

@implementation SearchViewControllwe

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.MyTableView.delegate = self;
    self.MyTableView.dataSource =self;
    [self initArray];

}
-(void)viewDidAppear:(BOOL)animated
{
//    self.hidesBottomBarWhenPushed =YES;
}
-(void)initArray
{
    if (!self.imageArray) {
        self.imageArray = [NSArray arrayWithObjects:@"lerning_search",@"美妆",@"clothes_search",@"digital_search",@"运动",@"宿舍",@"其他",nil];
    }
    if (!self.bigLabelArray) {
        self.bigLabelArray = [NSArray arrayWithObjects:@"1",@"2", @"3", @"4", @"5", @"6", @"7",  nil];
 
}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.imageArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const identify = @"tabcell";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIImage *image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    UIImage *image1 = [UIImage imageNamed:self.bigLabelArray[indexPath.row]];
    cell.cellImage.image = image;
    cell.rightImage.image = image1;
    return cell;

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
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
