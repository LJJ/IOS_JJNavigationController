//
//  MyNavigationController.h
//  MyNavigationController
//
//  Created by LJJ on 13-8-1.
//  Copyright (c) 2013年 LJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JJNavigationController;
@protocol NeedMyNavigationController <NSObject>
@property (nonatomic, weak) JJNavigationController *navigationControllerJJ;
@end

@interface JJNavigationController : UIViewController

@property (nonatomic, strong) UIView *navigationBarJJ;
@property (nonatomic) CGFloat height;

- (id)initMyNavWithRootViewController:(UIViewController *)viewController;
- (void)pushViewController:(UIViewController *)viewController withAnimation:(BOOL)animation;
- (void)popViewController:(UIViewController *)viewController withAnimation:(BOOL)animation;

@end
