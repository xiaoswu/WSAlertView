# WSAlertView
一个弹框显示视图,支持一些简单的显示动画.

## 初始化方法
```
- (instancetype)initWithTitle:(NSString *)title message:( NSString *)message cancelButtonTitle:( NSString *)cancelButtonTitle otherButtonTitle:( NSString *)otherButtonTitle;
```

在初始化方法中，如果不需要title(标题)，可以填nil,效果如图所示：
