//
//  BottomView.m
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView
-(void)awakeFromNib
{
    [super awakeFromNib];
}

- (IBAction)selectedAllAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.block(sender.selected);
}
- (IBAction)payActioin:(UIButton *)sender {
    
}
@end
