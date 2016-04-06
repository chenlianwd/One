//
//  CHLHomeModel.m
//  One
//
//  Created by 陈亮 on 16/4/5.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import "CHLHomeModel.h"

@implementation CHLHomeModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)HomeModelWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
