//
//  UserDetailModel.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/25.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "UserDetailModel.h"

@implementation UserDetailModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userID"      : @"id",
             @"username"    : @"name",
             @"gender"      : @"gender",
             @"company"     : @"company",
             @"introduce"   : @"introduce",
             };
}

@end
