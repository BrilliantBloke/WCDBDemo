//
//  MainRequestManager.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "MainRequestManager.h"
#import "AFNetworking.h"
#import "UserModel.h"

static NSString *URLString = @"http://www.mocky.io/v2/599f81482c0000580351d4f8";

@implementation MainRequestManager

+ (MainRequestManager *)sharedManager {
    static dispatch_once_t onceToken;
    static MainRequestManager *requestManager;
    dispatch_once(&onceToken, ^{
        requestManager = [MainRequestManager new];
    });
    
    return requestManager;
}

- (void)fetchUserListWithHandler:(void(^)(NSError *error, NSArray<UserModel *> *list))handler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        NSArray *resultList = nil;
        if (responseObject && [responseObject isKindOfClass:NSDictionary.class]) {
            NSDictionary *responseData = (NSDictionary *)responseObject;
            NSInteger code = [[responseData objectForKey:@"code"] integerValue];
            if (code == 200) {
                NSArray *result = [responseData objectForKey:@"result"];
                resultList = [NSArray yy_modelArrayWithClass:UserModel.class json:result];
            } else {
                error = [NSError errorWithDomain:@"PostRequestErrorDomain" code:code userInfo:@{NSLocalizedDescriptionKey: @"服务器错误"}];
            }
        }
        
        if (handler) {
            handler(error, resultList);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"aa");
        if (handler) {
            
            handler(error, nil);
        }
    }];
}

@end
