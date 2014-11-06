//
//  YYBlurEffectViewController.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/5.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import "YYBlurEffectViewController.h"

@interface YYBlurEffectViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YYBlurEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    // 创建一个样式为UIBlurEffectStyle.Light的UIBlurEffect，定了要应用的效果，其他的效果样式还有UIBlurEffectStyle.ExtraLight和UIBlurEffectStyle.Dark
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    // 创建一个UIVisualEffectView并为其设置需要使用的效果。UIVisualEffectView是UIView的子类，在这里单独用来定义和显示复杂的虚化效果。
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [self.view addSubview:blurView];

    // 为模糊视图添加约束
    [blurView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 0, 0, 200));
    }];
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    aButton.backgroundColor = [UIColor redColor];
    aButton.layer.cornerRadius = 10.f;
    [aButton setTintColor:[UIColor blackColor]];
    [aButton setTitle:@"按钮" forState:UIControlStateNormal];
    [blurView.contentView addSubview:aButton];
    
    [aButton mas_makeConstraints:^(MASConstraintMaker *make) {
        // 与父视图中心点X坐标相同
        make.centerX.equalTo(blurView.mas_centerX);
        // 与父视图宽度相差20
        make.width.equalTo(blurView.mas_width).offset(-20);
        // 距离上边距10
        make.top.equalTo(blurView.mas_top).with.offset(10);
        // 视图高度50
        make.height.equalTo(@50);
    }];
    
    // 提示：UIVibrancyEffect必须添加到已经用UIBlurEffect配置过的UIVisualEffectView中去，否则就不会有任何的虚化图片会应用Vibrancy效果。
    
//    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
//    // 创建UIVisualEffectView来应用Vibrancy效果,这个过程恰巧跟生成模糊图一样。因为你使用的是自动布局所以在这里需要把自适应大小改为false
//    UIVisualEffectView *vibrancyView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
//    // 将optionsView添加入vibrancyView的contentView属性里，这样就能确保所有的控制视图都会应用Vibrancy效果
//    vibrancyView.frame = CGRectMake(0, 0, 150, self.view.bounds.size.height);
//    [vibrancyView.contentView addSubview:aButton];
//    // 最后你需要在blurView的contentView里加入vibrancyView来完成效果
//    [blurView.contentView addSubview:vibrancyView];
    
    
    
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *pool = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool];
    
    cell.backgroundColor = RANDOM_COLOR;
    
    return cell;
    
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
