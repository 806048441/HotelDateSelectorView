//
//  NSString+Date.m
//  CFK_HotelDatePicker
//
//  Created by 神州第一坑 on 2018/10/17.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)
//+ (NSString *)stringByDate:(NSString *)format Date:(NSDate *)date;
//{
//    NSDate *currentTime = date;
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
//    [formatter setTimeZone:timeZone];
//    [formatter setDateFormat:format];
//    NSString *timeString = [formatter stringFromDate:currentTime];
//    
//    return timeString;
//}

- (NSDate *)date
{
    if (!self.length) {
        return [NSDate date];
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}
+(NSInteger )compareDate:(NSDate *)fromDate1 withDate:(NSDate *)fromDate2{
    NSInteger status;
    NSComparisonResult result = [fromDate1 compare:fromDate2];
    switch (result){
            //date02比date01大
        case NSOrderedAscending: status=1; break;
            //date02比date01小
        case NSOrderedDescending: status=-1; break;
            //date02=date01
        case NSOrderedSame: status=0; break;
        default: NSLog(@"erorr dates %@, %@", fromDate2, fromDate1); break;
    }
    return status;
}
@end
