//
//  pGetViewController.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/26.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "pGetViewController.h"
#import "CalcPEquation.h"

@interface pGetViewController ()

@end

@implementation pGetViewController

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
    //==============================================
    //        NADViewの設定　start
    //==============================================
    // Frameを指定してNADViewを生成
    self.nadView = [[NADView alloc] init];
    [self.nadView setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
    
    // nendSDKログ出力の設定(任意)
    [self.nadView setIsOutputLog:YES];
    
    // 広告枠のapikey/spotidを設定します(必須)
    [self.nadView setNendID:@"d60a6a8da12ab7eca9289481f48bb2b8d9cfcfdc" spotID:@"86957"];
    
    // delegateを受けるオブジェクトを指定(必須)
    [self.nadView setDelegate:self];
    
    // 背景色を指定(任意)
    [self.nadView setBackgroundColor:[UIColor cyanColor]];
    
    // 読み込み開始(必須)
    [self.nadView load];
    //==============================================
    //        NADViewの設定　end
    //==============================================
    
    [_sMStemp170 setText:@"15 段目"];
    [_sMSteps160 setText:@"14 段目"];
    [_sMSteps150 setText:@"13 段目"];
    
    [_steps170 setText:@"15 段目"];
    [_steps160 setText:@"14 段目"];
    [_steps150 setText:@"13 段目"];
    
    [_mSteps170 setText:@"15 段目"];
    [_mSteps160 setText:@"14 段目"];
    [_mSteps150 setText:@"13 段目"];
    
    //_myHeight = 170.0;
    //_bodyTypeDataTag = 1;
    //_locationDataTag = 5;
    NSLog(@"データの引き継ぎ %f %d %d",_myHeight , _bodyTypeDataTag, _locationDataTag);
    [self calcNumberOfStages];
    
    
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        //viewControllerで制御することを伝える。iOS7 からできたメソッド
        [self setNeedsStatusBarAppearanceUpdate];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden {
    //NOでステータスバーを表示（YESなら非表示）
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    //文字を白くする
    return UIStatusBarStyleDefault;
}



#pragma mark self ViewController methods
- (IBAction)backToRootViewController:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)backToParentViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)calcNumberOfStages {
    //calcPEquationのテスト関連
    CalcPEquation *_calcStairs = [CalcPEquation new];
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:VERYTALL withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:0];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _sMStemp170.text = [NSString stringWithFormat:@"×"];
    } else {
        _sMStemp170.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:TALL withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:0];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _sMSteps160.text = [NSString stringWithFormat:@"×"];
    } else {
        _sMSteps160.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:MEDIUM withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:0];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _sMSteps150.text = [NSString stringWithFormat:@"×"];
    } else {
        _sMSteps150.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:VERYTALL withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:1];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _steps170.text = [NSString stringWithFormat:@"×"];
    } else {
        _steps170.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:TALL withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:1];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _steps160.text = [NSString stringWithFormat:@"×"];
    } else {
        _steps160.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:MEDIUM withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:1];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _steps150.text = [NSString stringWithFormat:@"×"];
    } else {
        _steps150.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:VERYTALL withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:2];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _mSteps170.text = [NSString stringWithFormat:@"×"];
    } else {
        _mSteps170.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:TALL withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:2];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _mSteps160.text = [NSString stringWithFormat:@"×"];
    } else {
        _mSteps160.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
    _stairs = [_calcStairs calcStepsMyHeight:_myHeight heightOfTerget:MEDIUM withState:_locationDataTag withTergetBodyType:_bodyTypeDataTag withSkirtLength:2];
    NSLog(@"stairs %d",_stairs);
    if (_stairs == 0) {
        _mSteps150.text = [NSString stringWithFormat:@"×"];
    } else {
        _mSteps150.text = [NSString stringWithFormat:@"%d 段目",_stairs];
    }
    
}

# pragma mark -
# pragma mark NADView methods
# pragma mark -
// ------------------------------------------------------------------------------------------------
// リフレッシュの中断と再開
// ------------------------------------------------------------------------------------------------

// 画面遷移が発生するような構造で
// 各ViewControllerごとにNADViewインスタンスを生成するような場合には
// 画面の表示状態に応じて pause / resume メッセージを送信し
// 広告のリフレッシュ（定期受信ローテーション）を 一時中断 / 再開 してください
// 無駄なネットワークアクセスや、impressionを抑える事が出来ます。

// この画面が表示される際に広告のリフレッシュを再開します
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //ステータスバーの色を指定
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    // 再開
    [self.nadView resume];
    
    // 注意：他アプリ起動から、自アプリが復帰した際に広告のリフレッシュを再開するには
    // AppDelegate applicationDidEnterBackground などを利用してください
    
    // 広告位置設定例
    // １．画面上部に広告を表示させる場合
    //[self.nadView setFrame:CGRectMake((self.view.frame.size.width - NAD_VIEW_SIZE.width) /2, 0, NAD_VIEW_SIZE.width, NAD_VIEW_SIZE.height)];
    // ２．画面下部に広告を表示させる場合
    [self.nadView setFrame:CGRectMake((self.view.frame.size.width - NAD_VIEW_SIZE.width) /2, self.view.frame.size.height - NAD_VIEW_SIZE.height, NAD_VIEW_SIZE.width, NAD_VIEW_SIZE.height)];
    
    
    NSLog(@"データの引き継ぎ %f %d %d",_myHeight , _bodyTypeDataTag, _locationDataTag);

}

// この画面が隠れたら、広告のリフレッシュを中断します
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"ViewController viewWillDisappear");
    
    // 中断
    [self.nadView pause];
    
    // 注意：safariなど他アプリが起動し自分自身が背後に回った際に広告のリフレッシュを中止するには
    // AppDelegate applicationDidEnterBackground などを利用してください
}

// ------------------------------------------------------------------------------------------------
// 受信状況の通知
// ------------------------------------------------------------------------------------------------

#pragma mark - NADViewDelegate
// 広告の受信に成功し表示できた場合に１度通知されます。必須メソッドです。
-(void)nadViewDidFinishLoad:(NADView *)adView {
    
    // 広告の受信と表示の成功が通知されてからViewを乗せる場合はnadViewDidFinishLoadを利用します。
    [self.view addSubview:self.nadView];
    
    NSLog(@"NADViewDelegate nadViewDidFinishLoad");
}


// 以下は広告受信成功ごとに通知される任意メソッドです。
-(void)nadViewDidReceiveAd:(NADView *)adView {
    // Success.
    NSLog(@"NADViewDelegate nadViewDidReceiveAd");
}

// 以下は広告受信失敗ごとに通知される任意メソッドです。
-(void)nadViewDidFailToReceiveAd:(NADView *)adView{
    // Error.
    NSLog(@"NADViewDelegate nadViewDidFailToReceiveAd");
    
    // エラー発生時の情報をログに出力します
    NSError* nadError = adView.error;
    // エラーコード
    NSLog(@"code = %d", nadError.code);
    // エラーメッセージ
    NSLog(@"message = %@", nadError.domain);
}

// 以下はバナー広告がクリックされるごとに通知される任意メソッドです。
-(void)nadViewDidClickAd:(NADView *)adView {
    // Banner clicked.
    NSLog(@"NADViewDelegate nadViewDidClickAd");
}

// ------------------------------------------------------------------------------------------------
// リリース
// ------------------------------------------------------------------------------------------------
#pragma mark - life cycle
-(void)dealloc {
    // delegateには必ずnilセットして解放する
    [self.nadView setDelegate:nil];
    self.nadView = nil;
    
    NSLog(@"ViewController ...dealloc");
}

@end
