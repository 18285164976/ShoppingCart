//
//  GoodsModel.h
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GoodsModel : NSObject
@property(nonatomic,copy) NSString *goodsName;
@property(nonatomic,copy) NSString *goodsPrice;
@property(nonatomic,copy) NSString *goodsNumber;
@property(nonatomic,assign) BOOL isSelected;
@property(nonatomic,strong) UIImage *goodsImage;

@property(nonatomic,copy) NSString *totalMoney;
@end
