//
//  InfoViewController.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/26.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

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
    
    
    
    //[self setBackgroundPatternImage];

    
    //パターン画像を格納
    //UIImage *image = [UIImage imageNamed:@"background_pattern.jpg"];
    UIImage *image = [UIImage imageNamed:@"sos.png"];
    //パターン画像を背景に適用
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    

    _explainTextView.text = @"\n1.自分の身長を選択\n\n↓\n\n2.自分のいる場所を選択\n\n↓\n\n3.女の子の体型を選択\n\n↓\n\n4.GET Pボタンを押す\n\n↓\n\n5. ...階段の段数が現れるよ\n\n↓\n\n6.妄想して楽しんでください♡";
    
    //)NSLog(@"testLabel=%@", self.testLabel);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backToParentViewController:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*
- (void)setBackgroundPatternImage
{
    //ラベル初期化
    UILabel *label = [[UILabel alloc] init];
    
    //ラベルのサイズを画面に合わせる
    label.frame = self.view.bounds;
    
    //マスク適用
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //パターン画像を格納
    UIImage *image = [UIImage imageNamed:@"background_pattern.jpg"];
    
    //パターン画像を背景に適用
    label.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //ラベルを画面に表示｀
    [self.view addSubview:label];
}
*/

@end
