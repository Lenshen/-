//
//  HelpAndFeedbackViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/30.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "HelpAndFeedbackViewController.h"

@interface HelpAndFeedbackViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *helpTableView;
@property (weak, nonatomic) IBOutlet UIView *helpTableViewheadView;

@end

@implementation HelpAndFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.helpTableView.dataSource = self;
    self.helpTableView.delegate = self;
    self.helpTableView.tableHeaderView = self.helpTableViewheadView;
    self.helpTableView.layer.borderWidth = 0.5;
    self.helpTableView.layer.cornerRadius = 10;
    self.helpTableView.layer.masksToBounds = YES;
    self.helpTableView.layer.borderColor = [[UIColor grayColor] CGColor];
    
}
- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"helpCell" forIndexPath:indexPath];
    cell.textLabel.numberOfLines = 4;
    cell.textLabel.text = @"  父母分开了的发烧开发高技术风格噶旅客发送量过来啊两个房间里放啦过啦嘎啦价格啦就开发反复反反复复反反复复";
    cell.accessoryType = UIAccessibilityScrollDirectionRight;
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
