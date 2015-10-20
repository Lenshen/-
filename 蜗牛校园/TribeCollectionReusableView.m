//
//  TribeCollectionReusableView.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/15.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "TribeCollectionReusableView.h"

@implementation TribeCollectionReusableView
- (void)setTribeModel:(tribeModel *)tribeModel
{
    _tribeImage = tribeModel;
}
-(void)willAppear
{
        [self.tribeReusableViewSegment  addTarget:self action:@selector(controlPressed:) forControlEvents:UIControlEventEditingChanged];
}
-(IBAction)controlPressed:(UISegmentedControl *)sender
{
    int selectedIndex =(int) [sender
                              selectedSegmentIndex];
    switch (selectedIndex) {
        case 0:
            self.frame = CGRectMake(0, 0, 320, 243);

            NSLog(@"selectedIndex %d",selectedIndex);

            break;
        case 1:
            self.frame = CGRectMake(0, 0, 320, 143);
            NSLog(@"secsdcsdcds  %f",self.frame.size.width);
            break;
        case 2:
            NSLog(@"sdasdfasdf  %d",selectedIndex);
            break;
        case 3:  
            
            
            self.frame = CGRectMake(0, 0, 320, 568);
            

            NSLog(@"zhunimei  %d",selectedIndex);
            break;
            
    }
    
}


@end
