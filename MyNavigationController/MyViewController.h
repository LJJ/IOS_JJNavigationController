//
//  MyViewController.h
//  MyNavigationController
//
//  Created by LJJ on 13-8-1.
//  Copyright (c) 2013年 LJJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJNavigationController.h"

@interface MyViewController : UIViewController <NeedMyNavigationController>

@property (nonatomic, weak) JJNavigationController *myNavigationController;

@end
