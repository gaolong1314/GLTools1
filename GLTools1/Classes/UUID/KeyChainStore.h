//
//  KeyChainStore.h
//  FSEDU
//
//  Created by 张晓伟 on 2018/8/23.
//  Copyright © 2018年 青岛广电传媒电子商务有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;

@end
