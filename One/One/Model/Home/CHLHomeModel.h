//
//  CHLHomeModel.h
//  One
//
//  Created by 陈亮 on 16/4/5.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHLHomeModel : NSObject
@property (nonatomic, copy) NSString * hpcontent_id;
@property (nonatomic, copy) NSString * hp_title;
@property (nonatomic, copy) NSString * author_id;
@property (nonatomic, copy) NSString * hp_img_url;
@property (nonatomic, copy) NSString * hp_author;
@property (nonatomic, copy) NSString * hp_content;
@property (nonatomic, copy) NSString * hp_img_original_url;
@property (nonatomic, copy) NSString * hp_makettime;
@property (nonatomic, copy) NSString * last_update_date;
@property (nonatomic, copy) NSString * web_url;
@property (nonatomic, assign) NSUInteger praisenum;
@property (nonatomic, assign) NSUInteger sharenum;
@property (nonatomic, assign) NSUInteger commentnum;
@property (nonatomic, copy) NSString * ipad_url;
@property (nonatomic, copy) NSString * wb_img_url;
+(instancetype)HomeModelWithDictionary:(NSDictionary *)dict;


@end


//"res": 0,
//"data": [
//         {
//             "hpcontent_id": "1300",
//             "hp_title": "VOL.1276",
//             "author_id": "-1",
//             "hp_img_url": "http://image.wufazhuce.com/Frep0QUGuIUBrJ3OeEVfn7MJbdTo",
//             "hp_img_original_url": "http://image.wufazhuce.com/Frep0QUGuIUBrJ3OeEVfn7MJbdTo",
//             "hp_author": "电车派对&Kori Song 作品",
//             "ipad_url": "http://image.wufazhuce.com/FiMtvcXZPYpYq0sC-TEEgQ2Bpf2m",
//             "hp_content": "自以为用这颗小小的心脏包裹住了波澜壮阔，给这片山川湖海围上了栅栏，不放出那匹脱缰野马，这样就不会有人从我假意的冷淡里，拎出些滚烫的秘密。 by 陈大力",
//             "hp_makettime": "2016-04-04 23:00:00",
//             "last_update_date": "2016-04-04 21:21:54",
//             "web_url": "http://m.wufazhuce.com/one/1300",
//             "wb_img_url": "",
//             "praisenum": 15458,
//             "sharenum": 2115,
//             "commentnum": 307
//         },
//         {