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

@end
