//
//  Company+WCTColumnCoding.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/25.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "Company.h"
#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

@interface Company (WCTColumnCoding) <WCTColumnCoding>
@end

@implementation Company (WCTColumnCoding)

// 存储为BLOB
//+ (instancetype)unarchiveWithWCTValue:(NSData *)value
//{
//    NSString *companyJSON = [NSKeyedUnarchiver unarchiveObjectWithData:value];
//    Company *company = [Company yy_modelWithJSON:companyJSON];
//    return value ? company : nil;
//}
//
//- (NSData *)archivedWCTValue
//{
//    NSString *companyJSON = [self yy_modelToJSONString];
//    return [NSKeyedArchiver archivedDataWithRootObject:companyJSON];
//}
//
//+ (WCTColumnType)columnTypeForWCDB
//{
//    return WCTColumnTypeBinary;
//}

// 测试时，如果要切换存储类型，需要把原来的数据库删除
// 存储为String
+ (instancetype)unarchiveWithWCTValue:(NSString *)value
{
    Company *company = [Company yy_modelWithJSON:value];
    return value ? company : nil;
}

- (NSString *)archivedWCTValue
{
    return [self yy_modelToJSONString];
}

+ (WCTColumnType)columnTypeForWCDB
{
    return WCTColumnTypeString;
}

@end
