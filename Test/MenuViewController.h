//
//  MenuViewController.h
//  Test
//
//  Created by chuitian.yyy on 2018/4/20.
//  Copyright © 2018年 chuitian.yyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuViewController;

@protocol MenuViewControllerDelegate <NSObject>
-(void)menuController:(MenuViewController*)controller didSelectItemAtIndexPath:(NSInteger)index;
@end


@interface MenuViewController : UIViewController
@property(nonatomic,weak)id<MenuViewControllerDelegate> delegate;
@end
