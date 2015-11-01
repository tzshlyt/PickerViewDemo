//
//  City.m
//  PickerViewDemo
//
//  Created by lan on 15/10/31.
//  Copyright © 2015年 lan. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //[self setValuesForKeysWithDictionary:dict];
        [self setValue:dict[@"city"] forKey:@"city"];
        
        self.areas = dict[@"areas"];
    }
    return self;
}

+ (instancetype)cityWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)citiesWithArray:(NSArray *)array {
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self cityWithDict:dict]];
    }
    return  arrayM;
}




@end
