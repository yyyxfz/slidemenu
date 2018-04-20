//
//  ContainerViewController.m
//  Test
//
//  Created by chuitian.yyy on 2018/4/20.
//  Copyright © 2018年 chuitian.yyy. All rights reserved.
//

#import "ContainerViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface ContainerViewController ()<MenuViewControllerDelegate>
-(void)addMenuController;
-(void)addContentControllers;

@property(nonatomic,assign)NSUInteger controllerIndex;
@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMenuController];
    [self addContentControllers];
}



-(void)addMenuController{
    [self setMenuController:[[MenuViewController alloc]init]];
    [self addChildViewController:self.menuController];
    self.menuController.delegate = self;
    [self.view addSubview:self.menuController.view];

}

-(void)addContentControllers{
    FirstViewController * firstVC =  [[FirstViewController alloc]init];
    UINavigationController* navFirst = [[UINavigationController alloc] initWithRootViewController:firstVC];

    SecondViewController * secondVC =  [[SecondViewController alloc]init];
    UINavigationController* navSecond = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    [self setViewControllers:@[navFirst,navSecond]];
    
    [self setContentViewController:navFirst];

}



-(void)setContentViewController:(UIViewController *)contentViewController{
    if (_contentViewController == contentViewController) {
        return;
    }
    
    if (_contentViewController) {
        contentViewController.view.transform = _contentViewController.view.transform;
    }
    
    [_contentViewController willMoveToParentViewController:nil];
    [_contentViewController.view removeFromSuperview];
    [_contentViewController removeFromParentViewController];
    
    
    _contentViewController = contentViewController;
    
    
    [self addChildViewController:self.contentViewController];
    [self.view addSubview:self.contentViewController.view];
}


-(void)openCloseMenu{
    if (_isAnimation) {
        return;
    }
    [UIView animateWithDuration:(0.2) animations:^{
        _isAnimation = YES;
        if (!_isMenuOpen) {
            self.contentViewController.view.transform = CGAffineTransformMakeTranslation(100, 0);
        }else{
            self.contentViewController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(self.view.bounds), 0);
            
        }
    } completion:^(BOOL finished) {
        _isMenuOpen = !_isMenuOpen;
        [self setContentViewController:self.viewControllers[self.controllerIndex]];
        if(!_isMenuOpen) {
            [UIView animateWithDuration:0.2 delay:0.1 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
                self.contentViewController.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                _isAnimation = NO;
            }];
        }else{
            _isAnimation = NO;
        }
        
    }];
}

-(void)menuController:(MenuViewController *)controller didSelectItemAtIndexPath:(NSInteger)index{
    [self setControllerIndex:index];
    [self openCloseMenu];
}

@end
