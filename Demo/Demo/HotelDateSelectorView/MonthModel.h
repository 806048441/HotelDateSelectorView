//
//  MonthModel.h
//  CFK_HotelDatePicker
//
//  Created by 神州第一坑 on 2018/10/17.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Oxygen.h"
#import "NSString+Date.h"
typedef NS_ENUM(NSInteger, DayOfState) {
    NormalState = 0,
    SelectState,
    BeignState,
    EndState,
};

@interface DayModel : NSObject

@property (assign,nonatomic)DayOfState dayState;

//不可选的 停售 余量不足 什么的  能做尾部 不能做头部 不能做中间
@property (assign,nonatomic)BOOL notOptional;

@property (strong,nonatomic)NSDate *date;

@property (assign,nonatomic,readonly)BOOL ago;

@property (assign,nonatomic,readonly)BOOL tomorrow;

@property (assign,nonatomic,readonly)BOOL today;

@end

@interface MonthModel : NSObject

@property(nonatomic,assign)NSInteger year;

@property(nonatomic,assign)NSInteger month;

@property(nonatomic,assign)NSInteger beginIndex;

@property(nonatomic,strong)NSArray<DayModel *> * days;

@end

