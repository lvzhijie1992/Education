//
//  MyViewController.m
//  Education
//
//  Created by 锦色年华 on 2018/8/11.
//  Copyright © 2018年 锦色年华. All rights reserved.
//
#define ListLIST @[@"优惠券",@"我的兴趣",@"我的消息",@"联系客服",@"设置"]
#define Pjt_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define  LL_TabbarHeight  (Pjt_iPhoneX ? 83.0 : 49.0)
#define kSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define HEADERIMAGEVIEWH 240
#define NAVHeight [UIApplication sharedApplication].statusBarFrame.size.height+44.0
#import "MyViewController.h"
#import "MyTableViewCell.h"
#import "MyHeaderView.h"
#import "SetTableViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic) UIImageView *headImageView;
@property (strong ,nonatomic) UIVisualEffectView *blurEffect;
@property (strong ,nonatomic) UITableView *tableview;
@property (strong ,nonatomic) MyHeaderView *headerView;
@end

@implementation MyViewController

- (UIImageView *)headImageView
{
    if(!_headImageView)
    {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, HEADERIMAGEVIEWH)];
        _headImageView.image = [UIImage imageNamed:@"1"];
    }
    return _headImageView;
}

- (MyHeaderView *)headerView
{
    if(!_headerView)
    {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"MyHeaderView" owner:self options:nil] lastObject];
        _headerView.frame = CGRectMake(0, 0, kSCREENWIDTH, 240);
    }
    return _headerView;
}

- (UITableView*)tableview
{
    if(!_tableview)
    {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height+44.0, kSCREENWIDTH, kSCREENHEIGHT-[UIApplication sharedApplication].statusBarFrame.size.height-44.0-LL_TabbarHeight)style:UITableViewStyleGrouped];
        _tableview.contentInset = UIEdgeInsetsMake(8, 0, 0, 0);
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableview;
}

- (UIVisualEffectView *)blurEffect
{
    if(!_blurEffect)
    {
         UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
         _blurEffect = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurEffect.frame = CGRectMake(0, 0, kSCREENWIDTH, HEADERIMAGEVIEWH);
        _blurEffect.alpha = 0;//lalals
    }
    return _blurEffect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.headImageView];
    [self.headImageView addSubview:self.blurEffect];
    [self.view addSubview:self.tableview];
    self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    self.tableview.tableHeaderView = self.headerView;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section ==1 ? 0 : ListLIST.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titlelab.text = ListLIST[indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 4)
    {
        SetTableViewController *set_VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"set_ID"];
       
        [self.navigationController pushViewController:set_VC animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float alpha = 1 + scrollView.contentOffset.y / (8);
    self.blurEffect.alpha = alpha;
    NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y <= -8)
    {
        self.headImageView.frame = CGRectMake(0, 0, kSCREENWIDTH, 240-scrollView.contentOffset.y-8);
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
