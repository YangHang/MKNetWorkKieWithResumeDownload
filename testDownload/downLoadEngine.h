//
//  downLoadEngine.h
//  testDownload
//
//  Created by MinwenYi on 14-7-3.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface downLoadEngine : MKNetworkEngine

- (MKNetworkOperation *)downLoadForm:(NSString *)remoteurl tofile:(NSString *)filePath;
@end
