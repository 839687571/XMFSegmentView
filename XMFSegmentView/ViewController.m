//
//  ViewController.m
//  XMFSegmentView
//
//  Created by xumingfa on 16/3/5.
//  Copyright © 2016年 xumingfa. All rights reserved.
//

#import "ViewController.h"
#import "XMFSegmentView.h"

@interface ViewController () <XMFSegmentViewDataSource, XMFSegmentViewDelegate>

@property (nonatomic, weak) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    XMFSegmentView *view = [XMFSegmentView new];
    view.backgroundColor = [UIColor grayColor];
    view.dataSource = self;
    view.columDelegate = self;
    view.defaultIndex = 0;
    view.layer.cornerRadius = 6;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    view.frame = CGRectMake(5, 100, size.width-10, 60);
    [self.view addSubview: view];
    
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 360, size.width, 50);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:30];
    _label = label;
    [self.view addSubview: _label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//  标题
- (NSString *)segmentView:(XMFSegmentView *)segmentView titleOfIndex:(NSUInteger)index {
    NSArray *ary = @[@"已合成视频", @"比赛视频下载"];
    NSString *str = ary[index];
    return str;
}

//  每个item的宽度
- (CGFloat)segmentView:(XMFSegmentView *)segmentView widthOfIndex:(NSUInteger)index {
    if (index == 3) {
        return 50.f;
    }
    else if (index == 4) {
        return 80.f;
    }
    return 100.f;
    
}

//  item的数量
- (NSUInteger)numberOfItemsInSegmentView:(XMFSegmentView *)segmentView {
    return 2;
}

//  点击item
- (void)segmentView:(XMFSegmentView *)segmentView didSelectItemsAtIndex:(NSUInteger)index {
    NSLog(@"点击了%ld", index);
   // _label.text = [NSString stringWithFormat:@"%ld", index + 1];
}

//  高亮的颜色
- (UIColor *)highlightColorInSegmentView:(XMFSegmentView *)segmentView {
    return [UIColor  blackColor];
}

//  标题字体颜色
- (UIColor *)fontColorInSegmentView:(XMFSegmentView *)segmentView {
    return [UIColor whiteColor];
}

// 字体大小等..
- (UIFont *)fontSizeInSegmentView : (XMFSegmentView *)segmentView
{
    return [UIFont systemFontOfSize: 14.0];
}

@end
