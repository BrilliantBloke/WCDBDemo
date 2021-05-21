//
//  MainDatabase.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "MainDatabase.h"
#import <WCDB/WCDB.h>
#import "UserModel+WCTTableCoding.h"
#import "PathManager.h"

@interface MainDatabase()

@property (nonatomic, strong) WCTDatabase *database;

@end

static NSString * const UsersTableName = @"UsersTable";

@implementation MainDatabase

+ (MainDatabase *)shared {
    static dispatch_once_t onceToken;
    static MainDatabase *database;
    
    dispatch_once(&onceToken, ^{
        database = [MainDatabase new];
    });
    
    return database;
}

- (WCTDatabase *)database {
    if (!_database) {
        NSString *path = [[[PathManager shared] globalPath] stringByAppendingPathComponent:@"user.db"];
        NSLog(@"*** WCDB User Path: %@", path);
        _database = [[WCTDatabase alloc] initWithPath:path];
        
        // 加密
        NSData *cipherKey = [@"123456" dataUsingEncoding:NSASCIIStringEncoding];
        [_database setCipherKey:cipherKey];
        
        // 创建表、索引
        BOOL result = [_database createTableAndIndexesOfName:UsersTableName
                                                   withClass:UserModel.class];
        
    }
    return _database;
}

#pragma mark - 
#pragma mark - 增
- (BOOL)insertUsers:(NSArray<UserModel *> *)users {
    return [self.database insertOrReplaceObjects:users
                                            into:UsersTableName];
}

#pragma mark - 删
- (BOOL)deleteUserWithID:(NSString *)userID {
    return [self.database deleteObjectsFromTable:UsersTableName
                                           where:UserModel.userID == userID];
}

- (BOOL)deleteUsersWithIDs:(NSArray<NSString *> *)userIDs {
    return [self.database deleteObjectsFromTable:UsersTableName
                                           where:UserModel.userID.in(userIDs)];
}

#pragma mark - 改
- (BOOL)updateUserWithUserID:(NSString *)userID
                    username:(NSString *)username {
    UserModel *user = [[UserModel alloc] init];
    user.username = username;
    BOOL result = [self.database updateRowsInTable:UsersTableName
                                        onProperty:UserModel.username
                                        withObject:user
                                             where:UserModel.userID == userID];
    return result;
}

#pragma mark - 查
- (NSArray<UserModel *> *)getUserList {
    return [self.database getAllObjectsOfClass:UserModel.class
                                     fromTable:UsersTableName];
    
    // 条件查询
    return [self.database getObjectsOfClass:UserModel.class
                                  fromTable:UsersTableName
                                      where:UserModel.gender == 1
                                    orderBy:UserModel.userID.order()
                                      limit:10];
    
    
}



@end
