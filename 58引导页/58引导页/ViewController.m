//
//  ViewController.m
//  58引导页
//
//  Created by WJX on 16/8/22.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ViewController.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>
/** obj*/
@property (nonatomic, strong, nullable) UIImageView  *sunImageView;
/** obj*/
@property (nonatomic, strong, nullable) UIImageView  *personImageView;



@end

@implementation ViewController

#pragma mark - --- lift cycle 生命周期 ---
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.sunImageView];
    [self.view addSubview:self.personImageView];

    UIImage *bgImage = [UIImage imageNamed:@"520_userguid_bg"];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize  = bgImage.size;
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.decelerationRate = 0.5;
    [self.view insertSubview:scrollView atIndex:0];

    UIImageView *bg = [[UIImageView alloc]initWithImage:bgImage];
    CGRect rect = bg.frame;
    rect.size.height = self.view.bounds.size.height;
    bg.frame =rect;
    [scrollView addSubview:bg];



}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView  {
    CGFloat offsetX = scrollView.contentOffset.x;
    int intOffsetX = (int)offsetX;
    NSString *imageName = [NSString stringWithFormat:@"520_userguid_person_taitou_%d",(intOffsetX % 2 + 1)];
     UIImage *image = [UIImage imageNamed:imageName];
    _personImageView.image = image;
    // 旋转小太阳
    _sunImageView.transform = CGAffineTransformRotate(_sunImageView.transform, (5) / 180.0 * M_PI);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- getters and setters 属性 ---
- (UIImageView *)sunImageView {
    if (!_sunImageView) {
        _sunImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW - 125, 60, 125, 125)];
        _sunImageView.image  = [UIImage imageNamed:@"520_userguid_sun"];
    }
    return _sunImageView;
}

- (UIImageView *)personImageView {
    if (!_personImageView) {
        _personImageView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 209, 200)];
        _personImageView.image = [UIImage imageNamed:@"520_userguid_person_taitou_1"];
        _personImageView.center = CGPointMake(kScreenW/2, kScreenH - 180);
    }
    return _personImageView;
}

@end
