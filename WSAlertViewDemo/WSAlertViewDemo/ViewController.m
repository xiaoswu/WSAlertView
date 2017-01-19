//
//  ViewController.m
//  WSAlertViewDemo
//
//  Created by xiaowu on 2017/1/19.
//  Copyright © 2017年 WSAlone. All rights reserved.
//

#import "ViewController.h"
#import "WSAlertView.h"

@interface ViewController ()
- (IBAction)scaleShowAlertView;

- (IBAction)leftTorightShowAlertView;

- (IBAction)topToBottomShowAlertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)scaleShowAlertView {
    
    WSAlertView * alertView = [[WSAlertView alloc] initWithTitle:@"刘德华坠马受伤紧急送医" message:@"据港媒报道，刘德华本周一前往泰国拍新广告，在郊区拍摄一场骑马场面时，马匹忽然发狂，华仔不慎堕马，马匹更踩到华仔腰脊，令他腰脊骨裂，广告亦暂停拍摄。刘德华及时前往泰国一间医院治疗，因为腰脊受伤，行动不便，必须坐医疗专机回港" cancelButtonTitle:@"取消" otherButtonTitle:@"确认"];
    alertView.cancelBtnCompletion = ^{
        NSLog(@"点击了取消");
    
    };
    alertView.otherBtnCompletion = ^{
        NSLog(@"点击了确认");
        
    };
    alertView.animationType = WSAlertViewAnimationTypeScale;
    
    [alertView show];
    
}

- (IBAction)leftTorightShowAlertView{
    
    WSAlertView * alertView = [[WSAlertView alloc] initWithTitle:nil message:@"林志玲于2005年7月8日在大连拍摄广告时意外坠马，马从其胸部踏过，造成胸部6根肋骨骨折，休养了近4个月才复出。那时，正是林大美人最红之时，这一闭门休养，损失不可估量。" cancelButtonTitle:nil otherButtonTitle:@"确认"];

    alertView.otherBtnCompletion = ^{
        NSLog(@"点击了确认");
        
    };
    alertView.animationType = WSAlertViewAnimationTypeleftToRight;
    
    alertView.isButtonVerticalShow = YES;
    
    [alertView show];
    
}

- (IBAction)topToBottomShowAlertView{
    
    WSAlertView * alertView = [[WSAlertView alloc] initWithTitle:@"刘德华意外坠马 爱妻朱丽倩飞赴泰国照顾丈夫" message:nil cancelButtonTitle:@"取消" otherButtonTitle:@"确认"];
    alertView.cancelBtnCompletion = ^{
        NSLog(@"点击了取消");
        
    };
    alertView.otherBtnCompletion = ^{
        NSLog(@"点击了确认");
        
    };
    alertView.animationType = WSAlertViewAnimationTypeTopToBottom;
    
    alertView.showDismissBtn = NO;
    
    [alertView show];
    
    
}
@end
