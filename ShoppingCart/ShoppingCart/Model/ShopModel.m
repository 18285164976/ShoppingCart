//
//  ShopModel.m
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel
-(NSMutableArray *)goodsArray
{
    if (!_goodsArray)
    {
        _goodsArray = [NSMutableArray new];
        
        for (NSInteger i = 0; i<3; i++)
        {
            GoodsModel *model = [GoodsModel new];
            model.goodsName = [NSString stringWithFormat:@"商品发的索科洛夫觉得上课了罚款伦敦发生的－%ld",(long)i];
            model.goodsPrice = @"50.0";
            model.goodsNumber = @"1";
            model.isSelected = NO;
            [_goodsArray addObject:model];
        }
    }
    return _goodsArray;
}
-(BOOL)isAllSelected
{
    int a = 0;
    for (GoodsModel *model in self.goodsArray)
    {
        if (model.isSelected)
        {
            a++;
        }
    }
    
    if (a==self.goodsArray.count) {
        _isAllSelected = YES;
    }
    else
        _isAllSelected = NO;
    return _isAllSelected;
}
-(NSString *)totalMoney
{
    float total = 0.00;
    for (GoodsModel *model in _goodsArray) {
        if (model.isSelected) {
            total +=[model.totalMoney floatValue];
        }
    }
    _totalMoney = [NSString stringWithFormat:@"%.2f",total];
    return _totalMoney;
}
@end
