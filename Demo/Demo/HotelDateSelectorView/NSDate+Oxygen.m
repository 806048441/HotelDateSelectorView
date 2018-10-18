//
//  NSDate+Oxygen.m
//  Oxygen
//
//  Created by ygz&ssp on 13-4-27.
//  Copyright (c) 2013年 Jiang Su Nanyi Digital Dna Science & Technology CO.LTD. All rights reserved.
//
/// 日期时间格式化
#define date2String(format, date)						[date dateStringWithFormat : format]
#define date2StringFormatYMDHMS(date)					[date dateStringWithFormat : @"yyyy-MM-dd HH:mm:ss"]
#define date2StringFormatYMDHM(date)					[date dateStringWithFormat : @"yyyy-MM-dd HH:mm"]
#define date2StringFormatYMD(date)						[date dateStringWithFormat : @"yyyy-MM-dd"]
#define date2StringFormatYM(date)						[date dateStringWithFormat : @"yyyy-MM"]
#define date2StringFormatYMZH(date)						[date dateStringWithFormat : @"yyyy年M月"]

#define date2StringFormatMD(date)						[date dateStringWithFormat : @"MM-dd"]
#define date2StringFormatMDHM(date)						[date dateStringWithFormat : @"MM-dd HH:mm"]
#define date2StringFormatHM(date)						[date dateStringWithFormat : @"HH:mm"]
#define date2StringFormatHMS(date)						[date dateStringWithFormat : @"HH:mm:ss"]
#define date2StringFormatCEMD(date)						[date dateStringWithFormat : @"EEE M月d日"]

#define string2Date(format, str)						[str stringDateWithFormat : format];
#define string2DateFormatYMDHMS(str)					[str stringDateWithFormat : @"yyyy-MM-dd HH:mm:ss"]
#define string2DateFormatYMDHM(str)						[str stringDateWithFormat : @"yyyy-MM-dd HH:mm"]
#define string2DateFormatYMD(str)						[str stringDateWithFormat : @"yyyy-MM-dd"]
#define string2DateFormatYM(str)						[str stringDateWithFormat : @"yyyy-MM"]
#define string2DateFormatYMZH(str)						[str stringDateWithFormat : @"yyyy年M月"]
#define string2DateFormatMD(str)						[str stringDateWithFormat : @"MM-dd"]
#define string2DateFormatMDHM(str)						[str stringDateWithFormat : @"MM-dd HH:mm"]
#define string2DateFormatHM(str)						[str stringDateWithFormat : @"HH:mm"]
#define string2DateFormatHMS(str)						[str stringDateWithFormat : @"HH:mm:ss"]
#define string2DateFormatCEMD(str)						[str stringDateWithFormat : @"EEE M月d日"]
#import "NSDate+Oxygen.h"
@implementation NSDate (Oxygen)

+ (NSString *)getCurrentTime
{
	NSDate			*nowUTC			= [NSDate date];
	NSDateFormatter *dateFormatter	= [[NSDateFormatter alloc] init];

	[dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
	return [dateFormatter stringFromDate:nowUTC];
}

+ (NSString *)getTimestamp
{
	NSDate *now = [NSDate date];

	return date2String(@"yyyyMMddHHmmssSSS", now);
}

- (NSInteger)year
{
	return [self.components year];
}

- (NSInteger)month
{
	return [self.components month];
}

- (NSInteger)day
{
	return [self.components day];
}

- (NSInteger)hour
{
	return [self.components hour];
}

- (NSInteger)minute
{
	return [self.components minute];
}

- (NSInteger)second
{
	return [self.components second];
}

- (NSInteger)week
{
	return [self.components weekOfYear];
}

- (NSDateComponents *)components
{
	return [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
}

- (NSDate *)dateWithoutTime
{
	NSCalendar			*calendar	= [NSCalendar currentCalendar];
	NSDateComponents	*components = [calendar components:(NSCalendarUnitYear
		| NSCalendarUnitMonth
		| NSCalendarUnitDay)
		fromDate:self];

	return [calendar dateFromComponents:components];
}

- (NSDate *)dateByAddingDays:(NSInteger)days months:(NSInteger)months years:(NSInteger)years
{
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];

	dateComponents.day		= days;
	dateComponents.month	= months;
	dateComponents.year		= years;

	return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
			toDate	:self
			options :0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days
{
	return [self dateByAddingDays:days months:0 years:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months
{
	return [self dateByAddingDays:0 months:months years:0];
}

- (NSDate *)dateByAddingYears:(NSInteger)years
{
	return [self dateByAddingDays:0 months:0 years:years];
}

- (NSDate *)monthStartDate
{
	NSDate *monthStartDate = nil;

	[[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth
	startDate	:&monthStartDate
	interval	:NULL
	forDate		:self];

	return monthStartDate;
}

- (NSDate *)weekStartDate
{
	NSDate *weekStartDate = nil;

	[[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfYear
	startDate	:&weekStartDate
	interval	:NULL
	forDate		:self];

	return weekStartDate;
}

- (NSUInteger)numberOfDaysInMonth
{
	return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay
			inUnit									:NSCalendarUnitMonth
			forDate									:self].length;
}

- (NSUInteger)numberOfWeeksInYear
{
	return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfYear
			inUnit									:NSCalendarUnitYear
			forDate									:self].length;
}

- (NSUInteger)weekday
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

	NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:self];

	return [weekdayComponents weekday];
}

- (NSString *)dateStringWithFormat:(NSString *)format
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

	[formatter setDateFormat:format];

	return [formatter stringFromDate:self];
}

- (NSUInteger)daysSinceDate:(NSDate *)from
{
	NSCalendar			*calendar	= [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	unsigned int		unitFlag	= NSCalendarUnitDay;
	NSDateComponents	*components = [calendar components:unitFlag fromDate:from toDate:self options:0];
	NSInteger			days		= [components day];

	return days;
}

- (NSInteger)timeSp{
    
    return (long)[self timeIntervalSince1970];
}
- (NSString*)lunarYearString{
    NSCalendar *chineseCalendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit calenderUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [chineseCalendar components:calenderUnit fromDate:self];
    return [self yearOfChineseString:components.year];
}
- (NSString*)lunarMonthString{
    NSCalendar *chineseCalendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit calenderUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [chineseCalendar components:calenderUnit fromDate:self];
    return self.lunarMonths[components.month];
}
- (NSString*)lunarDayString{
    NSCalendar *chineseCalendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit calenderUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [chineseCalendar components:calenderUnit fromDate:self];
    return self.lunarDays[components.day];
}
- (NSInteger)lunarYear{
    NSCalendar *chineseCalendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit calenderUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [chineseCalendar components:calenderUnit fromDate:self];
    return components.year;
}
- (NSInteger)lunarMonth{
    NSCalendar *chineseCalendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit calenderUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [chineseCalendar components:calenderUnit fromDate:self];
    return components.month;
}
- (NSInteger)lunarDay{
    NSCalendar *chineseCalendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit calenderUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [chineseCalendar components:calenderUnit fromDate:self];
    return components.day;
}







#pragma mark - lunar tool
- (NSArray*)heavenlyStems{
    
    return @[@"甲",@"乙",@"丙",@"丁",@"戊",@"己",@"庚",@"辛",@"壬",@"癸"];
}
- (NSArray*)earthlyBranches{
    return @[@"子", @"丑", @"寅", @"卯", @"辰", @"巳", @"午", @"未", @"申", @"酉", @"戌", @"亥"];
}
- (NSArray*)lunarMonths{
    return @[@"*",@"正月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"冬月",@"腊月"];
}
- (NSArray*)lunarDays{
   return @[@"*",
                          @"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",
                          @"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",
                          @"廿一",@"廿二",@"廿三",@"廿四",@"廿五",@"廿六",@"廿七",@"廿八",@"廿九",@"三十",
                          ];
}
- (NSString*)yearOfChineseString:(NSInteger)year{
    NSInteger heavenlyStemIndex= (year-1)%self.heavenlyStems.count;
    NSString *heavenlyStem=self.heavenlyStems[heavenlyStemIndex];
    NSInteger earthlyBrancheIndex =(year-1)%self.earthlyBranches.count;
    NSString *earthlyBranche=self.earthlyBranches[earthlyBrancheIndex];
    return [NSString stringWithFormat:@"%@%@",heavenlyStem,earthlyBranche];
}
@end

