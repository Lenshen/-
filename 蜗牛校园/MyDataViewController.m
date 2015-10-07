//
//  MyDataViewController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/30.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "MyDataViewController.h"
#import "MyData1TableViewCell.h"
#import "MyData2TableViewCell.h"
#import "MyData3TableViewCell.h"
#import "UserDetailsViewController.h"

@interface MyDataViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic ,weak)MyData2TableViewCell *myData2TableViewCell;
@property (nonatomic ,weak)MyData1TableViewCell *MyData1TableViewCell;

@end

@implementation MyDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myDataTableView.dataSource = self;
    self.myDataTableView.delegate = self;
    self.myDataTableView.scrollEnabled = NO;
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
     UserDetailsViewController *use= [storyboard instantiateViewControllerWithIdentifier:@"UserDetailsViewController"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.image = savedImage;
    use.ownHeadImage = imageview;

    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else if (section== 1)
    {
        return 20;
    }
    return 1200;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        return 52;
    }
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }else
    return 1;

}
#pragma mark - tableview注册cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.MyData1TableViewCell = [tableView dequeueReusableCellWithIdentifier:@"headImageCell" forIndexPath:indexPath];
        self.MyData1TableViewCell.accessoryType = UIAccessibilityScrollDirectionRight;
        self.MyData1TableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
        
        UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
        
        self.MyData1TableViewCell.headImage.image = savedImage;

        return self.MyData1TableViewCell;
       
    }else if(indexPath.section == 0 && indexPath.row == 1)
    {
        self.myData2TableViewCell = [tableView dequeueReusableCellWithIdentifier:@"myData2Cell" forIndexPath:indexPath];
        self.myData2TableViewCell.accessoryType = UIAccessibilityScrollDirectionRight;
        self.myData2TableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return self.myData2TableViewCell;
    }else if(indexPath.section == 0 && indexPath.row == 2)
    {
        MyData2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myData2Cell" forIndexPath:indexPath];
        cell.label1.text = @"出生年月";
        cell.label2.text = @"  ";
        cell.accessoryType = UIAccessibilityScrollDirectionRight;
        return cell;
        
    }else if(indexPath.section == 0 && indexPath.row == 3)
    {
        MyData2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myData2Cell" forIndexPath:indexPath];
        cell.label1.text = @"学校";
        cell.label2.text = @"  ";
        cell.accessoryType = UIAccessibilityScrollDirectionRight;
        return cell;

    }else if(indexPath.section == 0 && indexPath.row == 4)
    {
        MyData2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myData2Cell" forIndexPath:indexPath];
        cell.label1.text = @"简介";
        cell.label2.text = @"  ";
        cell.accessoryType = UIAccessibilityScrollDirectionRight;
        return cell;

    }else if(indexPath.section == 0 && indexPath.row == 5)
    {
        MyData2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myData2Cell" forIndexPath:indexPath];
        cell.label1.text = @"收获地址";
        cell.label2.text = @"  ";
        cell.accessoryType = UIAccessibilityScrollDirectionRight;
        return cell;

    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AuthenticationCell" forIndexPath:indexPath];
    cell.accessoryType = UIAccessibilityScrollDirectionRight;
    return cell;
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSLog(@"DIANIJIL ");
        [self AlertViewAddfirstSting:@"从相册中选取" secondSting:@"拍照" cancelString:@"取消" tag:(NSInteger)1];
      
    }else if(indexPath.section == 0 && indexPath.row == 1)
    {
        [self AlertViewAddfirstSting:@"男" secondSting:@"女" cancelString:@"取消" tag:(NSInteger)2];
    }
        
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
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1 && buttonIndex == 1) {
        UIImagePickerController
        *imagePicker = [[UIImagePickerController alloc] init];
        
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        
        imagePicker.delegate = self;
        
        
        [self presentViewController:imagePicker animated:YES
         completion:^{
             
             
         }];
    }
    if (alertView.tag == 2 && buttonIndex == 1) {
        
        self.myData2TableViewCell.label2.text = @"男";
     

    }else if (alertView.tag == 2 && buttonIndex == 2) {
        self.myData2TableViewCell.label2.text = @"女";

    }

}
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    NSLog(@"%@",info);
    
    
    self.MyData1TableViewCell.headImage.image = nil;
    

    //UIImagePickerControllerOriginalImage 原始图片
    
    
    
    //UIImagePickerControllerEditedImage 编辑后图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];

    [self saveImage:image withName:@"currentImage.png"];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    
    self.MyData1TableViewCell.headImage.image = savedImage;
    
       self.MyData1TableViewCell.headImage.tag = 100;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    }
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
    {
        
        NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
        // 获取沙盒目录
        
        NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
        // 将图片写入文件
        
        [imageData writeToFile:fullPath atomically:NO];
    }

- (IBAction)black:(id)sender
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
