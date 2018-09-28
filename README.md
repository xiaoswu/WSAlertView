# WSAlertView
一个弹框显示视图,支持一些简单的显示动画.

## 初始化方法

```Objc
- (instancetype)initWithTitle:(NSString *)title message:( NSString *)message cancelButtonTitle:( NSString *)cancelButtonTitle otherButtonTitle:( NSString *)otherButtonTitle;
```

- 在初始化方法中，如果不需要title(标题)，可以填nil。
- 也可以选填message(正文)，同样传nil即可。
- 弹窗最多只允许添加两个button,两个button也是选填的状态。传入的buttonTitle不为nil的情况下，则显示button,如何为nil则不显示。

这样通过一个初始化方法根据传入的各个参数是否需要显示，如果不需要显示则填nil,保证了弹窗的丰富性。

效果图：

![image3](https://github.com/xiaoswu/WSAlertView/blob/master/image/image3.png)



![image1](https://github.com/xiaoswu/WSAlertView/blob/master/image/image1.png)



![image2](https://github.com/xiaoswu/WSAlertView/blob/master/image/image2.png)



## 弹窗的显示，弹窗视图是加在window上的。
```
- (void)show;
```

## 弹窗的消失
```
- (void)dismiss;
```

## button的回调方法
```Objc
@property (nonatomic,copy) void (^otherBtnCompletion)(void); // 点击otherBtn后的回调

@property (nonatomic,copy) void (^cancelBtnCompletion)(void); // 点击cancel后的回调
```

## button的排列方式
```
@property (nonatomic,assign) BOOL     isButtonVerticalShow;
```
在有两个button的情况下，button是上下排布显示还是左右显示排布, 默认为水平排布 默认为NO

## 是否显示叉叉
```Objc
@property (nonatomic,assign)BOOL      showDismissBtn; // 是否显示右上角的叉叉，默认为YES。
```

## 设置弹窗弹出时的动画
```
typedef enum
{
    WSAlertViewAnimationTypeDefault      =  0,
    WSAlertViewAnimationTypeScale            ,  // 缩放展示
    WSAlertViewAnimationTypeleftToRight      ,  // 从左边显示 右边消失
    WSAlertViewAnimationTypeTopToBottom      ,  // 从上边显示,下边消失.
    
} WSAlertViewAnimationType;

@property (nonatomic,assign) WSAlertViewAnimationType animationType;
```

具体的动画效果及WSAlertView的使用方法请参考demo,希望各位开发者用的愉快！有任何疑问都可提issue，或者添加我的微信：WSAlonely。








