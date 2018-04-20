//
//  FirstViewController.m
//  Test
//
//  Created by chuitian.yyy on 2018/4/20.
//  Copyright © 2018年 chuitian.yyy. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"firstviewcontroller"];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    [self.navigationController.view.layer setShadowColor:[UIColor blackColor].CGColor];
    
    [self.navigationController.view.layer setShadowOffset:CGSizeMake(-10, 0)];
    [self.navigationController.view.layer setShadowOpacity:0.7f];
    [self.navigationController.view.layer setCornerRadius:10];
    
    
    UIBarButtonItem* item  = [[UIBarButtonItem alloc]initWithTitle:@"菜单" style:(UIBarButtonItemStylePlain) target:self action:@selector(openCloseMenu:)];
    [self.navigationItem setLeftBarButtonItem:item];
    
}

-(void)openCloseMenu:(UIBarButtonItem*)sender{
    [self.navigationController.parentViewController performSelector:@selector(openCloseMenu) withObject:nil afterDelay:(0)];
}


@end
