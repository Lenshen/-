//
//  TribeViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "TribeViewController.h"
#import "InterestTableViewCell.h"

@interface TribeViewController ()<UITableViewDataSource,UITableViewDelegate>;
@property (weak, nonatomic) IBOutlet UITableView *tribeTableView;
@property (strong, nonatomic)NSArray *tribeNameArray;
@property (strong, nonatomic)NSArray *followArray;
@property (strong, nonatomic)NSArray *noteArray;
@property (strong, nonatomic)NSArray *signArray;
@property (strong, nonatomic)NSTimer *firstPageTimer;
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
    [self initArray];
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


-(void)initArray
{
    if (!self.tribeNameArray) {
        self.tribeNameArray = [NSArray arrayWithObjects:@"学霸部落",@"数码部落",@"户外部落",@"穿搭部落", nil];
    
    }
    if (!self.signArray) {
        self.signArray = [NSArray arrayWithObjects:@"让我们一起学习吧。",@"我们看这里的数码产品。",@"一群真正热爱户外的驴友...",@"穿搭教学 时尚部落客..", nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InterestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interstCell" forIndexPath:indexPath];
    cell.tribeNameLabel.text = self.tribeNameArray[indexPath.row];
    cell.signLabel.text = self.signArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
