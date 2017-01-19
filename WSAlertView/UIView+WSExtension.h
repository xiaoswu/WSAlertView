//
//  UIView+WSExtension.h
//  thinkAboutYourSister
//
//  Created by xiaowu on 16/4/20.
//  Copyright © 2016年 xiaowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WSExtension)

/* about frame */
@property (nonatomic,assign) CGFloat x;

@property (nonatomic,assign) CGFloat y;

@property (nonatomic,assign) CGFloat width;

@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign) CGSize size;

@property (nonatomic,assign) CGPoint origin;

@property (nonatomic,assign) CGFloat centerX;

@property (nonatomic,assign) CGFloat centerY;

/*about layer*/
- (void)WS_SetLayerCornerRadius:(CGFloat)cornerRadius
                    borderWidth:(CGFloat)borderWidth
                    borderColor:(UIColor *)borderColor;

/**
 *  边角半径
 */
@property (nonatomic, assign) CGFloat layerCornerRadius;
/**
 *  边线宽度
 */
@property (nonatomic, assign) CGFloat layerBorderWidth;
/**
 *  边线颜色
 */
@property (nonatomic, strong) UIColor *layerBorderColor;

/**
 *  动态添加手势
 */
- (void)setTapActionWithBlock:(void (^)(void))block;







@end
