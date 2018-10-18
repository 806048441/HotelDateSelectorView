//
//  DayHeadView.h
//  CFK_HotelDatePicker
//
//  Created by 神州第一坑 on 2018/10/17.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DayHeadView : UICollectionReusableView
@property (strong,nonatomic)MonthModel * monthModel;

@end

NS_ASSUME_NONNULL_END
