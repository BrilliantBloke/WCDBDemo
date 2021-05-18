//
//  MainManager.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

@interface MainManager : NSObject

+ (MainManager *)sharedManager;

- (void)fetchUserListWithHandler:(void(^)(NSError *error, NSArray<UserModel *> *list))handler;

- (NSArray<UserModel *> *)getCachedUserList;

- (BOOL)updateUserWithUserID:(NSString *)userID
                    username:(NSString *)username;

@end
