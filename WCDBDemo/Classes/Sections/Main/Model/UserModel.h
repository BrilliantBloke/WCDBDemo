//
//  UserModel.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
#import "Company.h"

typedef NS_ENUM(NSInteger, UserGender) {
    UserGenderMale       = 0,
    UserGenderFemale     = 1,
};

@interface UserModel : NSObject

/**
 用户ID
 */
@property (nonatomic, copy)     NSString    *userID;

/**
 用户名
 */
@property (nonatomic, copy)     NSString    *username;

/**
 性别
 */
@property (nonatomic, assign)   UserGender  gender;

/**
 公司
 */
@property (nonatomic, strong)   Company     *company;


@end
