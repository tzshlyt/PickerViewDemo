//
//  State.h
//  PickerViewDemo
//
//  Created by lan on 15/10/31.
//  Copyright © 2015年 lan. All rights reserved.
//  地点的数据模型

#import <Foundation/Foundation.h>

@interface State : NSObject
/** 省份的名字 */
@property (nonatomic, copy) NSString *state;
/** 存放城市的模型数组 */
@property (nonatomic, strong) NSArray *cities;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)stateWithDict:(NSDictionary *)dict;

+ (NSArray *)states;

@end
