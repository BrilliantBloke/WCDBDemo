//
//  PathManager.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "PathManager.h"

@interface PathManager ()
@property (nonatomic,copy)  NSString    *globalPath;
@end

@implementation PathManager

+ (instancetype)shared
{
    static PathManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PathManager alloc] init];
    });
    return instance;
}

- (NSString *)globalPath
{
    if (_globalPath == nil)
    {
        NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *path = [document stringByAppendingPathComponent:@"Global"];
        [self createDirIfExists:path];
        
        BOOL isDir = NO;
        if ([[NSFileManager defaultManager] fileExistsAtPath:path
                                                 isDirectory:&isDir] && isDir) {
            _globalPath = path;
        }
    }
    return _globalPath;
}

- (void)createDirIfExists:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path])
    {
        [fileManager createDirectoryAtPath:path
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
}


@end
