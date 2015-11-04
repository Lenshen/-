//
//  MessageViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "MessageViewController.h"
#import <rongimlib/RCConversation.h>
#import "MRCConversationViewController.h"
#import "TabBarController.h"


@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


    // Do any additional setup after loading the view.
    NSString*token=@"sSzIYd4YIsHXtU0YGZKk6V1zXcHQ2P3ZnvANCTouCANDtHL1XvYk6kac5kCKiWVMyQNI0YrdoUQ=";
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        NSLog(@"Login successfully with userId: %@.", userId);
        dispatch_async(dispatch_get_main_queue(), ^{

        });
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"login error status: %ld.", (long)status);
    } tokenIncorrect:^{
        NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
    }];
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION)]];
       UILabel *backText = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 65, 22)];
    backText.text = @"退出";
    backText.font = [UIFont systemFontOfSize:15];
    [backText setBackgroundColor:[UIColor clearColor]];
    [backText setTextColor:[UIColor whiteColor]];
    self.conversationListTableView.tableFooterView = [UIView new];


}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    self.tabBarController.hidesBottomBarWhenPushed = NO;
    self.tabBarController.tabBar.hidden = NO;

    
}
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion
{
    //此处为了演示写了一个用户信息
    if ([@"1" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1";
        user.name = @"爱爱爱";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        return completion(user);
    }else if([@"2" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"2";
        user.name = @"测试2";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        return completion(user);
    }
    
}


-(IBAction)rightBarButtonItemPressed:(id)sender
{
    MRCConversationViewController *conversationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MRCConversationViewController"];

    conversationVC.conversationType =ConversationType_PRIVATE;
    conversationVC.targetId = @"1"; //这里模拟自己给自己发消息，您可以替换成其他登录的用户的UserId
    conversationVC.userName = @"爱爱爱";
    conversationVC.title = @"呵呵呵呵";
    


    [self.navigationController pushViewController:conversationVC animated:YES];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[RCIM sharedRCIM]disconnect];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    MRCConversationViewController *conversationVC = [[MRCConversationViewController alloc]init];
    conversationVC.conversationType =model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.userName =model.conversationTitle;
    conversationVC.title = model.conversationTitle;
    [conversationVC setModalPresentationStyle:UIModalPresentationCustom];
    [self presentViewController:conversationVC animated:YES completion:nil];
   
   
    

    
    
    
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
