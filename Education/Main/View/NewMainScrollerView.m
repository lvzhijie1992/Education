//
//  NewMainScrollerView.m
//  Internet_World
//
//  Created by 锦色年华 on 2018/7/27.
//  Copyright © 2018年 吕志杰. All rights reserved.
//
#define kSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define Kinterval  2
#import "NewMainScrollerView.h"
#import <UIImageView+WebCache.h>

@interface NewMainScrollerView ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollerView;
@property (nonatomic,strong) UIPageControl *pageController;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UILabel *timeLab;
@end

@implementation NewMainScrollerView

- (instancetype)initWithFrame:(CGRect)frame imageURLS:(NSArray *)imageURLS{
    self = [super initWithFrame:frame];
    if (self) {
        if (imageURLS.count == 0) {
            return nil;
        }
        self.scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollerView.delegate = self;
        self.scrollerView.showsHorizontalScrollIndicator = NO;
        self.scrollerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.scrollerView.pagingEnabled = YES;
        [self addSubview:self.scrollerView];
        self.pageController = [[UIPageControl alloc] initWithFrame:(CGRectMake(0, frame.size.height - 20, kSCREENWIDTH-20, 20))];
        [self addSubview:self.pageController];
        [self setUpScrollerView:imageURLS];
        if (imageURLS.count > 1) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:Kinterval target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        }
    }
    return self;
}

- (void)setUpScrollerView:(NSArray *)imageURLS{
    if (imageURLS.count == 1) {
        self.scrollerView.contentSize = self.scrollerView.frame.size;
        UIImageView *image = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))];
        [image sd_setImageWithURL:[NSURL URLWithString:imageURLS.lastObject]];
        [self.scrollerView addSubview:image];
        image.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClickFouncation)];
        [image addGestureRecognizer:tap];
        [self.timer setFireDate:[NSDate distantFuture]];//关闭定时器
        return;
    }
    self.scrollerView.contentSize = CGSizeMake(self.frame.size.width * (imageURLS.count + 2), 0);//滚动区域
    self.scrollerView.contentOffset = CGPointMake(self.frame.size.width, 0);//从第一张真图开始显示
    for (int i = 0; i < imageURLS.count + 2; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height))];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClickFouncation)];

        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        if (i == 0) {//第一张假图显示真实的最后一张

            [imageView sd_setImageWithURL:[NSURL URLWithString:imageURLS.lastObject]];
            //_as_imageV = imageView;
        }else if (i == imageURLS.count + 1){//最后一张假图显示第一张真图
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageURLS.firstObject]];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageURLS[i - 1]]];//显示网络图片
        }
        [self.scrollerView addSubview:imageView];
    }
    self.pageController.numberOfPages = imageURLS.count;//PageController个数
}

//正在滚动时  无论是修改了偏移量 还是用户滑动都会执行
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x <= 0) {//滚动到最前面时回到真实的最后一张
        self.scrollerView.contentOffset = CGPointMake(self.frame.size.width * self.pageController.numberOfPages , 0);
    }
    //滚动到最后一张假图的时候 回到第一张真图
    if (scrollView.contentOffset.x >= (self.pageController.numberOfPages + 1) * self.frame.size.width) {
        self.scrollerView.contentOffset = CGPointMake(self.frame.size.width, 0);
        //        if([self.ispen isEqualToString:@"1"])
        //        {
        //}
    }
    if([self.sign isEqualToString:@"0"])
    {
        NSInteger index = self.scrollerView.contentOffset.x / self.frame.size.width;
        self.imageClickBlock(index == 0 ? 0 : index-1);
    }
    self.pageController.currentPage = self.scrollerView.contentOffset.x / self.frame.size.width - 1;//修改page下标
}
//用户拖拽时
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //暂停定时器 定时器没有暂停的方法 只能设置 开启时间
    [self.timer setFireDate:[NSDate distantFuture]];
}

//结束拖拽时在开启定时器
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"返回华东:%.2f",self.scrollerView.contentOffset.x / self.frame.size.width);

    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:Kinterval]];
}

- (void)timerAction{
    NSInteger index = self.scrollerView.contentOffset.x / self.frame.size.width + 1;
    CGPoint offset = self.scrollerView.contentOffset;
    offset.x = self.frame.size.width * index;
    [self.scrollerView setContentOffset:offset animated:YES];
//    self.imageClickBlock(index-1);
}

//pageController点击方法
- (void)pageControllerClick{
    [self.timer setFireDate:[NSDate distantFuture]];//关闭定时器
    [UIView animateWithDuration:0.3 animations:^{
        self.scrollerView.contentOffset = CGPointMake((self.pageController.currentPage + 1) * self.frame.size.width, 0);
    }completion:^(BOOL finished) {
        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:Kinterval]];//继续定时器
    }];
}

//点击
- (void)imageClickFouncation{

    NSInteger index = self.scrollerView.contentOffset.x / self.frame.size.width;
    self.imageClickBlock(self.scrollerView.contentOffset.x / self.frame.size.width);
}

@end
