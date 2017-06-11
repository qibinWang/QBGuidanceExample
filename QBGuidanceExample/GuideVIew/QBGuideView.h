//
//  QBGuideView.h
//  QBGuideView
//
//  Created by wangqibin on 16/9/22.
//  Copyright © 2016年 wangqibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QBGuideViewDelegate <NSObject>
//代理方法 跳过引导页
-(void)onPassButtonPressed;
@end


@interface QBGuideView: UIView
@property (nonatomic,weak)  id<QBGuideViewDelegate> delegate;

@end
