//
//  CHLMovieCellModel.h
//  One
//
//  Created by 陈亮 on 16/4/5.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHLMovieCellModel : NSObject

@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * verse;
@property (nonatomic, copy) NSString * verse_en;
@property (nonatomic, copy) NSString * score;
@property (nonatomic, copy) NSString * revisedscore;
@property (nonatomic, copy) NSString * releasetime;
@property (nonatomic, copy) NSString * scoretime;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * servertime;
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
//"id": "48",
//"title": "火锅英雄",
//"verse": "",
//"verse_en": "",
//"score": "71",
//"revisedscore": "0",
//"releasetime": "2016-04-01 00:00:00",
//"scoretime": "2016-04-02 00:00:00",
//"cover": "http://image.wufazhuce.com/FpW4ktC19rR8Kkw1FsIADCqCs_lo",
//"servertime": 1459854937