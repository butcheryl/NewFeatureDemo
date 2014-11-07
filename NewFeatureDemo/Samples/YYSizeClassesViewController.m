//
//  YYSizeClassesViewController.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/7.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import "YYSizeClassesViewController.h"

@interface YYSizeClassesViewController ()

@end

@implementation YYSizeClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *aView = [[UIView alloc] init];
    aView.tag = 1000;
    aView.backgroundColor = [UIColor redColor];
    [self.view addSubview:aView];
    
    UIView *bView = [UIView new];
    bView.tag = 2000;
    bView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bView];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(64 +10, 10, 10, 10);
    [aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(padding.top);
        make.left.equalTo(self.view.mas_left).with.offset(padding.left);
        make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
        make.height.equalTo(bView.mas_height);
    }];
    
    [bView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aView.mas_bottom).with.offset(10);
        make.left.equalTo(self.view.mas_left).with.offset(padding.left);
        make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-padding.bottom);
    }];
}
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
              withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    UIView *aView = [self.view viewWithTag:1000];
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
     {
         if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
             //To Do: modify something for compact vertical size
             [aView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(self.view.mas_top).with.offset(30 + 10);
             }];
             NSLog(@"1");
         } else {
             //To Do: modify something for other vertical size
             [aView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(self.view.mas_top).with.offset(64 + 10);
             }];
             NSLog(@"2");
         }
         [self.view setNeedsLayout];
     } completion:nil];
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
