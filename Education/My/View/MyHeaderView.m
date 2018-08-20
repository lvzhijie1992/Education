//
//  MyHeaderView.m
//  Education
//
//  Created by 锦色年华 on 2018/8/11.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

#import "MyHeaderView.h"

@implementation MyHeaderView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.detailView.clipsToBounds = NO;
    self.detailView.layer.shadowOffset = CGSizeMake(2, 2);
}

- (IBAction)collectBtn_click:(id)sender {
    self.collect_click();
}
@end
