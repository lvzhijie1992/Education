//
//  NewMainScrollerView.h
//  Internet_World
//
//  Created by 锦色年华 on 2018/7/27.
//  Copyright © 2018年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewMainScrollerView : UIView
@property (strong ,nonatomic) void (^imageClickBlock)(NSInteger index);
@property (strong ,nonatomic) NSString *sign;
- (instancetype)initWithFrame:(CGRect)frame imageURLS:(NSArray *)imageURLS;
- (void)setUpScrollerView:(NSArray *)imageURLS;
@property (strong ,nonatomic) NSMutableArray *imageArr;
@property (strong ,nonatomic) NSString *scroller_sign;
@end
