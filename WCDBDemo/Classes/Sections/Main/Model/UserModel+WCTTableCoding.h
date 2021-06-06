//
//  UserModel+WCTTableCoding.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/24.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UserModel.h"
#import <WCDB/WCDB.h>

@interface UserModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(userID)
WCDB_PROPERTY(username)
WCDB_PROPERTY(gender)
WCDB_PROPERTY(company)

@end
