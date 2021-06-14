//
//  UserDetailModel+WCTTableCoding.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/25.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UserDetailModel+WCTTableCoding.h"

@implementation UserDetailModel (WCTTableCoding)

WCDB_IMPLEMENTATION(UserDetailModel)

WCDB_SYNTHESIZE(UserDetailModel, userID)
WCDB_SYNTHESIZE(UserDetailModel, username)
WCDB_SYNTHESIZE(UserDetailModel, gender)
WCDB_SYNTHESIZE(UserDetailModel, company)
WCDB_SYNTHESIZE(UserDetailModel, introduce)

WCDB_PRIMARY(UserDetailModel, userID)

WCDB_INDEX(UserDetailModel, "_index", userID)

@end
