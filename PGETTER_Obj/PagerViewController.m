//
//  PagerViewController.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/18.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "PagerViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "pGetViewController.h"

//#define NAD_VIEW_SIZE CGSizeMake(320, 50)

@interface PagerViewController ()
@property (assign) BOOL pageControlUsed;
@property (assign) NSUInteger page;
@property (assign) BOOL rotating;
- (void)loadScrollViewWithPage:(int)page;
@end

@implementation PagerViewController

@synthesize pagerScrollView;
@synthesize pageControl;
@synthesize pageControlUsed = _pageControlUsed;
@synthesize page = _page;
@synthesize rotating = _rotating;

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
    /*
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480){
            // iPhone Classic
            self.pagerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 105, 320, 443)];
            _viewHeight = 355;
        }
        if(result.height == 568){
            // iPhone 5
            self.pagerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 105, 320, 531)];
            _viewHeight = 443;
        }
    }
     */
    
    _viewWidth  = self.view.frame.size.width;
    _viewHeight = self.view.frame.size.height - 50;
    
    
    self.pagerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 125, 320, [app pagerViewHeight])];
    
    // スクロールしたときバウンドさせないようにする
    //scrollView.bounces = NO;
    [self.pagerScrollView setBounces:NO];
    
    [self.pagerScrollView setPagingEnabled:YES];
	[self.pagerScrollView setScrollEnabled:YES];
	[self.pagerScrollView setShowsHorizontalScrollIndicator:NO];
	[self.pagerScrollView setShowsVerticalScrollIndicator:NO];
	[self.pagerScrollView setDelegate:self];
    [self.pagerScrollView setContentSize:CGSizeMake(320.0, 443.0)];
    [self.view addSubview:pagerScrollView];
    //self.view = self.pagerScrollView;
    
    //==============================================
    //        UIScrollViewの設定　end
    //==============================================
    
    
    //==============================================
    //        ChildViewControllerの設定  start
    //==============================================
    //UIViewController *_statureViewCon = [UIViewController new];
    _statureViewCon = [StatureViewController new];
    //_stateViewCon.view.frame = CGRectMake(0, 0, 320, _viewHeight);
    [self addChildViewController:_statureViewCon];

    
    //UIViewController *_stateViewCon = [UIViewController new];
    _stateViewCon = [StateViewController new];
    //_stateViewCon.view.frame = CGRectMake(0, 0, 320, _viewHeight);
    [self addChildViewController:_stateViewCon];

    
    //UIViewController *_bodyTypeViewCon = [UIViewController new];
    _bodyTypeViewCon = [BodyTypeViewController new];
    //_bodyTypeViewCon.view.frame = CGRectMake(0, 0, 320, _viewHeight);
    // buttonの作成
    _getPBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _getPBtn.frame = CGRectMake(0, 0, self.view.bounds.size.width * 3/8, 35);
    [_getPBtn setCenter:CGPointMake(self.view.frame.size.width * 2/3, _bodyTypeViewCon.view.frame.size.height - 28 - 50)];
    [_getPBtn setTitle:@"GET P ＞" forState:UIControlStateNormal];
    [_getPBtn setTitle:@"GET P ＞" forState:UIControlStateHighlighted];
    //[_getPBtn setTitle:@"押せません" forState:UIControlStateDisabled];
    [_getPBtn setBackgroundColor:[UIColor colorWithRed:0.804 green:0.200 blue:0.200 alpha:1.0f]];
    [_getPBtn setTitleShadowColor:[UIColor colorWithRed:0.498 green:0.498 blue:0.498 alpha:1.0f] forState:UIControlStateNormal];
    _getPBtn.titleLabel.shadowOffset = CGSizeMake(2.0, 2.0);
    [_getPBtn setTitleColor:[UIColor colorWithRed:0.973f green:0.973f blue:1.0f alpha:1.0] forState:UIControlStateNormal];
    [_getPBtn setTitleColor:[UIColor colorWithRed:0.812f green:0.812f blue:0.812f alpha:1.0] forState:UIControlStateHighlighted];
    
    //フォントを設定する
    //[btn.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    _getPBtn.titleLabel.font = [ UIFont fontWithName:@"Helvetica-Bold" size:25 ];
    // ボタンが押された時にhogeメソッドを呼び出す
    [_getPBtn addTarget:self
                 action:@selector(pushToNextView:) forControlEvents:UIControlEventTouchUpInside];
    [_bodyTypeViewCon.view addSubview:_getPBtn];
    //BodyTypeVC Delegate
    _bodyTypeViewCon.delegate = self;
    _getPBtn.alpha = 0.0;
    [self addChildViewController:_bodyTypeViewCon];

    /*
    UIViewController *_viewControllerOne = [self.storyboard instantiateViewControllerWithIdentifier:@"Document1ViewController"];
    NSLog(@"D1 %f",_viewControllerOne.view.frame.size.height);
    _viewControllerOne.view.layer.shadowOpacity = 0.8;
    _viewControllerOne.view.layer.shadowOffset = CGSizeMake(2, 2);
    UIViewController *_viewControllerTwo = [self.storyboard instantiateViewControllerWithIdentifier:@"Document2ViewController"];
    _viewControllerTwo.view.layer.shadowOpacity = 0.8;
    _viewControllerTwo.view.layer.shadowOffset = CGSizeMake(2, 2);
    UIViewController *_viewControllerTree = [self.storyboard instantiateViewControllerWithIdentifier:@"Document3ViewController"];
    _viewControllerTree.view.layer.shadowOpacity = 0.8;
    _viewControllerTree.view.layer.shadowOffset = CGSizeMake(2, 2);
    
    [self addChildViewController:_viewControllerOne];
	[self addChildViewController:_viewControllerTwo];
	[self addChildViewController:_viewControllerTree];
    */
    
    
    //NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    //==============================================
    //        ChildViewControllerの設定  end
    //==============================================
    
    
    [_descriptionLabel1 setText:@"あなたの身長はどのくらい...?"];
    [_descriptionLabel2 setText:@"階段の傾きはどのくらい...?"];
    [_descriptionLabel3 setText:@"女の子はどんな体型...?"];
    
    [self setUpArrowBtn];
    
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
    return UIStatusBarStyleLightContent;
}




- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers {
	return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
	[viewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	_rotating = YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
	UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
	[viewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
	
	self.pagerScrollView.contentSize = CGSizeMake(pagerScrollView.frame.size.width * [self.childViewControllers count], pagerScrollView.frame.size.height);
	NSUInteger page = 0;
	for (viewController in self.childViewControllers) {
		CGRect frame = self.pagerScrollView.frame;
		frame.origin.x = frame.size.width * page;
		frame.origin.y = 0;
		viewController.view.frame = frame;
		page++;
	}
	
	CGRect frame = self.pagerScrollView.frame;
    frame.origin.x = frame.size.width * _page;
    frame.origin.y = 0;
	[self.pagerScrollView scrollRectToVisible:frame animated:NO];
	
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	_rotating = NO;
	UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
	[viewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    
    //ステータスバーの色を指定
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

	
	for (NSUInteger i =0; i < [self.childViewControllers count]; i++) {
		[self loadScrollViewWithPage:i];
        NSLog(@"viewNumber %d",i);
        
        self.pagerScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 100);
	}
	
	self.pageControl.currentPage = 0;
	_page = 0;
	[self.pageControl setNumberOfPages:[self.childViewControllers count]];
    
	UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
	if (viewController.view.superview != nil) {
		[viewController viewWillAppear:animated];
	}
	
	self.pagerScrollView.contentSize = CGSizeMake(pagerScrollView.frame.size.width * [self.childViewControllers count], pagerScrollView.frame.size.height);
    //NSLog(@"%f %f",pagerScrollView.frame.size.width, pagerScrollView.frame.size.height);
    
    if (_page == 0) {
        [_lArrowButton setAlpha:0];
        [_rArrowButton setAlpha:1];
        [_descriptionLabel2 setAlpha:0];
        [_descriptionLabel3 setAlpha:0];
    }
    
    //=================================================================
    //                   NADView
    //=================================================================
    // この画面が表示される際に広告のリフレッシュを再開します
    
    // 再開
    [self.nadView resume];
    
    // 注意：他アプリ起動から、自アプリが復帰した際に広告のリフレッシュを再開するには
    // AppDelegate applicationDidEnterBackground などを利用してください
    
    // 広告位置設定例
    // １．画面上部に広告を表示させる場合
    //[self.nadView setFrame:CGRectMake((self.view.frame.size.width - NAD_VIEW_SIZE.width) /2, 0, NAD_VIEW_SIZE.width, NAD_VIEW_SIZE.height)];
    // ２．画面下部に広告を表示させる場合
    [self.nadView setFrame:CGRectMake((self.view.frame.size.width - NAD_VIEW_SIZE.width) /2, self.view.frame.size.height - NAD_VIEW_SIZE.height, NAD_VIEW_SIZE.width, NAD_VIEW_SIZE.height)];
    //=================================================================
    //                   NADView
    //=================================================================
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	if ([self.childViewControllers count]) {
		UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
		if (viewController.view.superview != nil) {
			[viewController viewDidAppear:animated];
		}
	}
}

- (void)viewWillDisappear:(BOOL)animated {
	if ([self.childViewControllers count]) {
		UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
		if (viewController.view.superview != nil) {
			[viewController viewWillDisappear:animated];
		}
	}
	[super viewWillDisappear:animated];
    
    
    //=================================================================
    //                   NADView
    //=================================================================
    // この画面が隠れたら、広告のリフレッシュを中断します
    NSLog(@"ViewController viewWillDisappear");
    
    // 中断
    [self.nadView pause];
    
    // 注意：safariなど他アプリが起動し自分自身が背後に回った際に広告のリフレッシュを中止するには
    // AppDelegate applicationDidEnterBackground などを利用してください
    //=================================================================
    //                   NADView
    //=================================================================
}

- (void)viewDidDisappear:(BOOL)animated {
	UIViewController *viewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
	if (viewController.view.superview != nil) {
		[viewController viewDidDisappear:animated];
	}
	[super viewDidDisappear:animated];
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0)
        return;
    if (page >= [self.childViewControllers count])
        return;
    
	// replace the placeholder if necessary
    UIViewController *controller = [self.childViewControllers objectAtIndex:page];
    if (controller == nil) {
		return;
    }
	
	// add the controller's view to the scroll view
    if (controller.view.superview == nil) {
        CGRect frame = self.pagerScrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.pagerScrollView addSubview:controller.view];
    }
}

- (void)previousPage {
    //NSLog(@"previousPage %d %d",self.pageControl.currentPage, _page);
	if ((_page  > 0) && (self.pageControl.currentPage == _page)) {
		// update the scroll view to the appropriate page
		CGRect frame = self.pagerScrollView.frame;
		frame.origin.x = frame.size.width * (_page - 1);
		frame.origin.y = 0;
		
		UIViewController *oldViewController = [self.childViewControllers objectAtIndex:_page];
		UIViewController *newViewController = [self.childViewControllers objectAtIndex:_page - 1];
		[oldViewController viewWillDisappear:YES];
		[newViewController viewWillAppear:YES];
		
		[self.pagerScrollView scrollRectToVisible:frame animated:YES];
		
		self.pageControl.currentPage = _page - 1;
		// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
		_pageControlUsed = YES;
        
        //NSLog(@"if previousPage %d",self.pageControl.currentPage);
        
        if (_page == 1) {
            [UIView animateWithDuration:0.3 // 4秒かけてアニメーション
                             animations:^
             {
                 _lArrowButton.alpha = 0.0; // 透明にする
             }];
            
            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 _descriptionLabel2.alpha = 0.0;
             }];
            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 _descriptionLabel1.alpha = 1.0;
             }];
        }
        
        if (_page == 2) {
            [UIView animateWithDuration:0.3 // 4秒かけてアニメーション
                             animations:^
             {
                 _rArrowButton.alpha = 1.0; // 透明にする
                 _getPBtn.alpha = 0.0;
             }];

            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 _descriptionLabel3.alpha = 0.0;
             }];
            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 _descriptionLabel2.alpha = 1.0;
             }];
        }
	}
    
    
}

- (void)nextPage {
    //NSLog(@"nextPage %d %d",self.pageControl.currentPage, _page);
	if ((_page + 1 < self.pageControl.numberOfPages) && (self.pageControl.currentPage == _page)) {
		// update the scroll view to the appropriate page
		CGRect frame = self.pagerScrollView.frame;
		frame.origin.x = frame.size.width * (_page + 1);
		frame.origin.y = 0;
		
		UIViewController *oldViewController = [self.childViewControllers objectAtIndex:_page];
		UIViewController *newViewController = [self.childViewControllers objectAtIndex:_page + 1];
		[oldViewController viewWillDisappear:YES];
		[newViewController viewWillAppear:YES];
		
		[self.pagerScrollView scrollRectToVisible:frame animated:YES];
		
		self.pageControl.currentPage = _page + 1;
		// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
		_pageControlUsed = YES;
        
        //NSLog(@"if nextPage %d",self.pageControl.currentPage);
        
        if (_page == 1) {
            [UIView animateWithDuration:0.3 // 4秒かけてアニメーション
                             animations:^
             {
                 _rArrowButton.alpha = 0.0; // 透明にする
             }];
            [UIView animateWithDuration:1.0 // 4秒かけてアニメーション
                             animations:^
             {
                 _getPBtn.alpha = 1.0;
             }];
            
            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 _descriptionLabel2.alpha = 0.0;
             }];
            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 _descriptionLabel3.alpha = 1.0;
             }];
        }
        
        if (_page == 0) {
            [UIView animateWithDuration:0.3 // 4秒かけてアニメーション
                             animations:^
             {
                 _lArrowButton.alpha = 1.0; // 透明にする
             }];
            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 _descriptionLabel1.alpha = 0.0;
                 //_descriptionLabel2.alpha = 1.0;
             }];
            [UIView animateWithDuration:0.9 // 4秒かけてアニメーション
                             animations:^
             {
                 //_descriptionLabel1.alpha = 0.0;
                 _descriptionLabel2.alpha = 1.0;
             }];
        }
	}
    
}

#pragma mark self ViewController methods
- (IBAction)backToParentViewController:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)changePage:(id)sender {
    int page = ((UIPageControl *)sender).currentPage;
	
	// update the scroll view to the appropriate page
    CGRect frame = self.pagerScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    
	UIViewController *oldViewController = [self.childViewControllers objectAtIndex:_page];
	UIViewController *newViewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
	[oldViewController viewWillDisappear:YES];
	[newViewController viewWillAppear:YES];
	
	[self.pagerScrollView scrollRectToVisible:frame animated:YES];
	
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    _pageControlUsed = YES;
    NSLog(@"chenge page");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	UIViewController *oldViewController = [self.childViewControllers objectAtIndex:_page];
	UIViewController *newViewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
	[oldViewController viewDidDisappear:YES];
	[newViewController viewDidAppear:YES];
	
	_page = self.pageControl.currentPage;
}

- (void)goToNextViewController:(id)sender; {
    pGetViewController *_pGetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pGetViewController"];

    [self.navigationController pushViewController:_pGetViewController animated:YES];
}


// Animate the fade-in/out (Cross-disolve) with the scrollView translation.
- (void)disolveBackgroundWithContentOffset:(float)offset{
    /*
    if (_currentState == ScrollingStateLooping){
        // Jump from the last page to the first.
        [self scrollingToFirstPageWithOffset:offset];
    } else {
        // Or just scroll to the next/previous page.
        [self scrollingToNextPageWithOffset:offset];
    }
     */
    [self scrollingToNextPageWithOffset:offset];
}

// Handle alpha on layers when we are scrolling to the next/previous page.
- (void)scrollingToNextPageWithOffset:(float)offset{
    
    if (offset < 1.0) {
        // Invert alpha for the front picture.
        float frontLayerAlpha = 1 - offset;
        float backLayerAlpha = offset;
        // Set alpha.
        [_lArrowButton setAlpha:backLayerAlpha];
        
        [_descriptionLabel2 setAlpha:backLayerAlpha];
        [_descriptionLabel1 setAlpha:frontLayerAlpha];
    }
    
    if (offset > 1.0) {
        // Invert alpha for the front picture.
        float frontLayerAlpha = (2 - offset);
        float backLayerAlpha = offset - 1;
        // Set alpha.
        [_rArrowButton setAlpha:frontLayerAlpha];
        [_getPBtn setAlpha:backLayerAlpha];
        
        [_descriptionLabel2 setAlpha:frontLayerAlpha];
        [_descriptionLabel3 setAlpha:backLayerAlpha];
    }
}

#pragma mark -
#pragma mark UIScrollViewDelegate methods

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (_pageControlUsed || _rotating) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.pagerScrollView.frame.size.width;
    int page = floor((self.pagerScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	if (self.pageControl.currentPage != page) {
		UIViewController *oldViewController = [self.childViewControllers objectAtIndex:self.pageControl.currentPage];
		UIViewController *newViewController = [self.childViewControllers objectAtIndex:page];
		[oldViewController viewWillDisappear:YES];
		[newViewController viewWillAppear:YES];
		self.pageControl.currentPage = page;
		[oldViewController viewDidDisappear:YES];
		[newViewController viewDidAppear:YES];
		_page = page;
	}
    
    // Get scrolling position, and send the alpha values.
    float scrollingPosition = sender.contentOffset.x / self.view.frame.size.width;
    [self disolveBackgroundWithContentOffset:scrollingPosition];
    
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControlUsed = NO;
    NSLog(@"view chenge");
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
    //NSError* nadError = adView.error;
    // エラーコード
    //NSLog(@"code = %d", nadError.code);
    // エラーメッセージ
    //NSLog(@"message = %@", nadError.domain);
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

#pragma mark - BodyTypeVC Delegate

- (void)pushToNextView:(id)sender {
    pGetViewController *_pGetViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pGetViewController"];
    
    _pGetViewController.myHeight = [[[self.childViewControllers objectAtIndex:0] statureLabel].text substringToIndex:3].floatValue;
    _pGetViewController.locationDataTag = [[self.childViewControllers objectAtIndex:1] selectedMenuIndex];
    _pGetViewController.bodyTypeDataTag = [[self.childViewControllers objectAtIndex:2] statureLabel].tag;
    [self.navigationController pushViewController:_pGetViewController animated:YES];
}

# pragma mark -
# pragma mark set Arrow methods
# pragma mark -
- (void)setUpArrowBtn {
    //==============================================
    //        UIButtonの設定  start
    //==============================================
    // buttonの作成
    
    UIImage *_rightArrowImgN = [UIImage imageNamed:@"arrow-right.png"];
    //UIImage *_rightArrowImgH = [UIImage imageNamed:@"cog_01.png"];
    _rArrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rArrowButton.frame = CGRectMake(0, 0, _rightArrowImgN.size.width + 20, _rightArrowImgN.size.height + 20);
    [_rArrowButton setCenter:CGPointMake(_viewWidth * 4/5 - _rightArrowImgN.size.width/2 - 5, _viewHeight - _rightArrowImgN.size.height/2 - 5)];
    [_rArrowButton setImage:_rightArrowImgN forState:UIControlStateNormal];
    //[_rArrowButton setImage:_rightArrowImgH forState:UIControlStateHighlighted];
    [_rArrowButton addTarget:self
                      action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rArrowButton];
    
    
    UIImage *_leftArrowImgN = [UIImage imageNamed:@"arrow-left.png"];
    //UIImage *_leftArrowImgH = [UIImage imageNamed:@"cog_01.png"];
    _lArrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _lArrowButton.frame = CGRectMake(0, 0, _leftArrowImgN.size.width + 20, _leftArrowImgN.size.height + 20);
    [_lArrowButton setCenter:CGPointMake(_viewWidth * 1/5 + _leftArrowImgN.size.width/2 + 5, _viewHeight - _leftArrowImgN.size.height/2 - 5)];
    [_lArrowButton setImage:_leftArrowImgN forState:UIControlStateNormal];
    //[_lArrowButton setImage:_leftArrowImgH forState:UIControlStateHighlighted];
    [_lArrowButton addTarget:self
                      action:@selector(previousPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_lArrowButton];
    
    //==============================================
    //        UIButtonの設定  end
    //==============================================
}

@end
