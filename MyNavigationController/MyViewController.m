//
//  MyViewController.m
//  MyNavigationController
//
//  Created by LJJ on 13-8-1.
//  Copyright (c) 2013年 LJJ. All rights reserved.
//

#import "MyViewController.h"


@implementation MyViewController
@synthesize navigationControllerJJ = _navigationControllerJJ;

- (void)loadView
{
    [super loadView];
    self.view.frame = CGRectMake(0, 0, 320, 508);
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(jjpush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 50)];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(jjpop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)jjpush
{
    MyViewController *VC = [[MyViewController alloc] init];
    VC.view.frame = CGRectMake(0, 0, 320, 508);
    VC.view.backgroundColor = [UIColor redColor];
    [self.navigationControllerJJ pushViewController:VC withAnimation:YES];
}

- (void)jjpop
{
    [self.navigationControllerJJ popViewController:self withAnimation:YES];
}
@end
