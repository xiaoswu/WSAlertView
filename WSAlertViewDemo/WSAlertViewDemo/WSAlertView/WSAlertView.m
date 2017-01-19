//
//  WSAlertView.m
//  WSAlertView
//
//  Created by xiaowu on 2016/12/18.
//  Copyright © 2016年 WSAlone. All rights reserved.
//

#import "WSAlertView.h"
#import "UIView+WSExtension.h"

@interface WSAlertView ()

@property (nonatomic,strong) UILabel *titleLable; // 标题

@property (nonatomic,strong) UILabel *messageLable; // 内容

@property (nonatomic,strong) UIButton *cancalBtn; // 结束按钮

@property (nonatomic,strong) UIButton *otherBtn; // 其他按钮

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong)UIButton *dismissBtn;

@end


static CGFloat const kmessageLblFont = 16;
static CGFloat const ktitleLblFont = 19;
static CGFloat const kMarginX = 20;


@implementation WSAlertView
{
    NSString *_cancelBtnTitle;
    NSString *_otherBtnTitle;
    CGFloat _contentViewH;
}

#define kdefaultWith       kwidth * 0.77

#define kwidth [UIScreen mainScreen].bounds.size.width

#define kheight [UIScreen mainScreen].bounds.size.height

- (instancetype)initWithTitle:(NSString *)title message:( NSString *)message  cancelButtonTitle:( NSString *)cancelButtonTitle otherButtonTitle:( NSString *)otherButtonTitle{

    self = [super init];
    if (!self) {
        return nil;
    }
    
    if (title) {
        _title = title;
        [self.contentView addSubview:self.titleLable];
    }
    
    if (message) {
        _message = message;
        [self.contentView addSubview:self.messageLable];
    }
    
    if (cancelButtonTitle) {
        _cancelBtnTitle = cancelButtonTitle;
        [self.contentView addSubview:self.cancalBtn];
    }
    
    if (otherButtonTitle) {
        _otherBtnTitle = otherButtonTitle;
        [self.contentView addSubview:self.otherBtn];
    }
    
    return self;
}

- (UIButton *)dismissBtn{
    if (!_dismissBtn){
        _dismissBtn = [[UIButton alloc] init];
        [_dismissBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_dismissBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_dismissBtn];
        
    }
    
    return _dismissBtn;
}

- (void)dismiss{

    [self dissmissWithCompetion:nil];
}

- (void)show{
    
    self.contentView.frame = CGRectMake((kwidth - kdefaultWith) / 2 , (kheight - _contentViewH) / 2, kdefaultWith, _contentViewH);
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    self.frame = window.bounds;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [window addSubview:self];
    
    if (self.animationType == WSAlertViewAnimationTypeScale) {
        self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    } else if(self.animationType == WSAlertViewAnimationTypeleftToRight){
        self.contentView.x -= kwidth;
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.contentView.x += kwidth;
        } completion:^(BOOL finished) {
        }];
    } else if (self.animationType == WSAlertViewAnimationTypeTopToBottom){
        self.contentView.y -= kheight;
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.contentView.y += kheight;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    
    
}

#pragma mark -- setter方法
- (void)setTitle:(NSString *)title{
    if (self.titleLable) {
        self.titleLable.text = title;
    }
}

- (void)setMessage:(NSString *)message{
    if (self.messageLable) {
        self.messageLable.text = message;
    }
}

#pragma mark -- getter 方法

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.numberOfLines = 0;
        _titleLable.font = [UIFont systemFontOfSize:ktitleLblFont];
        _titleLable.text = self.title;
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.textColor = [UIColor blackColor];
    }
    return _titleLable;
}

- (UILabel *)messageLable{
    if (!_messageLable) {
        _messageLable = [[UILabel alloc] init];
        _messageLable.text = self.message;
        _messageLable.numberOfLines = 0;
        _messageLable.textAlignment = NSTextAlignmentCenter;
        _messageLable.font = [UIFont systemFontOfSize:kmessageLblFont];
        _messageLable.textColor = [UIColor grayColor];
        
    }
    
    return _messageLable;
}

- (UIButton *)cancalBtn{
    if (!_cancalBtn) {
        _cancalBtn = [[UIButton alloc] init];
        [_cancalBtn setTitle:_cancelBtnTitle forState:UIControlStateNormal];
        [_cancalBtn addTarget:self action:@selector(cancalBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [_cancalBtn setBackgroundColor:[UIColor grayColor]];
        _cancalBtn.layer.cornerRadius = 5;
        _cancalBtn.layer.masksToBounds = YES;
        
    }
    return _cancalBtn;
}

- (UIButton *)otherBtn{
    if (!_otherBtn) {
        _otherBtn = [[UIButton alloc] init];
        [_otherBtn setTitle:_otherBtnTitle forState:UIControlStateNormal];
        _otherBtn.backgroundColor = [UIColor blackColor];
        [_otherBtn addTarget:self action:@selector(otherBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        _otherBtn.layer.cornerRadius = 5;
        _otherBtn.layer.masksToBounds = YES;
    }
    return _otherBtn;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.layer.cornerRadius = 8;
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
    }
    
    return _contentView;
}

- (void)dissmissWithCompetion:(void (^)(void)) competion{
    
    if (self.animationType == WSAlertViewAnimationTypeScale) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.transform = CGAffineTransformScale(self.transform, 0.0001, 0.0001);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if (competion) {
                competion();
            }
            
        }];
    } else if (self.animationType == WSAlertViewAnimationTypeleftToRight){
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.contentView.x += kwidth;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if (competion) {
                competion();
            }
            
        }];
        
    } else if (self.animationType == WSAlertViewAnimationTypeTopToBottom){
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.contentView.y += kheight;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if (competion) {
                competion();
            }
            
        }];
        
        
        
    } else {
        [self removeFromSuperview];
        
        if (competion) {
            competion();
        }
        
    }
    
}

- (void)cancalBtnClicked{
    [self dissmissWithCompetion:self.cancelBtnCompletion];
}

- (void)otherBtnClicked{
    
    [self dissmissWithCompetion:self.otherBtnCompletion];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.contentView.width = kdefaultWith;
    
    CGFloat maxWith = self.contentView.width - 2 * kMarginX;
    
    _contentViewH = 20;
    
    if (self.title) {
        
        CGFloat titleHeight = [self sizeWithText:self.title textFont:ktitleLblFont maxW:maxWith].height;
        self.titleLable.frame = CGRectMake(20, _contentViewH, maxWith, titleHeight);
        _contentViewH += titleHeight + kMarginX / 2;
    }
    
    if (self.message) {
        CGFloat Messageheight =  [self sizeWithText:self.message textFont: kmessageLblFont maxW:maxWith].height;
        self.messageLable.frame = CGRectMake(kMarginX, _contentViewH, maxWith, Messageheight);
        _contentViewH += Messageheight + kMarginX;
        
    }
    CGFloat buttonH = 40;
    CGFloat buttonW = (kdefaultWith - 3 * kMarginX) / 2;
    
    CGRect btnFrame = CGRectMake(kMarginX, _contentViewH, maxWith, buttonH);
    
    if (_cancelBtnTitle && !_otherBtnTitle ) { // 只存在左边的按钮,右边的不存在.
        self.cancalBtn.frame = btnFrame;
        
    } else if (!_cancelBtnTitle && _otherBtnTitle){ // 只存在右边的按钮,左边的不存在.
        self.otherBtn.frame = btnFrame;
        
    } else if (_otherBtnTitle && _cancelBtnTitle){ // 两者都存在 又分情况 - 垂直排布,水平排布.
        
        if (self.isButtonVerticalShow) { // 垂直排布
            self.otherBtn.frame = btnFrame;
            _contentViewH += buttonH + kMarginX *0.5;
            self.cancalBtn.frame = CGRectMake(kMarginX, _contentViewH, maxWith, buttonH);
        } else {
            
        self.cancalBtn.frame = CGRectMake(kMarginX, _contentViewH, buttonW, buttonH);
        self.otherBtn.frame = CGRectMake(buttonW + 2 * kMarginX, _contentViewH, buttonW, buttonH);
        
        }
        
    }
    
    _contentViewH += buttonH + kMarginX *0.5;
    
    
    self.contentView.frame = CGRectMake((kwidth - kdefaultWith) / 2 , (kheight - _contentViewH) / 2, kdefaultWith, _contentViewH);
    
    self.dismissBtn.frame = CGRectMake(self.contentView.width - 20, 5, 15, 15);
    
}


- (CGSize)sizeWithText:(NSString *)text textFont:(CGFloat)font maxW:(CGFloat)maxW{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = 7;
    
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:font];
    
    dict[NSParagraphStyleAttributeName] = paragraphStyle;
    
    CGSize maxsize = CGSizeMake(maxW, MAXFLOAT);
    
    return  [text boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

- (void)setShowDismissBtn:(BOOL)showDismissBtn{
    
    _showDismissBtn = showDismissBtn;
    
    self.dismissBtn.hidden = !showDismissBtn;
    
}

@end
