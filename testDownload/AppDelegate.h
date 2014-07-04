//
//  AppDelegate.h
//  testDownload
//
//  Created by MinwenYi on 14-7-3.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "downLoadEngine.h"

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic ) downLoadEngine *downLoadEngine;

@end
