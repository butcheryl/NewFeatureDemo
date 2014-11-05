//
//  YYAlertViewController.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/4.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import "YYAlertViewController.h"


@interface YYAlertViewController ()

@property (nonatomic, strong) UISegmentedControl *segment;

@end

@implementation YYAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"Alert", @"ActionSheet"]];
    self.segment.frame = CGRectMake(10, 74, self.view.frame.size.width - 20, 30);
    self.segment.selectedSegmentIndex = 0;
    [self.view addSubview:self.segment];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blueColor];
    button.frame = CGRectMake(10, 114, self.view.frame.size.width, 50);
    [button setTitle:@"显示" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(displayButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
- (void)displayButtonTapped:(id)sender {
    UIAlertControllerStyle style;
    switch (self.segment.selectedSegmentIndex) {
        case 0:
            style = UIAlertControllerStyleAlert;
            break;
        case 1:
            style = UIAlertControllerStyleActionSheet;
            break;
        default :
            break;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题"
                                                                   message:@"信息"
                                                            preferredStyle:style];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
        if (style !=UIAlertControllerStyleActionSheet) {
            NSLog(@"%@", ((UITextField *)alert.textFields[0]).text);
        }
        NSLog(@"确定");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction *action) {
                                                         NSLog(@"取消");
                                                     }];
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"删除"
                                                       style:UIAlertActionStyleDestructive
                                                     handler:^(UIAlertAction *action) {
                                                         NSLog(@"删除");
                                                     }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [alert addAction:destructiveAction];
    
    if (style == UIAlertControllerStyleAlert) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"文本框";
        }];
    }
    
    [self presentViewController:alert animated:YES completion:^{}];
    
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
