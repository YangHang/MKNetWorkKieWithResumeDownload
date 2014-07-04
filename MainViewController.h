//
//  MainViewController.h
//  testDownload
//
//  Created by MinwenYi on 14-7-3.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "downLoadEngine.h"
#import "SIDownloadManager.h"
#import "SIBreakpointsDownload.h"

@interface MainViewController : UIViewController <SIDownloadManagerDelegate>
@property (nonatomic,strong) UIProgressView *progressBar;
@property (nonatomic,strong) MKNetworkOperation *download;
@property (nonatomic,strong) downLoadEngine *downLoadEngine;
@end
