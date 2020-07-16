//
//  UUIDTools.m
//  FSEDU
//
//  Created by 张晓伟 on 2018/8/23.
//  Copyright © 2018年 青岛广电传媒电子商务有限公司. All rights reserved.
//

#import "UUIDTools.h"
#import "KeyChainStore.h"

@implementation UUIDTools

+ (NSString *)getUUID {
    //获取项目的bundle ID
    NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
    //根据bundle ID拼接一个自定义的key用来作为keychain里面的唯一标示
    //NSString *keyUUid = [NSString stringWithFormat:@"%@.uuid",bundleId];
    //将bundle ID作为唯一key在keychain里面获取保存的uuid
    NSString * strUUID = (NSString *)[KeyChainStore load:bundleId];
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID || [strUUID containsString:@"-"]){
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        //对UUID 进行MD5加密
        strUUID = [(NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef)) MD5Hash];
        //将加密后的uuid保存到keychain
        [KeyChainStore save:bundleId data:strUUID];
        
    }
    return strUUID;
}

@end
