//
//  DealConventionViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/10/6.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "DealConventionViewController.h"

@interface DealConventionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *dealConventionTableView;

@end

@implementation DealConventionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dealConventionTableView.dataSource = self;
    self.dealConventionTableView.delegate = self;
    self.dealConventionTableView.scrollEnabled = NO;
    
}
- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 4;
    }else
        return 1;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 1000;
    }
    return 40;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        NSString *sectionHeaderString0 = @"蜗牛校园介绍";
        return sectionHeaderString0;
    }else if (section == 1)
    {
        NSString *sectionHeaderString0 = @"蜗牛交易介绍";
        return sectionHeaderString0;
    }else if (section == 2)
    {
        NSString *sectionHeaderString0 = @"蜗牛管理规则";
        return sectionHeaderString0;
    }else
        return nil;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dealConventionCell" forIndexPath:indexPath];
    cell.accessoryType = UIAccessibilityScrollDirectionRight;
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.textLabel.text = @"蜗牛校园是什么";
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        cell.textLabel.text = @"蜗牛交易流程";
    }else if (indexPath.section == 1 && indexPath.row == 1) {
        cell.textLabel.text = @"交易超出时间";
    }else if (indexPath.section == 1 && indexPath.row == 2) {
        cell.textLabel.text = @"退款超出时间";
    }else if (indexPath.section == 1 && indexPath.row == 3) {
        cell.textLabel.text = @"交易争议处理";
    }else if (indexPath.section == 2 && indexPath.row == 0) {
        cell.textLabel.text = @"用户行为规范";
    }
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
