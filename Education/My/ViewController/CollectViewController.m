//
//  CollectViewController.m
//  Education
//
//  Created by 锦色年华 on 2018/8/14.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectTableViewCell.h"

@interface CollectViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *collect_tableview;

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self init_tableview];
    self.title = @"我的收藏";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) init_tableview
{
    [_collect_tableview registerNib:[UINib nibWithNibName:@"CollectTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _collect_tableview.delegate = self;
    _collect_tableview.dataSource = self;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return  cell;
}

@end
