//
//  MainDatabase.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;
@class UserDetailModel;

@interface MainDatabase : NSObject

+ (MainDatabase *)shared;

/**
 增
 */
- (BOOL)insertUsers:(NSArray<UserModel *> *)users;
- (BOOL)insertUserDetail:(UserDetailModel *)userDetail;

/**
 删
 */
- (BOOL)deleteUserWithID:(NSString *)userID;
- (BOOL)deleteUsersWithIDs:(NSArray<NSString *> *)userIDs;

/**
 改
 */
- (BOOL)updateUserWithUserID:(NSString *)userID
                    username:(NSString *)username;

/**
 查
 */
- (NSArray<UserModel *> *)getUserList;

@end


