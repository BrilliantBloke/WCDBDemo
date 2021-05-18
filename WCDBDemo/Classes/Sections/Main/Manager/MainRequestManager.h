//
//  MainRequestManager.h
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

@interface MainRequestManager : NSObject

+ (MainRequestManager *)sharedManager;

- (void)fetchUserListWithHandler:(void(^)(NSError *error, NSArray<UserModel *> *list))handler;

@end
