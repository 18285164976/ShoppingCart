//
//  GoodsCell.h
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
typedef void(^selectedBlock)(NSIndexPath *,BOOL);
@interface GoodsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;
- (IBAction)selectedAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
@property (weak, nonatomic) IBOutlet UILabel *goodsNumber;
@property(nonatomic,strong) GoodsModel *model;

@property(nonatomic,strong) NSIndexPath *indexPath;
@property(nonatomic,copy) selectedBlock block;
@end
