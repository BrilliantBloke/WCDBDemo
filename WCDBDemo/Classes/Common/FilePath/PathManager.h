//
//  PathManager.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathManager : NSObject

+ (instancetype)shared;

//全局路径 ~/Documents/Global
- (NSString *)globalPath;

@end
