//
//  City.h
//  PickerViewDemo
//
//  Created by lan on 15/10/31.
//  Copyright © 2015年 lan. All rights reserved.
//  城市的数据模型

#import <Foundation/Foundation.h>

@interface City : NSObject

/** 城市名字 */
@property (nonatomic, copy) NSString *city;
/** 存放地区的字符串数组 */
@property (nonatomic, strong) NSArray *areas;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)cityWithDict:(NSDictionary *)dict;

/** 传入一个城市的数组返回城市模型数组 */
+ (NSArray *)citiesWithArray:(NSArray *)array;

@end
