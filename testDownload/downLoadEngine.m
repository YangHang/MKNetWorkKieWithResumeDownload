//
//  downLoadEngine.m
//  testDownload
//
//  Created by MinwenYi on 14-7-3.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "downLoadEngine.h"

@implementation downLoadEngine

- (MKNetworkOperation *)downLoadForm:(NSString *)remoteurl tofile:(NSString *)filePath

{
    MKNetworkOperation *op = [self operationWithURLString:remoteurl];
    
    [op addDownloadStream:[NSOutputStream outputStreamToFileAtPath:filePath
                                                            append:YES]];
    
    [self enqueueOperation:op];
    return op;
}

@end
