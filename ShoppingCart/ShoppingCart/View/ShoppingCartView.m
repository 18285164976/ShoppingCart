//
//  ShoppingCartView.m
//  ShoppingCart
//
//  Created by 孙录 on 16/11/30.
//  Copyright © 2016年 sunlu. All rights reserved.
//

#import "ShoppingCartView.h"
#import "ShopModel.h"
#import "GoodsCell.h"
#import "BottomView.h"
@interface ShoppingCartView()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong) NSMutableArray *shopArray;
@property(nonatomic,strong) BottomView *bottomView;

@end
@implementation ShoppingCartView
-(void)relodTableViewData
{
    [self.tableView reloadData];
    int a = 0;
    for (ShopModel *model in self.shopArray)
    {
        if(model.isAllSelected )
        {
            a++;
        }
    }
    if (a==self.shopArray.count)
    {
        self.bottomView.selectedAllButton.selected = YES;
    }
    else
        self.bottomView.selectedAllButton.selected = YES;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 64)];
        topView.backgroundColor = [UIColor redColor];
        [self addSubview:topView];
        
        UILabel *topTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0-200/2.0, 20, 200, 44)];
        topTitle.text = @"我的购物车";
        [topTitle setTextColor:[UIColor whiteColor]];
        topTitle.textAlignment = NSTextAlignmentCenter;
        [topView addSubview:topTitle];
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.frame.size.width, self.frame.size.height-44-64)];
        [self.tableView registerNib:[UINib nibWithNibName:@"GoodsCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self addSubview:self.tableView];
        self.tableView.backgroundColor = [UIColor whiteColor];
        
        _bottomView = [[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:nil options:0][0];
        _bottomView.frame = CGRectMake(0, self.frame.size.height-44, self.frame.size.width, 44);
        [self addSubview:_bottomView];
        __weak typeof(self) weakSelf = self;
        _bottomView.block = ^(BOOL selected)
        {
            for (NSInteger i = 0; i<weakSelf.shopArray.count; i++) {
                ShopModel *shopModel = weakSelf.shopArray[i];
                for (NSInteger j = 0; j<shopModel.goodsArray.count; j++) {
                    GoodsModel *goodsModel = shopModel.goodsArray[j];
                    goodsModel.isSelected = selected;
                    shopModel.goodsArray[j] = goodsModel;
                }
                weakSelf.shopArray[i] = shopModel;
            }
            [weakSelf.tableView reloadData];
            [weakSelf changeBottomView];
        };
        //self.backgroundColor = [UIColor redColor];
        
    }
    [self changeBottomView];
    return self;

}

-(NSMutableArray *)shopArray
{
    if (!_shopArray) {
        _shopArray = [NSMutableArray new];
        
        for (NSInteger i = 0; i<3; i++) {
            ShopModel *model = [ShopModel new];
            model.shopName = [NSString stringWithFormat:@"我添加的商店－%ld",(long)i];
            model.shopLogImage = [UIImage imageNamed:@""];
            model.isAllSelected = NO;
            [self.shopArray addObject:model];
        }
    }
    return _shopArray;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.shopArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ShopModel *shopModel = self.shopArray[section];
    return shopModel.goodsArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsModel *model = [self.shopArray[indexPath.section] goodsArray][indexPath.row];
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.model = model;
    cell.indexPath = indexPath;
    cell.selectedButton.selected = model.isSelected;
    cell.goodsName.text = model.goodsName;
    cell.goodsPrice.text = [NSString stringWithFormat:@"¥ %@",model.goodsPrice];
    cell.goodsNumber.text = [NSString stringWithFormat:@"X%@",model.goodsNumber];
    __weak typeof(self) weakSelf = self;
    cell.block = ^(NSIndexPath *indexP,BOOL isSelected)
    {
        
        model.isSelected = isSelected;
        [self.shopArray[indexPath.section] goodsArray][indexPath.row] = model;
        [weakSelf.tableView reloadData];
        [weakSelf changeBottomView];
    };
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ShopModel *model = self.shopArray[section];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
    view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
    button.tag = 100+section;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitle:@"✅" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(shopSelected:) forControlEvents:UIControlEventTouchUpInside];
    button.selected = model.isAllSelected;
    [view addSubview:button];
    
    UIImageView *imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(45, 0, 30, 30)];
    imageView.image = model.shopLogImage;
    imageView.backgroundColor = [UIColor greenColor];
    [view addSubview:imageView];
    
    UILabel *shopName = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, self.frame.size.width-80, 30)];
    shopName.text = model.shopName;
    [view addSubview:shopName];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
//-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"---------------cellIndexPatth = %@",indexPath);
//}
-(void)shopSelected:(UIButton *)sender
{
    UIButton *button = (UIButton *)[self viewWithTag:sender.tag];
    button.selected = !button.selected;
    ShopModel *model = self.shopArray[sender.tag-100];
    for (NSInteger i = 0; i<model.goodsArray.count; i++)
    {
        GoodsModel *goodsModel = model.goodsArray[i];
        goodsModel.isSelected = button.selected;
        model.goodsArray[i] =goodsModel;
    }
    
    self.shopArray[sender.tag-100] = model;
    [self.tableView reloadData];
    [self changeBottomView];
}
-(void)changeBottomView
{
    int a = 0;
    float totalMoney = 0;
    for (ShopModel *model in self.shopArray)
    {
        if(model.isAllSelected )
        {
            a++;
        }
        totalMoney +=[model.totalMoney floatValue];
    }
    self.bottomView.totalMoney.text = [NSString stringWithFormat:@"¥%.2f",totalMoney];
    [self.bottomView.payButton setTitle:[NSString stringWithFormat:@"结算(%d)",a] forState:UIControlStateNormal];
    
    if (a==self.shopArray.count)
    {
        self.bottomView.selectedAllButton.selected = YES;
    }
    else
        self.bottomView.selectedAllButton.selected = NO;
}
@end
