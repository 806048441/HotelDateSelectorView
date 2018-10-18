//
//  ViewController.m
//  Demo
//
//  Created by 神州第一坑 on 2018/10/18.
//  Copyright © 2018年 FirstKeng. All rights reserved.
//

#import "ViewController.h"
#import "DateViewController.h"
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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor =[UIColor whiteColor];
    NSArray <NSString*>*tities =@[@"默认半年",@"指定开始结束日期",@"指定开始日期持续时间天数",@"指定开始日期持续时间月数"];
    [tities enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *sender =[[UIButton alloc]initWithFrame:CGRectMake(0, 50+idx*80, kSCREEN_WIDTH, 80)];
        sender.backgroundColor =[UIColor colorWithRed:arc4random() %256/256.0 green:arc4random() %256/256.0 blue:arc4random() %256/256.0 alpha:1];
        [sender setTitle:obj forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        sender.tag=idx;
        [self.view addSubview:sender];
        [sender addTarget:self action:@selector(toData:) forControlEvents:UIControlEventTouchUpInside];
    }];
   
}

- (void)toData:(UIButton*)sender{
    DateViewController *vc =[[DateViewController alloc]init];
    vc.type=sender.tag;
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
