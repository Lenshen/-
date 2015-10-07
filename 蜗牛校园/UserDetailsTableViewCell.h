//
//  UserDetailsTableViewCell.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/17.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tribeImage;
@property (weak, nonatomic) IBOutlet UILabel *tribeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *followLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
@property (weak, nonatomic) IBOutlet UILabel *signLabel;
@end
