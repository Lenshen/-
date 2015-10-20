//
//  tribeModel.m
//  
//
//  Created by 远深 on 15/10/13.
//
//

#import "tribeModel.h"

@implementation tribeModel
-(instancetype)initWithArray
{
    self = [super init];
    if (self) {
        if (!self.tribeNameArray) {
            self.tribeNameArray = [NSArray arrayWithObjects:@"学霸部落",@"数码部落",@"户外部落",@"穿搭部落", nil];
            
        }
        if (!self.tribeSignArray) {
            self.tribeSignArray = [NSArray arrayWithObjects:@"让我们一起学习吧。",@"我们看这里的数码产品。",@"一群真正热爱户外的驴友...",@"穿搭教学 时尚部落客..", nil];
        } if (!self.tribeImageArray) {
                    self.tribeImageArray=[NSArray arrayWithObjects: [UIImage imageNamed:@"兴趣01.png"],[UIImage imageNamed:@"兴趣02.png"],[UIImage imageNamed:@"兴趣03.png"],[UIImage imageNamed:@"兴趣04.png"],nil];
               }   }
    return self;
}
@end
