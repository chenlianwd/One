//
//  CHLMovieViewController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//http://v3.wufazhuce.com:8000/api/movie/list/0

#import "CHLMovieViewController.h"
#import "CHLCollectionViewCell.h"
#import "CHLMovieCellModel.h"
#import <AFNetworking.h>

@interface CHLMovieViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;

@property (nonatomic, strong) NSMutableArray * dataArr;
@end

@implementation CHLMovieViewController
-(NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self loadData];
}
-(void)loadData
{
    AFHTTPSessionManager * mangaer = [AFHTTPSessionManager manager];
    [mangaer GET:@"http://v3.wufazhuce.com:8000/api/movie/list/0" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseDict) {
        NSArray * arr = responseDict[@"data"];
        for (NSDictionary * dict in arr) {
            CHLMovieCellModel * model = [CHLMovieCellModel modelWithDict:dict];
            [self.dataArr addObject:model];
        }
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
-(void)setupSubviews
{
    [self addNavgationBarRightPersonal];
    [self addNavgationBarLeftSearch];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    //cell的大小
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, 140);
    //最小行间距
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 0;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    collectionView.backgroundColor = [UIColor colorWithWhite:229 / 255.0 alpha:1];
    
    [collectionView registerClass:[CHLCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.collectionView = collectionView;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    //[self.collectionView reloadData];
}


#pragma mark - collection  dataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //NSLog(@"%ld",self.dataArr.count);
    return self.dataArr.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CHLCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    CHLMovieCellModel * model = self.dataArr[indexPath.row];
    cell.model = model;
    //NSLog(@"bbb");
    return cell;
    
}
#pragma mark - collection的代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
