//
//  YYSplitViewController.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/7.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import "YYSplitViewController.h"

@interface YYSplitViewController () <UISplitViewControllerDelegate>

@end

@implementation YYSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 64 + 10, self.view.bounds.size.width - 20, 50)];
    label.text = @"To be continued!";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
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
