//
//  ContainerViewController.h
//  Test
//
//  Created by chuitian.yyy on 2018/4/20.
//  Copyright © 2018年 chuitian.yyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
@interface ContainerViewController : UIViewController
@property(nonatomic,strong)MenuViewController* menuController;

@property(nonatomic,strong)UIViewController* contentViewController;

@property(nonatomic,strong)NSArray* viewControllers;

@property(nonatomic,assign,readonly)BOOL isMenuOpen;

@property(nonatomic,assign,readonly)BOOL isAnimation;

-(void)openCloseMenu;


@end
