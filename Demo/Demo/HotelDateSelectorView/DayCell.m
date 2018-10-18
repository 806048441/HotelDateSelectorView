//
//  DayCell.m
//  CFK_HotelDatePicker
//
//  Created by 神州第一坑 on 2018/10/17.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import "DayCell.h"
@interface  DayCell()
@property (strong,nonatomic)UILabel * lb;
@end
@implementation DayCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.contentView.layer.masksToBounds=YES;
    self.contentView.layer.cornerRadius=4;
    _lb =[[UILabel alloc]initWithFrame:self.contentView.bounds];
    _lb.textAlignment =NSTextAlignmentCenter;
    _lb.textColor =[UIColor blackColor];
    self.contentView.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:_lb];
}
#pragma mark - Custom Accessors
- (void)setCustomProperty:(id)value {
    
}
- (void)setDayModel:(DayModel *)dayModel{
    _dayModel =dayModel;
    _lb.text =@(dayModel.date.day).stringValue;
    
    if (dayModel.dayState==NormalState) {
        _lb.textColor =[UIColor whiteColor];
        self.contentView.backgroundColor =[UIColor redColor];
    }
    if (dayModel.dayState==SelectState) {
        _lb.textColor =[UIColor whiteColor];
        self.contentView.backgroundColor =[UIColor greenColor];
    }
    if (dayModel.notOptional) {
        _lb.textColor =[UIColor whiteColor];
        self.contentView.backgroundColor =[UIColor grayColor];
    }
    if (dayModel.dayState==BeignState || dayModel.dayState==EndState) {
        _lb.textColor =[UIColor whiteColor];
        self.contentView.backgroundColor =[UIColor blueColor];
    }
    if (dayModel.ago) {
        self.contentView.backgroundColor =[[UIColor grayColor] colorWithAlphaComponent:0.3];
    }
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
