//
//  ViewController.m
//  QBGuidanceExample
//
//  Created by wangqibin on 2017/6/11.
//  Copyright © 2017年 wangqibin. All rights reserved.
//

#import "ViewController.h"
#import "QBGuideView.h"

@interface ViewController () <QBGuideViewDelegate>
@property (assign,nonatomic) BOOL isFirstLaunch;
@property (strong,nonatomic) QBGuideView *guideView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [btn setTitle:@"这是首页" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    //    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstLaunch"]) {
    _isFirstLaunch = YES;
    [[NSUserDefaults standardUserDefaults] setBool:_isFirstLaunch forKey:@"isFirstLaunch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _guideView = [[QBGuideView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _guideView.delegate = self;
    [self.view addSubview:_guideView];
    //    }
}

- (void)onPassButtonPressed{
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _guideView.alpha = 0;
    } completion:^(BOOL finished) {
        [_guideView removeFromSuperview];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
