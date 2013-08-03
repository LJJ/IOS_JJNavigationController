//
//  MyNavigationController.m
//  MyNavigationController
//
//  Created by LJJ on 13-8-1.
//  Copyright (c) 2013年 LJJ. All rights reserved.
//

#import "JJNavigationController.h"
#import <QuartzCore/QuartzCore.h>

#define DefaultHeight 40;

@interface JJNavigationController ()

@property (nonatomic, strong) NSMutableArray *stackJJ;
@property (nonatomic, strong) UIViewController *rootViewController;

@end

@implementation JJNavigationController

- (id)initMyNavWithRootViewController:(UIViewController *) viewController
{
    if (self = [super init]) {
        ((id<NeedMyNavigationController>)viewController).navigationControllerJJ = self;
        _stackJJ = [[NSMutableArray alloc] initWithCapacity:40];
        _height = DefaultHeight;
        _rootViewController = (UIViewController *)viewController;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    CGRect rect =  _rootViewController.view.frame;
    _rootViewController.view.frame =CGRectMake(rect.origin.x, rect.origin.y + _height, rect.size.width, rect.size.height);
    [self.view addSubview:_rootViewController.view];
    
    _navigationBarJJ = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, _height)];
    _navigationBarJJ.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_navigationBarJJ];
    
    UIView *canvas = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 500)];
    canvas.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:canvas];
}

- (void)pushViewController:(UIViewController *)viewController withAnimation:(BOOL)animation
{
    ((id<NeedMyNavigationController>)viewController).navigationControllerJJ = self;
    CGRect rect =  viewController.view.frame;
    viewController.view.frame =CGRectMake(rect.origin.x, rect.origin.y + _height, rect.size.width, rect.size.height);
    CATransition *ani = [CATransition animation];
    ani.type =@"moveIn";
    [ani setDuration:1];
    [ani setRepeatCount:1.0];
    [viewController.view.layer addAnimation:ani forKey:nil];
    [self.view addSubview:viewController.view];
    [_stackJJ addObject:viewController];
}

- (void)popViewController:(UIViewController *)viewController withAnimation:(BOOL)animation
{
    CATransition *ani = [CATransition animation];
    ani.type =@"reveal";
    [ani setDuration:1];
    [ani setRepeatCount:1.0];
    [viewController.view.layer addAnimation:ani forKey:nil];
    [viewController.view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1];
    [_stackJJ removeObject:viewController];
}

@end
