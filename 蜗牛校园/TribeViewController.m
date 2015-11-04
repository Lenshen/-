 //
//  TribeViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "TribeViewController.h"
#import "InterestTableViewCell.h"
#import "TribeDetailsViewController.h"
#import "TribeCollectionReusableView.h"
#import "tribeModel.h"

@interface TribeViewController ()<UITableViewDataSource,UITableViewDelegate>;
@property (weak, nonatomic) IBOutlet UITableView *tribeTableView;
@property (strong, nonatomic)NSArray *tribeNameArray;
@property (strong, nonatomic)NSArray *followArray;
@property (strong, nonatomic)NSArray *imageArray;
@property (strong, nonatomic)NSArray *noteArray;
@property (strong, nonatomic)NSArray *signArray;
@property (strong, nonatomic)NSTimer *firstPageTimer;
@property (strong, nonatomic)UITableViewCell *myCell;
@property (weak, nonatomic) IBOutlet UIScrollView *tribeScrollView;
@property (nonatomic)int i;



@end

@implementation TribeViewController
@synthesize i;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tribeTableView.delegate = self;
    self.tribeTableView.dataSource = self;
    self.tribeTableView.showsVerticalScrollIndicator = NO;
    [self setScrollViewContentSize];

    }
-(void)setScrollViewContentSize
{
    CGSize size = self.tribeScrollView.frame.size;
    
    self.tribeScrollView.pagingEnabled = YES;
    self.tribeScrollView.scrollEnabled = YES;
    self.tribeScrollView.showsHorizontalScrollIndicator = YES;
    self.tribeScrollView.contentSize = CGSizeMake(size.width*3, size.height);
    self.firstPageTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(scrollViewTime) userInfo:nil repeats:YES];

    i = 0;
}
-(void)scrollViewTime
{
    
    self.i++;
    if (self.i>=3) {
        self.i=0;
    }
    [self.tribeScrollView scrollRectToVisible:CGRectMake(self.i * 320.0, 0, 320.0, self.tribeScrollView.frame.size.height) animated:YES];
    NSLog(@"%d",i);
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InterestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interstCell" forIndexPath:indexPath];
    tribeModel *tm = [[tribeModel alloc]initWithArray];
    cell.tribeNameLabel.text = tm.tribeNameArray[indexPath.row];
    cell.signLabel.text = tm.tribeSignArray[indexPath.row];
    cell.tribeImage.image = tm.tribeImageArray[indexPath.row];
    return cell;
}
#pragma mark - tableView点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"LLLLL%ld",(long)indexPath.row);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TribeDetailsViewController *td = [storyboard instantiateViewControllerWithIdentifier:@"TribeDetailsViewController"];
    td.index = (int)indexPath.row;
    [td setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:td animated:YES completion:nil];
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 100;
    
    
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
