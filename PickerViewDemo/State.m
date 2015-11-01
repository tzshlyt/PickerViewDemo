//
//  State.m
//  PickerViewDemo
//
//  Created by lan on 15/10/31.
//  Copyright © 2015年 lan. All rights reserved.
//

#import "State.h"
#import "City.h"

@implementation State

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //[self setValuesForKeysWithDictionary:dict];
        
        [self setValue:dict[@"state"] forKey:@"state"];
        
        self.cities = [City citiesWithArray:dict[@"cities"]];
        
    }
    return self;
}

+ (instancetype)stateWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)states {
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self stateWithDict:dict]];
    }
    return  arrayM;
}


@end
