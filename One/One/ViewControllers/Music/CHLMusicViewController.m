//
//  CHLMusicViewController.m
//  One
//
//  Created by 陈亮 on 16/4/4.
//  Copyright © 2016年 陈亮. All rights reserved.
//

#import "CHLMusicViewController.h"

@interface CHLMusicViewController ()

@end

@implementation CHLMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavgationBarRightPersonal];
    [self addNavgationBarLeftSearch];
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
