//
//  Company.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/24.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "Company.h"

@implementation Company

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name"    : @"name",
             @"address" : @"address",
             };
}

@end
