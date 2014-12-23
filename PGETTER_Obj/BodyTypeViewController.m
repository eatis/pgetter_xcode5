//
//  BodyTypeViewController.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/02.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "BodyTypeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BodyTypeViewController ()

@end

@implementation BodyTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, 320, [app pagerViewHeight]);
    [self.view setBackgroundColor:[UIColor colorWithRed:0.973f green:0.973f blue:1.0f alpha:1.0]];
    //self.view.layer.shadowOpacity = 0.8;
    //self.view.layer.shadowOffset = CGSizeMake(2, 2);
    
    _viewWidth  = self.view.frame.size.width;
    _viewHeight = self.view.frame.size.height - 50;
    
    
    [self setUpStatureUI];
    
    [self setUpSlideIndi];

    
    //==============================================
    //        UIButtonの設定  start
    //==============================================
    // buttonの作成
    /*
    UIButton *_getPBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _getPBtn.frame = CGRectMake(0, 0, self.view.bounds.size.width/3, 40);
    [_getPBtn setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - 20 - 50)];
    [_getPBtn setTitle:@"GET P" forState:UIControlStateNormal];
    [_getPBtn setTitle:@"GET P" forState:UIControlStateHighlighted];
    [_getPBtn setTitle:@"押せません" forState:UIControlStateDisabled];
    [_getPBtn setBackgroundColor:[UIColor colorWithRed:0.804 green:0.200 blue:0.200 alpha:1.0f]];
    _getPBtn.titleLabel.shadowColor = [UIColor colorWithRed:0.498 green:0.498 blue:0.498 alpha:1.0f];
    _getPBtn.titleLabel.shadowOffset = CGSizeMake(2.0, 2.0);
    [_getPBtn setTitleColor:[UIColor colorWithRed:0.973f green:0.973f blue:1.0f alpha:1.0] forState:UIControlStateNormal];
    [_getPBtn setTitleColor:[UIColor colorWithRed:0.812f green:0.812f blue:0.812f alpha:1.0] forState:UIControlStateHighlighted];
    
    //フォントを設定する
    //[btn.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    _getPBtn.titleLabel.font = [ UIFont fontWithName:@"Helvetica-Bold" size:25 ];
    // ボタンが押された時にhogeメソッドを呼び出す
    [_getPBtn addTarget:self.delegate
                 action:@selector(pushToNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getPBtn];
     */
    //NSLog(@"%@",self.view.subviews);
    //==============================================
    //        UIButtonの設定  end
    //==============================================
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark -
# pragma mark set stature ui methods
# pragma mark -
- (void)setUpStatureUI {
    //==============================================
    //        UIImageViewの設定  start
    //==============================================
    NSString *_upStatureName,*_downStatureName;
    if ([app pagerViewHeight] == 355) {
        _upStatureName = @"up-stature-30.png";
        _downStatureName = @"down-stature-30.png";
    } else {
        _upStatureName = @"up-stature.png";
        _downStatureName = @"down-stature.png";
    }
    
    _viewHeight = _viewHeight - 28;
    
    
    // 画像表示
    UIImage *_upArrow = [UIImage imageNamed:_upStatureName];
    UIImage *_maskedUpArrowImage = [_upArrow imageMaskWithColor:[UIColor colorWithRed:255.0f/255.0f green:63.0f/255.0f blue:98.0f/255.0f alpha:1.0f] shadowOffset:CGPointMake(0.0f, 0.0f)];
    UIImageView *_upArrowIV = [[UIImageView alloc] initWithImage:_maskedUpArrowImage];
    [_upArrowIV setCenter:CGPointMake(_viewWidth/5, _viewHeight/4)];
    //_upArrowIV.frame = CGRectMake(0, 0, _upArrow.size.width, _upArrow.size.height);
    [self.view addSubview:_upArrowIV];
    
    
    // 画像表示
    UIImage *_statureMan = [UIImage imageNamed:@"woman1.png"];
    // マスク画像を生成
    UIImage *_maskedStatureImage = [_statureMan imageMaskWithColor:[UIColor colorWithRed:255.0f/255.0f green:63.0f/255.0f blue:98.0f/255.0f alpha:1.0f] shadowOffset:CGPointMake(0.0f, 0.0f)];
    
    UIImageView *_statureManIV = [[UIImageView new] initWithImage:_maskedStatureImage];
    _statureManIV.frame = CGRectMake(0, 0, _statureMan.size.width, _statureMan.size.height);
    [_statureManIV setCenter:CGPointMake(_viewWidth/5, _viewHeight/2)];
    [self.view addSubview:_statureManIV];
    
    
    
    // 画像表示例文
    UIImage *_downArrow = [UIImage imageNamed:_downStatureName];
    UIImage *_maskedDownArrowImage = [_downArrow imageMaskWithColor:[UIColor colorWithRed:255.0f/255.0f green:63.0f/255.0f blue:98.0f/255.0f alpha:1.0f] shadowOffset:CGPointMake(0.0f, 0.0f)];
    UIImageView *_downArrowIV = [[UIImageView alloc] initWithImage:_maskedDownArrowImage];
    [_downArrowIV setCenter:CGPointMake(_viewWidth/5, _viewHeight *3/4)];
    //_downArrowIV.frame = CGRectMake(_statureManIV.frame.origin.x + _statureMan.size.width/2 - _downArrow.size.width/2, self.view.bounds.size.height * 3/4 - _downArrow.size.height/2, _downArrow.size.width, _downArrow.size.height);
    [self.view addSubview:_downArrowIV];
    //==============================================
    //        UIImageViewの設定  end
    //==============================================
    
    //==============================================
    //        UILabelの設定  start
    //==============================================
    //身長の上限ラベル
    UILabel *_upStaturelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [_upStaturelabel setCenter:CGPointMake(_upArrowIV.center.x, 35)];
    [_upStaturelabel setText:@"太"];
    [_upStaturelabel setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [_upStaturelabel setTextAlignment:NSTextAlignmentCenter]; // 中央に表示
    [_upStaturelabel setTextColor:[UIColor colorWithRed:0.255f green:0.333f blue:0.376f alpha:1.0]];
    //フォントを設定する
    _upStaturelabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    // ラベル表示
    [self.view addSubview:_upStaturelabel];
    
    //身長の下限ラベル
    UILabel *_downStaturelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [_downStaturelabel setCenter:CGPointMake(_downArrowIV.center.x, self.view.frame.size.height - 115)];
    [_downStaturelabel setText:@"細"];
    [_downStaturelabel setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [_downStaturelabel setTextAlignment:NSTextAlignmentCenter]; // 中央に表示
    [_downStaturelabel setTextColor:[UIColor colorWithRed:0.255f green:0.333f blue:0.376f alpha:1.0]];
    //フォントを設定する
    _downStaturelabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    // ラベル表示
    [self.view addSubview:_downStaturelabel];
    //==============================================
    //        UILabelの設定  end
    //==============================================
    
    _viewHeight = _viewHeight + 28;
}

# pragma mark -
# pragma mark set slide indi ui methods
# pragma mark -
- (void)setUpSlideIndi {
    
    //==============================================
    //        UISliderの設定  start
    //==============================================
    //スライダーの生成
    _viewHeight = _viewHeight - 28;
    
    UISlider *sl = [UISlider new];
    [sl setFrame:CGRectMake(0, 0, _viewHeight * 4/5, 20)];
    [sl setCenter:CGPointMake(_viewWidth * 1/2, _viewHeight/2 - 4.5)];
    //UISliderを90°回転して縦方向にする
    sl.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    //スライダーの設定（最小値0、最大値10）
    sl.minimumValue = 0.0;
    sl.maximumValue = 150.0;
    
    //スライダーの初期設定（初期値3、初期画像sad.png）
    sl.value = 75.0;
    _statureLabel.tag = 2;
    
    // 画像表示
    UIImage *_fingerImage = [UIImage imageNamed:@"finger.png"];
    // マスク画像を生成
    UIImage *_maskedFingerImage = [_fingerImage imageMaskWithColor:[UIColor colorWithRed:0.255f green:0.333f blue:0.376f alpha:1.0] shadowOffset:CGPointMake(0.0f, 0.0f)];
    
    UIImage *_maskedFingerImage2 = [_fingerImage imageMaskWithColor:[UIColor colorWithRed:0.161f green:0.216f blue:0.235f alpha:1.0] shadowOffset:CGPointMake(0.0f, 0.0f)];
    
    [sl setThumbImage:_maskedFingerImage forState:UIControlStateNormal];
    [sl setThumbImage:_maskedFingerImage2 forState:UIControlStateHighlighted];
    //UISliderのバーを透明にするためにバーに透明な画像を設定している
    [sl setMinimumTrackImage:[UIImage imageNamed:@"skeleton.png"] forState:UIControlStateNormal];
    [sl setMaximumTrackImage:[UIImage imageNamed:@"skeleton.png"] forState:UIControlStateNormal];
    
    //スライド中は値変化を反映しない
    sl.continuous = YES;
    
    //イベント発生時にSliderChangedのメソッドへ引き渡す
    [sl addTarget:self action:@selector(SliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    //ビューに追加
    [self.view addSubview:sl];
    
    //NSLog(@"%@", [sl subviews]); // スライダーの構造を調べる
    //==============================================
    //        UISliderの設定  end
    //==============================================
    
    
    //==============================================
    //        UILabelの設定  start
    //==============================================
    // テスト用のラベル
    
    _statureLabel = [UILabel new];
    [_statureLabel setFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    [_statureLabel setCenter:CGPointMake(_viewWidth * 3/4, _viewHeight/2 - 4.5)];
    [_statureLabel setText:[NSString stringWithFormat:@"普通"]];
    [_statureLabel setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    [_statureLabel setTextAlignment:NSTextAlignmentCenter]; // 中央に表示
    
    [_statureLabel setTextColor:[UIColor colorWithRed:0.255f green:0.333f blue:0.376f alpha:1.0]];
    //フォントを設定する
    _statureLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    
    
    // ラベル表示
    [self.view addSubview:_statureLabel];
    //==============================================
    //        UILabelの設定  end
    //==============================================
    
    _viewHeight = _viewHeight + 28;
}


#pragma mark self ViewController methods
- (void)SliderChanged:(UISlider*)slider {
    
    //NSLog(@"スライダーの値が変わりました");
    
    //スライダーの現在値を取得
    float v = 0;
    v = slider.value;
    //NSLog(@"slider %f", v);
    
    // ハンドルの中心x座標を取得、これをインジケーターの新しいx座標とする
    CGFloat ind_y = [[slider.subviews objectAtIndex:2] center].x;
    
    if (slider.value == 0) {
        _statureLabel.text = [NSString stringWithFormat:@"デブ"];
        _statureLabel.tag = 0;
    } else if (slider.value <= 50) {
        _statureLabel.text = [NSString stringWithFormat:@"ぽちゃ"];
        _statureLabel.tag = 1;
    } else if (slider.value > 50 && slider.value <= 100) {
        _statureLabel.text = [NSString stringWithFormat:@"普通"];
        _statureLabel.tag = 2;
    } else if (slider.value == 150) {
        _statureLabel.text = [NSString stringWithFormat:@"がり"];
        _statureLabel.tag = 3;
    } else {
        _statureLabel.text = [NSString stringWithFormat:@"すら"];
        _statureLabel.tag = 4;
    }
    
    
    CGPoint _point = _statureLabel.center;
    //_frame.origin.y = _statureLabel.bounds.size.height*slider.value;
    
    if ([app pagerViewHeight] == 355) {
        _point.y = ind_y + 23.25;
    } else {
        _point.y = ind_y + 32.25;
    }
    //NSLog(@"%2.f",ind_y);
    _statureLabel.center = _point;
    
}

@end
