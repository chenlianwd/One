//
//  CHLSearchViewController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//
//UISearchBar的一些用法

#import "CHLSearchViewController.h"

@interface CHLSearchViewController ()<UISearchBarDelegate>
@property (nonatomic, strong)UISearchBar * searchBar;
@end

@implementation CHLSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    self.searchBar.delegate = self;
    
    
    
    
}
/**
 *  搜索图标的左移动画
 */
-(void)viewDidAppear:(BOOL)animated
{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
//    [self.searchBar becomeFirstResponder];
//    [UIView commitAnimations];
    [UIView animateWithDuration:0.5 animations:^{
        [self.searchBar becomeFirstResponder];
    }];

}
-(void)setupSubViews
{
    [self createSearchBar];
}
-(void)createSearchBar
{
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    
    //设置这个颜色值会影响搜索框中的光标的颜色
    self.searchBar.tintColor = GrayTextColor;
    //设置这个颜色会影响搜索框的背景颜色
    self.searchBar.barTintColor = SearchBarBackgroundColor;
    [self.searchBar setShowsCancelButton:YES animated:YES];
    //设置半透明
    //self.searchBar.translucent = YES;
    
    
    [self.view addSubview:self.searchBar];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - SearchBar delegate
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"sososo");
}
@end
