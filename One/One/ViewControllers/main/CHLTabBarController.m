//
//  CHLTabBarController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import "CHLTabBarController.h"
#import "CHLHomeViewController.h"
#import "CHLReadViewController.h"
#import "CHLMusicViewController.h"
#import "CHLMovieViewController.h"

@interface CHLTabBarController ()

@end

@implementation CHLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CHLHomeViewController * HomeVc = [[CHLHomeViewController alloc]init];
    UINavigationController * HomeNav = [[UINavigationController alloc]initWithRootViewController:HomeVc];
    //设置tabBar上每个图标下的title
    //HomeNav.title = @"首页"; 用下面的代替了Vc.tabBarItem.title = tabBarItemTitle[idx]; 效果一样。
    //设置NavBar的title
    HomeNav.navigationBar.topItem.title = @"ONE";
    
    CHLReadViewController * ReadVc = [[CHLReadViewController alloc]init];
    UINavigationController * ReadNav = [[UINavigationController alloc]initWithRootViewController:ReadVc];
    ReadNav.navigationBar.topItem.title = @"阅读";
    
    CHLMusicViewController * MusicVc = [[CHLMusicViewController alloc]init];
    UINavigationController * MusicNav = [[UINavigationController alloc]initWithRootViewController:MusicVc];
    MusicNav.navigationBar.topItem.title = @"音乐";
    
    CHLMovieViewController * MovieVc = [[CHLMovieViewController alloc]init];
    UINavigationController * MovieNav = [[UINavigationController alloc]initWithRootViewController:MovieVc];
    MovieNav.navigationBar.topItem.title = @"电影";
    
    self.viewControllers = @[HomeNav,ReadNav,MusicNav,MovieNav];
    [self setupTabBar];
    
    
}
-(void)setupTabBar
{
    NSArray * tabBarImg = @[@"tab_home",@"tab_reading",@"tab_music",@"tab_movie"];
    NSArray * tabBarItemTitle = @[@"首页",@"阅读",@"音乐",@"电影"];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull Vc, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString * normalImgStr = [NSString stringWithFormat:@"%@_normal",tabBarImg[idx]];
        NSString * selectedImgStr = [NSString stringWithFormat:@"%@_selected",tabBarImg[idx]];
        UIImage * normalImg = [UIImage imageNamed:normalImgStr];
        UIImage * selectedImg = [UIImage imageNamed:selectedImgStr];
        Vc.tabBarItem.image = normalImg;
        Vc.tabBarItem.selectedImage = selectedImg;
        Vc.tabBarItem.title = tabBarItemTitle[idx];
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
