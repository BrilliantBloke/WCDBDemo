//
//  UserModel.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userID"      : @"id",
             @"username"    : @"name",
             @"gender"      : @"gender",
             };
}

WCDB_IMPLEMENTATION(UserModel)

WCDB_SYNTHESIZE(UserModel, userID)
WCDB_SYNTHESIZE(UserModel, username)
WCDB_SYNTHESIZE(UserModel, gender)


WCDB_PRIMARY(UserModel, userID)

WCDB_INDEX(UserModel, "_index", userID)

@end
