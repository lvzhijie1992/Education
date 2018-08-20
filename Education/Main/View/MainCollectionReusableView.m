//
//  MainCollectionReusableView.m
//  Education
//
//  Created by 锦色年华 on 2018/8/10.
//  Copyright © 2018年 锦色年华. All rights reserved.
//
#define kSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#import "MainCollectionReusableView.h"

@implementation MainCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (NewMainScrollerView *)lunscrollView
{
    if(!_lunscrollView)
    {
        _lunscrollView = [[NewMainScrollerView alloc] initWithFrame:self.scrollerview.bounds];
    }
    return _lunscrollView;
}

- (void)init_lun:(NSMutableArray *)image_arr
{
    self.lunscrollView = [[NewMainScrollerView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENWIDTH/5*2) imageURLS:[image_arr copy]];
    self.lunscrollView.backgroundColor = [UIColor grayColor];
    self.lunscrollView.sign = @"0";
    [self.scrollerview addSubview:self.lunscrollView];
    self.lunscrollView.imageClickBlock = ^(NSInteger index) {
    
    };
}

@end
