//
//  MonthModel.m
//  CFK_HotelDatePicker
//
//  Created by 神州第一坑 on 2018/10/17.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import "MonthModel.h"
@implementation DayModel
- (void)setDate:(NSDate *)date{
    
    _date = [date dateStringWithFormat:@"yyyy-MM-dd"].date;
    
}
- (BOOL)ago{
    NSString *todayString = [[NSDate date] dateStringWithFormat:@"yyyy-MM-dd"];
    NSInteger todayTimeSp = todayString.date.timestamp;
    NSString *selfString =[self.date dateStringWithFormat:@"yyyy-MM-dd"];
    NSInteger selfTimeSp = selfString.date.timestamp;
    return selfTimeSp<todayTimeSp;
}
- (BOOL)today{
    //    NSString *todayString = [[NSDate date] dateStringWithFormat:@"yyyy-MM-dd"];
    //    NSInteger todayTimeSp = todayString.date.timestamp;
    //    NSString *selfString =[self.date dateStringWithFormat:@"yyyy-MM-dd"];
    //    NSInteger selfTimeSp = selfString.date.timestamp;
    
    return self.date.isToday;
}
- (BOOL)tomorrow{
    //    NSString *tomorrowString = [[NSDate date] dateStringWithFormat:@"yyyy-MM-dd"];
    //    NSInteger tomorrowTimeSp = tomorrowString.date.timestamp;
    //    NSString *selfString =[self.date dateStringWithFormat:@"yyyy-MM-dd"];
    //    NSInteger selfTimeSp = selfString.date.timestamp;
    NSDate *creatDate = [self.date dateByAddingDays:-1];
    return [creatDate isToday];
}
@end

@implementation MonthModel
- (NSInteger)beginIndex{
    if (self.days.count) {
        DayModel *day =[self.days firstObject];
        NSInteger weekIndex=[day.date weekday];
        return weekIndex-1;
    }else{
        return 0;
    }
}
@end
