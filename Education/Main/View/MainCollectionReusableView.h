//
//  MainCollectionReusableView.h
//  Education
//
//  Created by 锦色年华 on 2018/8/10.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewMainScrollerView.h"

@interface MainCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIView *scrollerview;

@property (nonatomic, strong) NewMainScrollerView *lunscrollView;
- (void)init_lun:(NSMutableArray *)image_arr;

@end
