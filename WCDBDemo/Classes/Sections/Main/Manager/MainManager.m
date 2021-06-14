//
//  MainManager.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "MainManager.h"
#import "MainRequestManager.h"
#import "MainDatabase.h"

@implementation MainManager

+ (MainManager *)sharedManager {
    static dispatch_once_t onceToken;
    static MainManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [MainManager new];
    });
    
    return manager;
}

- (void)fetchUserListWithHandler:(void(^)(NSError *error, NSArray<UserModel *> *list))handler {
    [[MainRequestManager sharedManager] fetchUserListWithHandler:^(NSError *error, NSArray<UserModel *> *list) {
        if (!error) {
            // 保存数据库
            [self saveUserList:list];
            // 发送通知
            
            // 返回上层
            if (handler) {
                handler(error, list);
            }
        }
    }];
}

#pragma mark - 数据库方法
- (BOOL)saveUserList:(NSArray<UserModel *> *)users {
    if (users.count > 0) {
        return [[MainDatabase shared] insertUsers:users];
    }
    return NO;
}

- (BOOL)saveUserDetail:(UserDetailModel *)userDetail {
    if (userDetail) {
        return [[MainDatabase shared] insertUserDetail:userDetail];
    }
    return NO;
}

- (NSArray<UserModel *> *)getCachedUserList {
    return [[MainDatabase shared] getUserList];
}

- (BOOL)updateUserWithUserID:(NSString *)userID
                    username:(NSString *)username {
    return [[MainDatabase shared] updateUserWithUserID:userID username:username];
}

@end
