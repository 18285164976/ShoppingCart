//
//  GoodsCell.m
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import "GoodsCell.h"

@implementation GoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (IBAction)selectedAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setTitle:@"✅" forState:UIControlStateSelected];
    }
    self.block(self.indexPath,sender.selected);
    NSLog(@"---------selected = %d",sender.selected);
}
@end
