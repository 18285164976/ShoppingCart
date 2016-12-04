//
//  GoodsModel.m
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel
-(NSString *)totalMoney
{
    _totalMoney = [NSString stringWithFormat:@"%.2f",[_goodsPrice floatValue]*[_goodsNumber floatValue]];
    return _totalMoney;
}
@end
