//
//  HotelDateSelectorView.m
//  Demo
//
//  Created by 神州第一坑 on 2018/10/18.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import "HotelDateSelectorView.h"
#import "NSString+Date.h"
#import "DayCell.h"
#import "PlaceCell.h"
#import "DayHeadView.h"
@interface HotelDateSelectorView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic)UICollectionView * hotelDatePicker;
@property (strong,nonatomic)NSMutableArray <MonthModel*>* dateSource;
@end
@implementation HotelDateSelectorView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self insertSubviews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame beginDate:(NSDate*)beinDate endDate:(NSDate*)endDate{
    NSInteger dayCount =[endDate daysSinceDate:beinDate];
    return  [self initWithFrame:frame beginDate:beinDate durationDays:dayCount];
}
- (instancetype)initWithFrame:(CGRect)frame beginDate:(NSDate*)beinDate durationMonths:(NSInteger)durationMonths{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (durationMonths) {
            NSMutableArray <MonthModel*>*months= [[NSMutableArray alloc]init];
            NSInteger year = beinDate.year;
            for (NSInteger i=0; i<durationMonths; i++) {
                MonthModel *monthModel =[[MonthModel alloc]init];
                monthModel.month = (beinDate.month+i)%12;
                monthModel.year=year;
                if (monthModel.month==0) {
                    monthModel.month=12;
                    year++;
                }
                NSMutableArray *monthDays =[[NSMutableArray alloc]init];
                NSString *monthDateString = [NSString stringWithFormat:@"%.4ld-%.2ld-01",monthModel.year,monthModel.month];
                NSDate *monthDate =monthDateString.date;
                NSInteger start = 0;
                if (beinDate.year==monthModel.year && beinDate.month==monthModel.month) {
                    start =beinDate.day-1;
                }
                for (NSInteger j=start; j<monthDate.numberOfDaysInMonth; j++) {
                    DayModel *dayModel = [[DayModel alloc]init];
                    NSString *dayDateString = [NSString stringWithFormat:@"%.4ld-%.2ld-%.2ld",monthModel.year,monthModel.month,j+1];
                    dayModel.date = dayDateString.date;
                    NSInteger arc =arc4random()%10;
                    if (arc==1) {
                        dayModel.notOptional=YES;
                    }
                    [monthDays addObject:dayModel];
                }
                monthModel.days=monthDays;
                [months addObject:monthModel];
            }
            self.dateSource=months;
        }
        [self insertSubviews];

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame beginDate:(NSDate*)beinDate durationDays:(NSInteger)durationDays{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (durationDays) {
            NSMutableArray <MonthModel*>*months =[[NSMutableArray alloc]init];
            for (NSInteger i=0; i<durationDays+1; i++) {
                NSDate *nextDate=[NSDate dateWithTimeInterval:24*3600*i sinceDate:beinDate];
                DayModel *nextDayModel =[[DayModel alloc]init];
                nextDayModel.date=[nextDate dateStringWithFormat:@"yyyy-MM-dd"].date;
                __block BOOL isExistMonth=NO;
                [months enumerateObjectsUsingBlock:^(MonthModel * _Nonnull month, NSUInteger idx_month, BOOL * _Nonnull stop_month) {
                    if (nextDayModel.date.year ==month.year && nextDayModel.date.month==month.month) {
                        NSMutableArray *monthDays =[[NSMutableArray alloc]initWithArray:month.days];
                        [monthDays addObject:nextDayModel];
                        month.days=monthDays;
                        isExistMonth=YES;
                    }
                }];
                if (!isExistMonth) {
                    MonthModel *NewMonth =[[MonthModel alloc]init];
                    NewMonth.year=nextDayModel.date.year;
                    NewMonth.month=nextDayModel.date.month;
                    NewMonth.days=@[nextDayModel];
                    [months addObject:NewMonth];
                }
                
            }
            self.dateSource=months;
        }
        [self insertSubviews];
    }
    return self;
}
- (void)setup{
    
}
#pragma mark - Custom Accessors
- (void)setBeginModel:(DayModel *)beginModel{
    
    _beginModel=beginModel;
    
    [self.dateSource enumerateObjectsUsingBlock:^(MonthModel * _Nonnull month, NSUInteger idx_month, BOOL * _Nonnull stop_month) {
        
        [month.days enumerateObjectsUsingBlock:^(DayModel * _Nonnull day, NSUInteger idx_day, BOOL * _Nonnull stop_day) {
            
            if (self.beginModel.date.year==day.date.year && self.beginModel.date.month==day.date.month && self.beginModel.date.day==day.date.day) {
                day.dayState=BeignState;
            }
        }];
    }];
}
- (void)setEndDayModel:(DayModel *)endDayModel{
    
    _endDayModel=endDayModel;
    
    [self.dateSource enumerateObjectsUsingBlock:^(MonthModel * _Nonnull month, NSUInteger idx_month, BOOL * _Nonnull stop_month) {
        
        [month.days enumerateObjectsUsingBlock:^(DayModel * _Nonnull day, NSUInteger idx_day, BOOL * _Nonnull stop_day) {
            
            if (self.endDayModel.date.year==day.date.year && self.endDayModel.date.month==day.date.month && self.endDayModel.date.day==day.date.day) {
                day.dayState=EndState;
            }
        }];
    }];

}

- (NSMutableArray*)dateSource{
    
    if (!_dateSource) {
        _dateSource =[[NSMutableArray alloc]init];
        NSDate *nowDate =[NSDate date];
        NSInteger year = nowDate.year;
        for (NSInteger i=0; i<6; i++) {
            MonthModel *monthModel =[[MonthModel alloc]init];
            monthModel.month = (nowDate.month+i)%12;
            monthModel.year=year;
            if (monthModel.month==0) {
                monthModel.month=12;
                year++;
            }
         
            NSMutableArray *monthDays =[[NSMutableArray alloc]init];
            NSString *monthDateString = [NSString stringWithFormat:@"%.4ld-%.2ld-01",monthModel.year,monthModel.month];
            NSDate *monthDate =monthDateString.date;
            for (NSInteger j=0; j<monthDate.numberOfDaysInMonth; j++) {
                DayModel *dayModel = [[DayModel alloc]init];
                NSString *dayDateString = [NSString stringWithFormat:@"%.4ld-%.2ld-%.2ld",monthModel.year,monthModel.month,j+1];
                dayModel.date = dayDateString.date;
                NSInteger arc =arc4random()%10;
                if (arc==1) {
                    dayModel.notOptional=YES;
                }
                [monthDays addObject:dayModel];
            }
            monthModel.days=monthDays;
            [_dateSource addObject:monthModel];
        }
    }
    return _dateSource;
}

#pragma mark - IBAction

#pragma mark - Public

#pragma mark - Private
- (void)insertSubviews{
    
    CGFloat view_width = self.bounds.size.width;
    CGFloat view_height =self.bounds.size.height;
    CGFloat weekView_height =50;
    NSArray <NSString*>*weekStrings =@[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    [weekStrings enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(10+(view_width-20)/7*idx, 0, (view_width-20)/7, weekView_height)];
        label.text =obj;
        label.textAlignment =NSTextAlignmentCenter;
        [self addSubview:label];
    }];
    
    UICollectionViewFlowLayout * layout= [[UICollectionViewFlowLayout alloc] init];
    _hotelDatePicker = [[UICollectionView alloc]initWithFrame:CGRectMake(0, weekView_height, view_width, view_height-weekView_height) collectionViewLayout:layout];
    layout.minimumLineSpacing=10;
    layout.minimumInteritemSpacing=10;
    layout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize =CGSizeMake((view_width-81)/7, (view_width-81)/7);
    _hotelDatePicker.delegate =self;
    _hotelDatePicker.dataSource =self;
    if (@available(iOS 11.0, *)) {
        _hotelDatePicker.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
    } else {
        // Fallback on earlier versions
    }
    _hotelDatePicker.backgroundColor = [UIColor clearColor];
    _hotelDatePicker.showsVerticalScrollIndicator =NO;
    _hotelDatePicker.contentInset =UIEdgeInsetsMake(0, 0, 0, 0);
    [_hotelDatePicker registerClass:[DayCell class] forCellWithReuseIdentifier:@"DayCell"];
    [_hotelDatePicker registerClass:[PlaceCell class] forCellWithReuseIdentifier:@"PlaceCell"];
    [_hotelDatePicker registerClass:[DayHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DayHeadView"];
    [self addSubview:_hotelDatePicker];
}
#pragma mark - Protocol conformance
#pragma mark - UICollectionViewDelegate
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    MonthModel *month =self.dateSource[indexPath.section];
    if (indexPath.row<month.beginIndex) {
        PlaceCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"PlaceCell" forIndexPath:indexPath];
        return cell;
    }else{
        DayCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"DayCell" forIndexPath:indexPath];
        DayModel *day =month.days[indexPath.row-month.beginIndex];
        cell.dayModel=day;
        return cell;
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MonthModel *month =self.dateSource[indexPath.section];
    
    if (indexPath.row<month.beginIndex) {
        
    }else{
        DayModel *day =month.days[indexPath.row-month.beginIndex];
        if (day.ago) {
            NSLog(@"是以前的日期");
        }else{
            NSLog(@"是可以选择的日期的日期");
            [self selectDay:day];
        }
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    MonthModel *month =self.dateSource[section];
    
    return month.days.count+month.beginIndex;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dateSource.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return  CGSizeMake(self.bounds.size.width, 40);
}
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    DayHeadView *head =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DayHeadView" forIndexPath:indexPath];
    MonthModel *month =self.dateSource[indexPath.section];
    head.monthModel=month;
    return head;
}

#pragma mark - 日期选择事件 点击了某个日期
- (void)selectDay:(DayModel*)dayModel{
    /**
     keng * 这个分开写
     */
    __block BOOL begin =NO;
    __block BOOL end =NO;
    __block BOOL selected=NO;
    
    __block DayModel *beginDayModel,*endDayModel;
    
    [self.dateSource enumerateObjectsUsingBlock:^(MonthModel * _Nonnull month, NSUInteger idx_month, BOOL * _Nonnull stop_month) {
        [month.days enumerateObjectsUsingBlock:^(DayModel * _Nonnull day, NSUInteger idx_day, BOOL * _Nonnull stop_day) {
            
            if (day.dayState==SelectState) {
                selected=YES;
            }
            if (day.dayState==BeignState) {
                begin=YES;
                beginDayModel=day;
            }
            if (day.dayState==EndState) {
                end=YES;
                endDayModel=day;
            }
        }];
    }];
    
    //没开始没结束 相当于点击的时候 是选择开始的
    if ((!begin && !end && !selected) || (!begin && !end)) {
        if (!dayModel.notOptional) {
            dayModel.dayState=BeignState;
        }
    }
    //有开始有结束 相当于点击的时候 是选择开始的
    else if (begin && end){
        
        if (!dayModel.notOptional) {
            [self.dateSource enumerateObjectsUsingBlock:^(MonthModel * _Nonnull month, NSUInteger idx_month, BOOL * _Nonnull stop_month) {
                [month.days enumerateObjectsUsingBlock:^(DayModel * _Nonnull day, NSUInteger idx_day, BOOL * _Nonnull stop_day) {
                    if (!dayModel.notOptional) {
                        day.dayState=NormalState;
                    }
                }];
            }];
            dayModel.dayState=BeignState;
        }
        
    }
    //有开始没结束
    else if (begin && !end){
        
        NSInteger backStatus =[NSString compareDate:dayModel.date withDate:beginDayModel.date];
        
        switch (backStatus) {
                
            case 1:{
                //            选择日期 小于 开始日期  相当于重新选择开始日期
                if (!dayModel.notOptional) {
                    dayModel.dayState = BeignState;
                    beginDayModel.dayState = NormalState;
                }
            }
                break;
                //            选择日期 大于 开始日期  相当于选择区间
                
            case -1:{
                NSMutableArray <DayModel*>*selectDates=[[NSMutableArray alloc]init];
                
                __block BOOL isHaveNotOptional=NO;
                [self.dateSource enumerateObjectsUsingBlock:^(MonthModel * _Nonnull month, NSUInteger idx_month, BOOL * _Nonnull stop_month) {
                    
                    [month.days enumerateObjectsUsingBlock:^(DayModel * _Nonnull day, NSUInteger idx_day, BOOL * _Nonnull stop_day) {
                        NSInteger status1 = [NSString compareDate:day.date withDate:beginDayModel.date];
                        NSInteger status2 = [NSString compareDate:day.date withDate:dayModel.date];
                        
                        if (status1==-1 && status2==1) {
                            day.dayState = SelectState;
                            [selectDates addObject:day];
                            if (day.notOptional) {
                                isHaveNotOptional =YES;
                                [selectDates enumerateObjectsUsingBlock:^(DayModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                    obj.dayState=NormalState;
                                }];
                                *stop_day=YES;
                                *stop_month=YES;
                            }
                        }
                    }];
                    
                }];
                if (!isHaveNotOptional) {
                    dayModel.dayState = EndState;
                }
            }
                break;
                //             选择日期 等于 开始日期 相当于没选
            case 0:
                
                break;
                
            default:
                break;
        }
    }
    
    [self.hotelDatePicker reloadData];
    
    __block DayModel *selectBeginDayModel,*selectEndDayModel;
    [self.dateSource enumerateObjectsUsingBlock:^(MonthModel * _Nonnull month, NSUInteger idx_month, BOOL * _Nonnull stop_month) {
        [month.days enumerateObjectsUsingBlock:^(DayModel * _Nonnull day, NSUInteger idx_day, BOOL * _Nonnull stop_day) {
          
            if (day.dayState==BeignState) {
                selectBeginDayModel=day;
            }
            if (day.dayState==EndState) {
                selectEndDayModel=day;
            }
        }];
    }];
    if (self.daySelectBlock) {
        self.daySelectBlock(selectBeginDayModel, selectEndDayModel);
    }
}
@end
