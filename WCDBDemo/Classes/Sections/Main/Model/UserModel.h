//
//  UserModel.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>
#import "YYModel.h"

typedef NS_ENUM(NSInteger, UserGender) {
    UserGenderMale       = 0,
    UserGenderFemale     = 1,
};

@interface UserModel : NSObject <WCTTableCoding>

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, assign) UserGender gender;

WCDB_PROPERTY(userID)
WCDB_PROPERTY(username)
WCDB_PROPERTY(gender)

@end
