//
//  BlackListViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/30.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "BlackListViewController.h"
#import "BlackListTableViewCell.h"
@interface BlackListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *blackListTableView;

@end

@implementation BlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.blackListTableView.dataSource = self;
    self.blackListTableView.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelShield:(id)sender {
    NSLog(@"cancelshield");
}
- (IBAction)black:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"blackListCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
