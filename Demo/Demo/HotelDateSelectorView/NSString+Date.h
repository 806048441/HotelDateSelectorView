//
//  NSString+Date.h
//  CFK_HotelDatePicker
//
//  Created by 神州第一坑 on 2018/10/17.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Date)
- (NSDate *)date;
+ (NSInteger)compareDate:(NSDate *)fromDate1 withDate:(NSDate *)fromDate2;
@end

NS_ASSUME_NONNULL_END
