//
//  UserDetailModel+WCTTableCoding.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/25.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UserDetailModel.h"
#import <WCDB/WCDB.h>

@interface UserDetailModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(userID)
WCDB_PROPERTY(username)
WCDB_PROPERTY(gender)
WCDB_PROPERTY(company)
WCDB_PROPERTY(introduce)

@end
