//
//  ViewController.m
//  PickerViewDemo
//
//  Created by lan on 15/10/31.
//  Copyright © 2015年 lan. All rights reserved.
//

#import "ViewController.h"
#import "State.h"
#import "City.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>


// 分别存放省、城市、地区
@property (nonatomic, strong) NSArray *states;
@property (nonatomic, strong) NSArray *citys;
@property (nonatomic, strong) NSArray *areas;

// 最终选择的地点
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *area;

/** 地点选择器 */
@property (nonatomic, strong) UIPickerView *pickerView;

/** 用来显示最终选择地点 */
@property (nonatomic, strong) UILabel *showLab;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建显示的 Label
    self.showLab = [[UILabel alloc] init];
    self.showLab.frame = CGRectMake(80, 120, 320, 44);
    self.showLab.text = @"地点：";
    [self.view addSubview:self.showLab];

    // 创建选择器
    self.pickerView = [[UIPickerView alloc] init];
    self.pickerView.frame = CGRectMake(0, 180, 320, 200);
    [self.view addSubview:self.pickerView];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    // 初始化填充
    self.states = [State states];
    
    State *state = self.states[0];
    self.citys = state.cities;
    
    City *city = self.citys[0];
    self.areas = city.areas;
    
}
#pragma mark - UIPickerViewDataSource 数据源方法
// 设置有几组组件可以选择，这里是 省份-城市-地区 3块组件
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// 每个组件里面有多少数据，component表示组件序号，第一个从0开始，以此类推
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return self.states.count;
            break;
        case 1:
            return self.citys.count;
            break;
        case 2:
            return self.areas.count;
            break;
        default:
            return 0;
    }
}

#pragma mark - UIPickerViewDelegate 代理方法
// 给每个组件设置内容，即你滚动中显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    switch (component) {
        case 0: {
            State *state = self.states[row];
            NSString *str = state.state;
            return str;
            break;
        }
            
        case 1: {
            City *city = self.citys[row];
            return city.city;
            break;
        }
            
        case 2: {
            
            // 因为plist文件中地区可能为空，需要判断，否则会出错
            if (self.areas.count != 0) {
                return self.areas[row];
            }else {
                return @"";
            }
            break;
        }
            
        default:
            return @"";
            break;
    }
}

// 选中时候调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    switch (component) {
        case 0: {
            State *state = self.states[row];
            self.citys = state.cities;
            
            self.state = state.state; //
            
            // 让后面两个组件产生随第一个组件联动
            [self.pickerView selectRow:0 inComponent:1 animated:YES];
            [self.pickerView reloadComponent:1];
            
            City *city = self.citys[0];
            self.areas = city.areas;
            
            self.city = city.city;
            
            [self.pickerView selectRow:0 inComponent:2 animated:YES];
            [self.pickerView reloadComponent:2];

            if (self.areas.count != 0) {
                self.area = self.areas[0];
            } else {
                self.area = @"";
            }
            
            break;
        }
            
        case 1: {
            City *city = self.citys[row];
            self.areas = city.areas;
            
            self.city = city.city;
            
            // 让第三个组件随第二个选择联动
            [self.pickerView selectRow:0 inComponent:2 animated:YES];
            [self.pickerView reloadComponent:2];
            
            if (self.areas.count != 0) {
                self.area = self.areas[0];
            }else {
                self.area = @"";
            }
            
            break;
        }
            
        case 2: {
            
            if (self.areas.count != 0) {
                self.area = self.areas[row];
            }
            break;
        }
    }
    // 显示
    self.showLab.text = [NSString stringWithFormat:@"地点：%@ %@ %@", self.state, self.city, self.area];
    NSLog(@"%@ %@ %@", self.state, self.city, self.area);
}

@end
