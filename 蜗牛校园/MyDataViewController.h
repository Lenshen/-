//
//  MyDataViewController.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/30.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol imageViewDelegate <NSObject>
-(void)showName:(UIImage *)nameImage;

@end


@interface MyDataViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *myDataTableView;
@property (weak, nonatomic) IBOutlet UILabel *naviTitleLabel;
@property (weak, nonatomic) id<imageViewDelegate>imageDelegate;

@end
