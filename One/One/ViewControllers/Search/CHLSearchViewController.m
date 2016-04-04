//
//  CHLSearchViewController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//
//UISearchBar的一些用法
//http://my.oschina.net/u/2340880/blog/509756
#import "CHLSearchViewController.h"

@interface CHLSearchViewController ()
@property (nonatomic, strong)UISearchBar * searchBar;
@end

@implementation CHLSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    
    //设置这个颜色值会影响搜索框中的光标的颜色
    self.searchBar.tintColor = GrayTextColor;
    //设置这个颜色会影响搜索框的背景颜色
    self.searchBar.barTintColor = LittleGrayColor;
    [self.searchBar setShowsCancelButton:YES animated:YES];
    
    [self.view addSubview:self.searchBar];
    
    
    
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
