//
//  HotelDateSelectorView.h
//  Demo
//
//  Created by 神州第一坑 on 2018/10/18.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HotelDateSelectorView : UIView
- (instancetype)initWithFrame:(CGRect)frame beginDate:(NSDate*)beinDate endDate:(NSDate*)endDate;
- (instancetype)initWithFrame:(CGRect)frame beginDate:(NSDate*)beinDate durationMonths:(NSInteger)durationMonths;
- (instancetype)initWithFrame:(CGRect)frame beginDate:(NSDate*)beinDate durationDays:(NSInteger)durationDays;
@property (assign,nonatomic)DayModel * beginModel;
@property (assign,nonatomic)DayModel * endDayModel;
@property (copy,nonatomic)void(^daySelectBlock)(DayModel*beginModel,DayModel*endModel);
@end

NS_ASSUME_NONNULL_END
