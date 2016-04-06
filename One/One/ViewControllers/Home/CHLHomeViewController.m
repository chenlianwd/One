//
//  CHLHomeViewController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import "CHLHomeViewController.h"
#import "CHLHomeModel.h"
#import "CHLHomeView.h"
#import <AFNetworking.h>
@interface CHLHomeViewController ()
{
    AAPullToRefresh * LeftPullToRefresh;
}
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIButton * diaryButton;
@property (nonatomic, strong) UIButton * likeButton;
@property (nonatomic, strong) UILabel * likeNumLabel;
@property (nonatomic, strong) UIButton * shareButton;
//存放cell模型
@property (nonatomic, strong) NSMutableArray * dataSource;

@property (nonatomic, strong) CHLHomeView * homeV ;
@end

@implementation CHLHomeViewController
-(NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    [self setupSubViews];
    
}
-(void)setupSubViews
{
    [self addNavgationBarRightPersonal];
    [self addNavgationBarLeftSearch];
    UIImageView * imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav_home_title"]];
    self.navigationItem.titleView = imgView;
    self.homeV= [[CHLHomeView alloc]initWithFrame:self.view.frame];
    self.view = self.homeV;
    //[self createScrollView];
}
//-(void)createScrollView
//{
//    
//    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
//    NSInteger count = self.dataSource.count;
//    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * count,SCREEN_HEIGHT);
//    for (int i = 0; i < self.dataSource.count; i++) {
//        CHLHomeView * HomeV = [[CHLHomeView alloc]initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        CHLHomeModel * model = self.dataSource[i];
//        HomeV.model = model;
//        [self.scrollView addSubview:HomeV];
//        
//    }
//    
//    self.scrollView.showsVerticalScrollIndicator = YES;
//    self.scrollView.pagingEnabled = YES;
//    [self.view addSubview:self.scrollView];
//    
//    
//}
-(void)loadData
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://v3.wufazhuce.com:8000/api/hp/more/0" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseDict) {
        NSArray * arr = responseDict[@"data"];
        for (NSDictionary * dict in arr) {
            CHLHomeModel * model = [CHLHomeModel HomeModelWithDictionary:dict];
            [self.dataSource addObject:model];
        }
        self.homeV.model = self.dataSource[0];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
