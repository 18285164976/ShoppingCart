//
//  ShopModel.h
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface ShopModel : NSObject
@property(nonatomic,copy) NSString *shopName;
@property(nonatomic,strong) NSMutableArray *goodsArray;
@property(nonatomic,assign) BOOL isAllSelected;
@property(nonatomic,strong) UIImage *shopLogImage;
@property(nonatomic,copy) NSString *totalMoney;
@end
