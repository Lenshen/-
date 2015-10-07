//
//  OwnViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "OwnViewController.h"
#import "OwnTableViewCell.h"
#import "OwnHeadeTableViewCell.h"
#import "friendTrendViewController.h"
#import "MySoldViewController.h"
#import "SettingViewController.h"
@interface OwnViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *ownTableView;
@property (nonatomic, strong)NSArray *ownArray;
@property (nonatomic, strong)NSArray *ownArray1;
@property (nonatomic, strong)NSArray *ownImageArray;
@property (nonatomic, strong)NSArray *ownImageArray1;

@end

@implementation OwnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ownTableView.dataSource = self;
    self.ownTableView.delegate = self;
    self.ownTableView.scrollEnabled = NO;
    self.ownArray = @[@"好友动态",@"我的话题"];
    self.ownArray1 = @[@"我的二手",@"我卖出的",@"我买到的",@"我收藏的"];
    self.ownImageArray = [NSArray arrayWithObjects: [UIImage imageNamed:@"ownOne"],[UIImage imageNamed:@"ownTwo"],nil];
     self.ownImageArray1 = [NSArray arrayWithObjects: [UIImage imageNamed:@"ownThree"],[UIImage imageNamed:@"ownFour"],[UIImage imageNamed:@"ownFive"],[UIImage imageNamed:@"ownSix"],nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row ==  0) {
        return 80;
    }
    if (indexPath.section == 3 && indexPath.row == 0) {
        return 90;
    }
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }

    return 15;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 1;
    }else if(section == 1)
    {
        return 2;
    }else if(section == 2)
    {
        return 4;
    }else if(section == 3)
    {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        OwnHeadeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ownHeadeTabelCell" forIndexPath:indexPath];
    
        return cell;
    }
   OwnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ownTabViewCell" forIndexPath:indexPath];
    tableView.rowHeight = 144 ;
    cell.accessoryType = UIAccessibilityScrollDirectionRight;
    switch (indexPath.section) {
        case 1:
            cell.ownExplainLabel.text = self.ownArray[indexPath.row];
            cell.ownExplainImage.image = self.ownImageArray[indexPath.row];
            break;
        case 2:
            cell.ownExplainLabel.text = self.ownArray1[indexPath.row];
            cell.ownExplainImage.image = self.ownImageArray1[indexPath.row];
            break;
        case 3:
            cell.ownExplainLabel.text = @"设置";
            cell.ownExplainImage.image = [UIImage imageNamed:@"ownSeven"];
            
       
    }
 

    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    friendTrendViewController *friendTrend = [storyboard instantiateViewControllerWithIdentifier:@"firendTrend"];
    [friendTrend setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    MySoldViewController *mySoldViewController = [storyboard instantiateViewControllerWithIdentifier:@"mySoldViewController"];
    SettingViewController *settingViewController = [storyboard instantiateViewControllerWithIdentifier:@"settingViewController"];
    UIViewController *ownSubjectViewController = [storyboard instantiateViewControllerWithIdentifier:@"ownSubjectViewController"];
    [ownSubjectViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    if (indexPath.section == 1 && indexPath.row == 0) {
        [self presentViewController:friendTrend animated:YES completion:nil];
    
    }else if (indexPath.section == 1 && indexPath.row == 1) {
        [self presentViewController:ownSubjectViewController animated:YES completion:nil];

    }else if (indexPath.section == 2 && indexPath.row == 0)
    {
    
    [self presentViewController:friendTrend animated:YES
                     completion:nil];
    friendTrend.headLabel.text = @"我的二手";
    }else if (indexPath.section == 2 && indexPath.row == 1)
    {
        [self presentViewController:mySoldViewController animated:YES completion:nil];
        
    }else if (indexPath.section == 2 && indexPath.row == 2)
    {
      [self presentViewController:mySoldViewController animated:YES completion:nil];
        mySoldViewController.headLabel.text = @"我买到的";
        
    }
    else if (indexPath.section == 2 && indexPath.row == 3)
{
    [self presentViewController:friendTrend animated:YES completion:nil];
    friendTrend.headLabel.text = @"我的收藏";
}else if (indexPath.section == 3 && indexPath.row == 0)
{
    [self presentViewController:settingViewController animated:YES completion:nil];
}

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
