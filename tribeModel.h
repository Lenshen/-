//
//  tribeModel.h
//  
//
//  Created by 远深 on 15/10/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface tribeModel : NSObject
@property (nonatomic, strong)NSArray *tribeImageArray;
@property (nonatomic, strong)NSArray *tribeNameArray;
@property (nonatomic, strong)NSArray *tribeSignArray;
-(instancetype)initWithArray;
@end
