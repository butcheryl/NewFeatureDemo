//
//  YYDynamicBlurViewController.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/4.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import "YYBlurViewController.h"
#import "UIImage+ImageEffects.h"

@interface YYBlurViewController ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation YYBlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog_1.png"]];
    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    imageView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imageView];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"弹出" style:UIBarButtonItemStylePlain target:self action:@selector(displayBlurViewButtonClicked:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(-150, 0, 150, self.view.bounds.size.height)];
    self.bgView.backgroundColor = [UIColor colorWithPatternImage:[self updateBlur]];
    self.bgView.hidden = YES;
    [self.view addSubview:self.bgView];
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    aButton.frame = CGRectMake(10, 50, 130, 44);
    aButton.backgroundColor = [UIColor redColor];
    [aButton setTitle:@"按钮" forState:UIControlStateNormal];
    [aButton setTintColor:[UIColor whiteColor]];
    aButton.layer.cornerRadius = 10.f;
    [self.bgView addSubview:aButton];

}
- (void)displayBlurViewButtonClicked:(UIBarButtonItem *)sender {
    self.bgView.hidden = NO;
    [UIView animateWithDuration:0.5f animations:^{
        if (self.bgView.frame.origin.x < 0) {
            self.bgView.frame = CGRectMake(0, 0, 150, self.view.bounds.size.height);
        } else {
            self.bgView.frame = CGRectMake(-150, 0, 150, self.view.bounds.size.height);
        }
    } completion:^(BOOL finished) {
        if (self.bgView.frame.origin.x < 0) {
            self.bgView.hidden = YES;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIImage *)updateBlur {
    //创建一个新的ImageContext来绘制截图，你没有必要去渲染一个完整分辨率的高清截图，使用ImageContext可以节约掉不少的计算量
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 1);

    //将当前控制器中的界面绘制到ImageContext中去，因为你需要确保选项界面是隐藏状态因此你需要等待屏幕刷新后才能绘制
    [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    
    //将ImageContext放入一个UIImage
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIColor *tintColor = [UIColor colorWithWhite:0.11 alpha:0.5];// 图片模糊化后的灰度
    UIImage *blurImage = [image applyBlurWithRadius:10 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];

    //清理掉这个ImageContext
    UIGraphicsEndImageContext();
    return blurImage;
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
