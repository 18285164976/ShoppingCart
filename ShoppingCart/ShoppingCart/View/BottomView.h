//
//  BottomView.h
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^buttonActionBlock)(BOOL);
@interface BottomView : UIView
@property (weak, nonatomic) IBOutlet UIButton *selectedAllButton;
- (IBAction)selectedAllAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *totalMoney;
@property (weak, nonatomic) IBOutlet UIButton *payButton;
- (IBAction)payActioin:(UIButton *)sender;
@property(nonatomic,copy) buttonActionBlock block;
@end
