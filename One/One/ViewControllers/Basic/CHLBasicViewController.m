//
//  CHLBasicViewController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import "CHLBasicViewController.h"
#import "CHLUserViewController.h"
#import "CHLSearchViewController.h"
@interface CHLBasicViewController ()

@end

@implementation CHLBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - UI部分
-(void)addNavgationBarRightPersonal
{
    UIButton * personalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [personalButton setImage:[UIImage imageNamed:@"nav_me_default"] forState:UIControlStateNormal];
    [personalButton setImage:[UIImage imageNamed:@"nav_me_highlighted"] forState:UIControlStateHighlighted];
    personalButton.frame = CGRectMake(0, 0, 25, 25);
    [personalButton addTarget:self action:@selector(personalButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * personalItem = [[UIBarButtonItem alloc]initWithCustomView:personalButton];
    self.navigationItem.rightBarButtonItem = personalItem;
    
    
}
-(void)addNavgationBarRightMusic
{
    UIButton * musicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [musicButton setImage:[UIImage imageNamed:@"myplayerstop"] forState:UIControlStateNormal];
    musicButton.frame = CGRectMake(0, 0, 25, 25);
    [musicButton addTarget:self action:@selector(musicButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * musicItem = [[UIBarButtonItem alloc]initWithCustomView:musicButton];
    
    self.navigationItem.rightBarButtonItem = musicItem;
}
-(void)personalButtonClick
{
    CHLUserViewController * userVc = [[CHLUserViewController alloc]init];
    userVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:userVc animated:YES completion:nil];
    
}
-(void)musicButtonClick
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addNavgationBarLeftSearch
{
    UIButton * searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, 25, 25);
    [searchButton setTitle:@"🔍" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchStartClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    self.navigationItem.leftBarButtonItem = searchItem;
}
-(void)searchStartClick
{
    CHLSearchViewController * SearchVc = [[CHLSearchViewController alloc]init];
    [self presentViewController:SearchVc animated:YES completion:nil];
}
@end
