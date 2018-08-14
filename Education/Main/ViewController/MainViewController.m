//
//  MainViewController.m
//  Education
//
//  Created by 锦色年华 on 2018/8/10.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

#import "MainViewController.h"
#import "XPNavigationBarTranslucent.h"
#import "MainCollectionViewCell.h"
#import "MainCollectionReusableView.h"

@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *main_collectionview;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initbaritem];
    [self initcollView];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/2-8, (self.view.frame.size.width/2-8)/1.03);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width, 700);
}

- (void) initbaritem
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mine"] style:(UIBarButtonItemStylePlain) target:self action:@selector(left_click)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home"] style:(UIBarButtonItemStylePlain) target:self action:@selector(right_click)];
}

-(void)left_click
{
    
}

- (void)right_click
{
    
}

- (void)initcollView
{
    self.navigationController.navigationBar.translucent = YES;
    [self setNavigationBarAlpha:0.0];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    _main_collectionview.collectionViewLayout = layout;
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 8;
    _main_collectionview.delegate = self;
    _main_collectionview.dataSource = self;
    layout.sectionInset = UIEdgeInsetsMake(4, 4, 4, 4);
   
    _main_collectionview.showsHorizontalScrollIndicator = NO;
    [_main_collectionview registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"maincell"];
    [_main_collectionview registerNib:[UINib nibWithNibName:@"MainCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    if (@available(iOS 11.0, *)) {
        self.main_collectionview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"maincell" forIndexPath:indexPath];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    [header init_lun:[@[@"http://pkimg.image.alimmdn.com/upload/20160616/21e43ec42d912f195662e3b85117c80d.JPG!300300",@"http://image.tianjimedia.com/uploadImages/2015/083/30/VVJ04M7P71W2.jpg",@"http://pkimg.image.alimmdn.com/upload/20160616/21e43ec42d912f195662e3b85117c80d.JPG!300300",@"http://photo.enterdesk.com/2009-4-21/200901241609531378.png"] copy]];
    return header;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat maxOffset = 400.0;
    CGFloat verticalOffset = MIN(MAX(scrollView.contentOffset.y, 0.0), maxOffset);
    CGFloat alpha = verticalOffset / maxOffset;
    [self setNavigationBarAlpha:alpha];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
