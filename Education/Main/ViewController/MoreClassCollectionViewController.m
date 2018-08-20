//
//  MoreClassCollectionViewController.m
//  Education
//
//  Created by 锦色年华 on 2018/8/16.
//  Copyright © 2018年 锦色年华. All rights reserved.
//
#define kSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "MoreClassCollectionViewController.h"
#import "MoreHeaderCollectionReusableView.h"
#import "MoreClassCollectionViewCell.h"
#import "MoreFooterCollectionReusableView.h"

@interface MoreClassCollectionViewController ()

@end

@implementation MoreClassCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部分类";
    [self init_registernib];
    [self initsearchbar];
}

- (void) initsearchbar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemSearch) target:self action:@selector(search_click)];
}

- (void) search_click
{
    #warning 这里是搜索方法
}

- (void)init_registernib
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView registerNib:[UINib nibWithNibName:@"MoreClassCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"morecell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MoreHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MoreFooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 9;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 28;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return  CGSizeMake (kSCREENWIDTH, 35);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(9, 9, 9, 9);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return  CGSizeMake (kSCREENWIDTH, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kSCREENWIDTH/3-18,35);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MoreClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"morecell" forIndexPath:indexPath];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if(kind == UICollectionElementKindSectionHeader)
    {
        MoreHeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return header ;
    }else
    {
        MoreFooterCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        return footer;
    }
}

@end
