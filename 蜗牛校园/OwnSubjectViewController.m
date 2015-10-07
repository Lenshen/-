//
//  OwnSubjectViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/29.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "OwnSubjectViewController.h"

@interface OwnSubjectViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *ownSubjectSegementedControl;
@property (weak, nonatomic) IBOutlet UIView *noReplyView;
@property (weak, nonatomic) IBOutlet UIView *subjectView;
@property (weak, nonatomic) IBOutlet UIView *interestView;

@end

@implementation OwnSubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.subjectView.hidden = NO;
    self.noReplyView.hidden = YES;
    self.interestView.hidden= YES;
}
- (IBAction)black:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)segmentControlChanged:(id)sender
{
    switch (self.ownSubjectSegementedControl.selectedSegmentIndex) {
        case 0:
            NSLog(@"SE1");
            
            self.subjectView.hidden = NO;
            self.noReplyView.hidden = YES;
            self.interestView.hidden= YES;
            break;
        case 1:
            NSLog(@"SE2");
            self.noReplyView.hidden = NO;
            self.subjectView.hidden = YES;
            self.interestView.hidden = YES;
            break;
            case 2:
            self.interestView.hidden = NO;
            self.subjectView.hidden = YES;
            self.noReplyView.hidden = YES;
            NSLog(@"SE3");
            break;
            
       
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
