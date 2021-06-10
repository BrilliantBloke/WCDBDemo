//
//  UserModel+WCTTableCoding.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/25.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UserModel+WCTTableCoding.h"

@implementation UserModel (WCTTableCoding)

WCDB_IMPLEMENTATION(UserModel)

WCDB_SYNTHESIZE(UserModel, userID)
WCDB_SYNTHESIZE(UserModel, username)
WCDB_SYNTHESIZE(UserModel, gender)
WCDB_SYNTHESIZE(UserModel, company)

WCDB_PRIMARY(UserModel, userID)

WCDB_INDEX(UserModel, "_index", userID)

@end
