//
//  MenuViewController.m
//  Test
//
//  Created by chuitian.yyy on 2018/4/20.
//  Copyright © 2018年 chuitian.yyy. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
-(void)addMenuItems;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    [self addMenuItems];
}

-(void)addMenuItems{
    UIButton * btn  = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setFrame:CGRectMake(0, 100, 180, 40)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"item1" forState:(UIControlStateNormal)];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [btn setTag:1];
    [self.view addSubview:btn];

    UIButton * btn1  = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn1 setFrame:CGRectMake(0, 200, 180, 40)];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 setTitle:@"item2" forState:(UIControlStateNormal)];
    [btn1.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [btn1 setTag:2];
    [self.view addSubview:btn1];
    
    [btn addTarget:self action:@selector(menuClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn1 addTarget:self action:@selector(menuClick:) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)menuClick:(UIButton*)sender{
    [self.delegate menuController:self didSelectItemAtIndexPath:sender.tag - 1];
}

@end
