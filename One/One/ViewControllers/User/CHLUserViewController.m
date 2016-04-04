//
//  CHLUserViewController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import "CHLUserViewController.h"

@interface CHLUserViewController ()

@end

@implementation CHLUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubviews];
}
-(void)createSubviews
{
    [self createBackButton];
}
-(void)createBackButton
{
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back_default_wight"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(20, 10, 44, 44);
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}
-(void)backButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
