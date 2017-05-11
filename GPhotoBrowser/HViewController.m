//
//  HViewController.m
//  GPhotoBrowser
//
//  Created by yejunyou on 2017/5/11.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "HViewController.h"
#import "UIView+FrameAdjust.h"


@interface HViewController ()
{
    
    CGFloat ScreenWidth;
    CGFloat ScreenHeight;
    CGFloat containerW;
    CGFloat containerH;
    
    CGFloat margin;
    
    CGFloat ctnVScaleX;
    CGFloat imgScaleY;
}
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *iv;
@end

@implementation HViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    containerH = 320;
    containerW = 250;
    margin = 64;
    
    _containerView = [[UIView alloc] init];
    _containerView.backgroundColor = [UIColor grayColor];
    _containerView.frame = CGRectMake(100, 0, containerW, containerH + margin * 2);
    //    _containerView.clipsToBounds = YES;
    [self.view addSubview:_containerView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidPan:)];
    [_containerView addGestureRecognizer:pan];
    
    _iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"long2"]];
    _iv.height = containerH;
    _iv.y  = margin;
    [_containerView addSubview:_iv];
    
    // 竖线
    UIView *vLine = [[UIView alloc] init];
    vLine.backgroundColor = [UIColor redColor];
    vLine.frame = CGRectMake(ScreenWidth / 2, 0, 1, ScreenHeight);
    [self.view addSubview:vLine];
    
    // 横线
    UIView *hLine = [[UIView alloc] init];
    hLine.backgroundColor = [UIColor redColor];
    hLine.frame = CGRectMake(0, ScreenHeight / 2, ScreenWidth, 1);
    [self.view addSubview:hLine];
}

- (void)viewDidPan:(UIPanGestureRecognizer *)pan
{
    CGPoint offset = [pan translationInView:self.view];
    UIView *draggableObj = _containerView;
    
    //通过计算偏移量来设定draggableObj的新坐标
    CGFloat x = draggableObj.center.x + offset.x;
    CGFloat y = draggableObj.center.y + offset.y;
    
    [draggableObj setCenter:CGPointMake(x, y)];
    
    //初始化sender中的坐标位置。如果不初始化，移动坐标会一直积累起来。
    [pan setTranslation:CGPointMake(0, 0) inView:self.view];
    
    
    // 处理图像偏移
    ctnVScaleX = _containerView.x / (ScreenWidth);
    _iv.x = -1.6*(_iv.width) * ctnVScaleX;
    
    _containerView.backgroundColor = [UIColor colorWithRed:ctnVScaleX green:ctnVScaleX blue:ctnVScaleX alpha:1];
}

@end
