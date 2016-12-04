//
//  ViewController.m
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingCartView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[ShoppingCartView alloc] initWithFrame:self.view.frame];
    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
