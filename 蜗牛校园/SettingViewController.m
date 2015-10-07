//
//  SettingViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/30.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "SettingViewController.h"
#import "MyDataViewController.h"
#import "BlackListViewController.h"
#import "NewWarnViewController.h"
#import "HelpAndFeedbackViewController.h"
#import "DealConventionViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@end;

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.settingTableView.dataSource = self;
    self.settingTableView.delegate = self;
    self.settingTableView.scrollEnabled = NO;

}
#pragma mark - tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 1000;
    }
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
        break;
        case 1:
            return 4;
            break;
       }
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell" forIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row ==0) {
        cell.textLabel.text = @"个人资料设置" ;
    }else if (indexPath.section == 0 && indexPath.row ==1)
    {
       cell.textLabel.text = @"黑名单列表";
    }else if (indexPath.section == 1 && indexPath.row ==0)
    {
      cell.textLabel.text = @"消息提醒设置";
    }else if (indexPath.section == 1 && indexPath.row ==1)
    {
        cell.textLabel.text = @"关于蜗牛校园";
    }else if (indexPath.section == 1 && indexPath.row ==2)
    {
      cell.textLabel.text = @"帮助与反馈";
    }else if (indexPath.section == 1 && indexPath.row ==3)
    {
      cell.textLabel.text = @"蜗牛交易公约";
    }else if (indexPath.section == 2 && indexPath.row ==0)
    {
       cell.textLabel.text = @"清楚缓存";
    }
    cell.accessoryType = UIAccessibilityScrollDirectionRight;
    return cell;
}
#pragma mark - tableview点击后的代码

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 && indexPath.row ==0)
    {
        MyDataViewController *myData = [[MyDataViewController alloc]init];
        [self storyBoardAndViewController:myData andStoryBoardID:@"myDataController"];
        
    
    }else if (indexPath.section == 0 && indexPath.row ==1)
    {
        BlackListViewController *blackList = [[BlackListViewController alloc]init];
        [self storyBoardAndViewController:blackList andStoryBoardID:@"blackListViewController"];
    }else if (indexPath.section == 1 && indexPath.row ==0)
    {
        NewWarnViewController *newWarnViewController = [[NewWarnViewController alloc]init];
        [self storyBoardAndViewController:newWarnViewController andStoryBoardID:@"newWarnViewController"];
    }else if (indexPath.section == 1 && indexPath.row ==1)
    {
        
    }else if (indexPath.section == 1 && indexPath.row ==2)
    {
        HelpAndFeedbackViewController *helpAndFeedbackViewController = [[HelpAndFeedbackViewController alloc]init];
        [self storyBoardAndViewController:helpAndFeedbackViewController andStoryBoardID:@"helpAndFeedback"];
    }else if (indexPath.section == 1 && indexPath.row ==3)
    {
        DealConventionViewController *dealConventionViewController = [[DealConventionViewController alloc]init];
        [self storyBoardAndViewController:dealConventionViewController andStoryBoardID:@"dealConventionViewController"];
        
    }else if (indexPath.section == 2 && indexPath.row ==0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你确定要清除缓存吗？"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定",nil];
        //设置标题与信息，通常在使用frame初始化AlertView时使用
        
        //这个属性继承自UIView，当一个视图中有多个AlertView时，可以用这个属性来区分
        alert.tag = 0;
        //只读属性，看AlertView是否可见
        NSLog(@"%d",alert.visible);
        //通过给定标题添加按钮
        //按钮总数
        NSLog(@"number Of Buttons :%ld",(long)alert.numberOfButtons);
        //获取指定索引的按钮标题
        NSLog(@"buttonTitleAtIndex1:%@",[alert buttonTitleAtIndex:1]);
        //获取取消按钮的索引
        NSLog(@"cancelButtonIndex:%ld",(long)alert.cancelButtonIndex);
        //获取第一个其他按钮的索引
        NSLog(@"firstOtherButtonIndex:%ld",(long)alert.firstOtherButtonIndex);
        //显示AlertView  
        [alert show];
    }

}
#pragma mark - storyboard 拿viewcontroller
-(UIViewController *)storyBoardAndViewController
:(UIViewController *)viewController andStoryBoardID
:(NSString *)storyBoardID;
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewController = [storyboard instantiateViewControllerWithIdentifier:storyBoardID];
    [viewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:viewController animated:YES completion:nil];
    return viewController;
}

- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 点击提示框后，做内存清除处理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex %ld",buttonIndex);
    if (buttonIndex == 0) {
        NSLog(@"i love you");
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
