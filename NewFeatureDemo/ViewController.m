//
//  ViewController.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/3.
//  Copyright (c) 2014年 于磊. All rights reserved.
//
@import CoreText;
#import "ViewController.h"
#import "YYOptionsCell.h"
#import "YYAlertViewController.h"

#define kItemKeyTitle       @"title"
#define kItemKeyDescription @"description"
#define kItemKeyClassPrefix @"prefix"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"iOS8新特性";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[YYOptionsCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    [self createDataSource];
}
- (void)createDataSource {
    self.dataArray = @[
                       // UIAlertController
                       @{kItemKeyTitle: @"UIAlertController",
                         kItemKeyDescription: @"    UIAlertController类替代UIActionSheet和UIAlertView类来显示提示信息。",
                         kItemKeyClassPrefix: @"YYAlert"},
                       // iOS7虚化效果
                       @{kItemKeyTitle: @"iOS7虚化效果",
                         kItemKeyDescription: @"    在iOS7中，一个重大的改变就是随处可见的虚化，这在通知中心和控制中心表现得尤为抢眼, 精明又狡猾的程序员们很快的创造了自己基于模糊静态图片方法来破解实时模糊的算法。",
                         kItemKeyClassPrefix: @"YYBlur"},
                       // iOS8虚化效果
                       @{kItemKeyTitle: @"iOS8虚化效果",
                         kItemKeyDescription: @"    iOS8在开发者工具箱中添加了官方的模糊效果，不仅相当高效，而且其使用的简单程度让人惊叹.",
                         kItemKeyClassPrefix: @"YYBlurEffect"},
                       // SizeClasses
                       @{kItemKeyTitle: @"Size Classes",
                         kItemKeyDescription: @"    根据屏幕大小横竖各种状态的组合，详细可分9种。在storyboard中与autoLayout完美搭配。",
                         kItemKeyClassPrefix: @"YYSizeClasses"},
                       // UISplitViewController
                       @{kItemKeyTitle: @"UISplitViewController",
                         kItemKeyDescription: @"    UISplitViewController iPad only？No！现在，在iPhone中同样可以使用",
                         kItemKeyClassPrefix: @"YYSplit"},
                       // UISearchController
                       @{kItemKeyTitle: @"UISearchController",
                         kItemKeyDescription: @"    UISearchController类替代UISearchDisplayController来管理搜索相关的显示",
                         kItemKeyClassPrefix: @"YYSearch"}
                       ];
}
#pragma -mark UILabel Fit Size
- (CGFloat)labelHeightWithViewWidth:(CGFloat)width str:(NSString *)str {
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){0, 0, width, 0}];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:14.f];
    label.text = str;
    [label sizeToFit];
    return label.frame.size.height;
}
#pragma -mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = self.dataArray[indexPath.row];
    CGFloat labelHeight = [self labelHeightWithViewWidth:self.view.frame.size.width - 40 str:item[kItemKeyDescription]];
    return labelHeight + 50.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYOptionsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell setData:self.dataArray[indexPath.row]];
    return cell;
}
#pragma -mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *item = self.dataArray[indexPath.row];
    // 取得跳转页面的类型
    NSString *className = [item[kItemKeyClassPrefix] stringByAppendingString:@"ViewController"];

    UIViewController *instance = (UIViewController *)[[NSClassFromString(className) alloc] init];
    
    // 实例化成功后，跳转界面
    if ([instance isKindOfClass:[UIViewController class]]) {
        instance.view.backgroundColor = [UIColor whiteColor];
        instance.title = item[kItemKeyTitle];
        [self.navigationController pushViewController:instance animated:YES];
    }
    // 取消表格行选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
