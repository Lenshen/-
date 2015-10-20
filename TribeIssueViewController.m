//
//  TribeIssueViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/16.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "TribeIssueViewController.h"

@interface TribeIssueViewController ()<UIAlertViewDelegate>

@end

@implementation TribeIssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addImage:(id)sender
{
    [self AlertViewAddfirstSting:@"从相册中选取" secondSting:@"拍照" cancelString:@"取消" tag:(NSInteger)1];
    
}
-(void)AlertViewAddfirstSting:(NSString *)firstSting
                  secondSting:(NSString *)secondSting
                 cancelString:(NSString *)cancelSting
                          tag:(NSInteger )tag;
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:cancelSting
                                          otherButtonTitles:firstSting,nil];
    //设置标题与信息，通常在使用frame初始化AlertView时使用
    
    //这个属性继承自UIView，当一个视图中有多个AlertView时，可以用这个属性来区分
    alert.tag = tag;
    //只读属性，看AlertView是否可见
    NSLog(@"%d",alert.visible);
    //通过给定标题添加按钮
    //按钮总数
    [alert addButtonWithTitle:secondSting];
    
    
    [alert show];
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
