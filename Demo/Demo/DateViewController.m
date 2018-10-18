//
//  DateViewController.m
//  Demo
//
//  Created by 神州第一坑 on 2018/10/18.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import "DateViewController.h"
#import "HotelDateSelectorView.h"
#define kSCREEN_WIDTH         ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT        ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_MAX_LENGTH (MAX(kSCREEN_WIDTH, kSCREEN_HEIGHT))
#define iPhoneX_OO  (SCREEN_MAX_LENGTH==812 || SCREEN_MAX_LENGTH==896)
//导航条高度
#define navbarHeight  (iPhoneX_OO?88:64)
//状态栏高度 刘海加原来状态栏的高度iphonex
#define statusHeight  (iPhoneX_OO?44:20)
//iphonex刘海的高度
#define LiuHaiHeight (iPhoneX_OO?34:0)
//仅仅直说导航条的搞度
#define onlyNavbarHeight 44
//tabbar高度
#define tabBarHeight (iPhoneX_OO?83:49)
//工具条高度
#define toolHeight   (iPhoneX_OO?34:0)
@interface DateViewController ()

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor =[UIColor whiteColor];

    if (!self.type) {
        HotelDateSelectorView *view =[[HotelDateSelectorView alloc]initWithFrame:CGRectMake(0, 0,kSCREEN_WIDTH, kSCREEN_HEIGHT-navbarHeight)];
        [self.view addSubview:view];
        view.daySelectBlock = ^(DayModel * _Nonnull beginModel, DayModel * _Nonnull endModel) {
            
            if (beginModel && endModel) {
                self.navigationItem.title =[NSString stringWithFormat:@"开始%.4ld-%.2ld-%.2ld  结束%.4ld-%.2ld-%.2ld",beginModel.date.year,beginModel.date.month,beginModel.date.day,endModel.date.year,endModel.date.month,endModel.date.day];
            }
        };
    }else if (self.type==1){
        HotelDateSelectorView *view =[[HotelDateSelectorView alloc]initWithFrame:CGRectMake(0, 0,kSCREEN_WIDTH, kSCREEN_HEIGHT-navbarHeight) beginDate:[NSDate date] endDate:[NSDate dateWithTimeIntervalSinceNow:24*3600*60]];
        [self.view addSubview:view];
        view.daySelectBlock = ^(DayModel * _Nonnull beginModel, DayModel * _Nonnull endModel) {
            if (beginModel && endModel) {
                self.navigationItem.title =[NSString stringWithFormat:@"开始%.4ld-%.2ld-%.2ld  结束%.4ld-%.2ld-%.2ld",beginModel.date.year,beginModel.date.month,beginModel.date.day,endModel.date.year,endModel.date.month,endModel.date.day];
            }
        };
    }else if (self.type==2){
        HotelDateSelectorView *view =[[HotelDateSelectorView alloc]initWithFrame:CGRectMake(0, 0,kSCREEN_WIDTH, kSCREEN_HEIGHT-navbarHeight) beginDate:@"2018-10-01".date durationDays:60];
        [self.view addSubview:view];
        view.daySelectBlock = ^(DayModel * _Nonnull beginModel, DayModel * _Nonnull endModel) {
            if (beginModel && endModel) {
                self.navigationItem.title =[NSString stringWithFormat:@"开始%.4ld-%.2ld-%.2ld  结束%.4ld-%.2ld-%.2ld",beginModel.date.year,beginModel.date.month,beginModel.date.day,endModel.date.year,endModel.date.month,endModel.date.day];
            }
        };
    }else if (self.type==3){
        HotelDateSelectorView *view =[[HotelDateSelectorView alloc]initWithFrame:CGRectMake(0, 0,kSCREEN_WIDTH, kSCREEN_HEIGHT-navbarHeight) beginDate:@"2018-10-14".date durationMonths:3];
        [self.view addSubview:view];
        view.daySelectBlock = ^(DayModel * _Nonnull beginModel, DayModel * _Nonnull endModel) {
            if (beginModel && endModel) {
                self.navigationItem.title =[NSString stringWithFormat:@"开始%.4ld-%.2ld-%.2ld  结束%.4ld-%.2ld-%.2ld",beginModel.date.year,beginModel.date.month,beginModel.date.day,endModel.date.year,endModel.date.month,endModel.date.day];
            }
        };
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
