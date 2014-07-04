//
//  MainViewController.m
//  testDownload
//
//  Created by MinwenYi on 14-7-3.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "SIBreakpointsDownload.h"
#import "SIDownloadManager.h"

@interface MainViewController ()
@property (nonatomic,strong) SIDownloadManager *siDownloadManager;

@end

@implementation MainViewController
NSString *urlTwo = @"http://dl_dir.qq.com/qqfile/qq/QQforMac/QQ_V1.4.1.dmg";
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(30, 30, 260, 30)];
    [btn addTarget:self action:@selector(downloadVideo) forControlEvents:UIControlEventTouchUpInside];
    UIButton *canBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [canBtn setFrame:CGRectMake(30, 120, 260, 30)];
    [canBtn addTarget:self action:@selector(stopDownload) forControlEvents:UIControlEventTouchUpInside];
    [canBtn setTitle:@"Stop" forState:UIControlStateNormal];
    [btn setTitle:@"Download" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [self.view addSubview:canBtn];
//    self.progressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
//    [self.view addSubview:self.progressBar];
    self.progressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(0,70, 320, 30)];
    [self.view addSubview:_progressBar];
    _siDownloadManager = [SIDownloadManager sharedSIDownloadManager];
}
- (void)stopDownload
{
    [_siDownloadManager cancelDownloadFileTaskInQueue:urlTwo];
}
- (void)downloadVideo
{
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//    
//    NSString *downloadPath = [path stringByAppendingPathComponent:@"fuck.mp4"];
//    
//    self.download = [ApplicationDelegate.downLoadEngine     downLoadForm:@"http://bcs.duapp.com/desedata/laoluo.mp4" tofile:downloadPath];
//    

   
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    NSString *downloadPath = [cachesDirectory stringByAppendingPathComponent:@"1.4.dmg"];
    
    [_siDownloadManager addDownloadFileTaskInQueue:urlTwo
                                        toFilePath:downloadPath
                                  breakpointResume:YES
                                       rewriteFile:NO];
//    [_siDownloadManager onDownloadProgressChanged:^(double progress){
//        
//        DLog(@"%.2f", progress*100.0);
//        self.progressBar.progress = progress;
//    }];
}

#pragma mark - progressbardelegate

- (void)downloadManager:(SIDownloadManager *)siDownloadManager withOperation:(SIBreakpointsDownload *)paramOperation changeProgress:(double)paramProgress

{
	if([urlTwo isEqualToString:paramOperation.url]){
        _progressBar.progress = paramProgress;
//        [_labelTwo setText:[NSString stringWithFormat:@"%.1f%%", paramProgress * 100]];
    
    }

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _siDownloadManager.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_siDownloadManager setDelegate:nil];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downloadManagerPauseTask:(SIDownloadManager *)siDownloadManager
                         withURL:(NSString *)paramURL
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
