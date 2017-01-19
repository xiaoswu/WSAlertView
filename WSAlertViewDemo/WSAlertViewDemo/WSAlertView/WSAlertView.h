//
//  WSAlertView.h
//  WSAlertView
//
//  Created by xiaowu on 2016/12/18.
//  Copyright © 2016年 WSAlone. All rights reserved.
//  视图上的按钮最多只支持两个 一般为确认和取消按钮.


#import <UIKit/UIKit.h>

@class WSAlertView;

typedef enum
{
    WSAlertViewAnimationTypeDefault      =  0,
    WSAlertViewAnimationTypeScale            ,  // 缩放展示
    WSAlertViewAnimationTypeleftToRight      ,  // 从左边显示 右边消失
    WSAlertViewAnimationTypeTopToBottom      ,  // 从上边显示,下边消失.
    
} WSAlertViewAnimationType;


@interface WSAlertView : UIView

@property (nonatomic,copy) void (^otherBtnCompletion)(void); // otherBtn后的回调

@property (nonatomic,copy) void (^cancelBtnCompletion)(void); // cancel后的回调
/**
 * 标题
 */
@property (nonatomic,copy) NSString *title;

/**
 * 主题内容
 */
@property (nonatomic,strong) NSString *message;


@property (nonatomic,assign) WSAlertViewAnimationType animationType;

/**
 * 构造方法
 */
- (instancetype)initWithTitle:(NSString *)title message:( NSString *)message  cancelButtonTitle:( NSString *)cancelButtonTitle otherButtonTitle:( NSString *)otherButtonTitle;


/**
 * 在窗口上显示
 */
- (void)show;

/**
 * 消失
 */
- (void)dismiss;

@property (nonatomic,assign) BOOL     isButtonVerticalShow; // button是上下排布显示还是左右显示排布, 默认为水平排布 默认为NO

@property (nonatomic,assign)BOOL      showDismissBtn;   // 是否显示右上角的叉叉.默认为YES.

@end
