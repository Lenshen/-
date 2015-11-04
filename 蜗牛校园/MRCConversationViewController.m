//
//  MRCConversationViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/10/21.
//  Copyright © 2015年 yance.bao. All rights reserved.
//

#import "MRCConversationViewController.h"
#import "MessageViewController.h"
#import "TabBarController.h"

@interface MRCConversationViewController ()
@property (nonatomic, strong)TabBarController *tab;
@property (weak, nonatomic) IBOutlet UIView *topView;


@end

@implementation MRCConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"sss");
    self.conversationMessageCollectionView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
    self.conversationMessageCollectionView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"聊天背景.jpg"]];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 25, 10, 18)];
    [button addTarget:self action:@selector(black) forControlEvents:UIControlEventTouchDown];
    
    [button setBackgroundImage:[UIImage imageNamed:@"兴趣部落 返回无字"] forState:UIControlStateNormal];

    [view addSubview:button];
      [self.view addSubview:view];

    

}
-(void)black
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
