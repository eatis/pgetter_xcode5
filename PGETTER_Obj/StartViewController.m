//
//  StartViewController.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/25.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "StartViewController.h"
#import <QuartzCore/QuartzCore.h>

//#define NAD_VIEW_SIZE CGSizeMake(320, 50)

@interface StartViewController ()

@end

@implementation StartViewController

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
    //        UIScrollViewの設定  start
    //==============================================
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480){
            // iPhone Classic
            //self.pagerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 105, 320, 443)];
            NSLog(@"StartView %f",[UIScreen mainScreen].bounds.size.height);
        }
        if(result.height == 568){
            // iPhone 5
            //self.pagerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 105, 320, 531)];
            NSLog(@"StartView %f",[UIScreen mainScreen].bounds.size.height);
        }
    }
    //==============================================
    //        UIScrollViewの設定  end
    //==============================================
    
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
    //[self.nadView setBackgroundColor:[UIColor cyanColor]];
    [self.nadView setBackgroundColor:[UIColor colorWithRed:1.000 green:0.600 blue:0.600 alpha:1.0]];
    
    // 読み込み開始(必須)
    [self.nadView load];
    //==============================================
    //        NADViewの設定　end
    //==============================================
    
    
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
