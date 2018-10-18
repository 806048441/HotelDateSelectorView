//
//  DayHeadView.m
//  CFK_HotelDatePicker
//
//  Created by 神州第一坑 on 2018/10/17.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import "DayHeadView.h"
@interface  DayHeadView()
@property (strong,nonatomic)UILabel * lb;
@end
@implementation DayHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    _lb =[[UILabel alloc]initWithFrame:self.bounds];
    _lb.textAlignment =NSTextAlignmentCenter;
    [self addSubview:_lb];
}
#pragma mark - Custom Accessors
- (void)setCustomProperty:(id)value {
    
}
- (void)setMonthModel:(MonthModel *)monthModel{
    _monthModel =monthModel;
    _lb.text=[NSString stringWithFormat:@"%.4ld年%.2ld月",monthModel.year,monthModel.month];
}
- (id)customProperty {
    
    return [NSObject  new];
}
#pragma mark - IBAction
- (IBAction)submitData:(id)sender {
    
}
#pragma mark - Public
- (void)publicMethod {
    
}
#pragma mark - Private
- (void)privateMethod {
    
}
#pragma mark - Protocol conformance
#pragma mark - UITextFieldDelegate
#pragma mark - UITableViewDataSource
#pragma mark - UITableViewDelegate
#pragma mark - UICollectionViewDelegate

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    
    return [NSObject new];
}
#pragma mark - NSObject
- (NSString *)description {
    
    return [NSString new];
}
@end
