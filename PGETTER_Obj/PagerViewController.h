//
//  PagerViewController.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/18.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StatureViewController.h"
#import "StateViewController.h"
#import "BodyTypeViewController.h"

#import "NADView.h"

@interface PagerViewController : UIViewController<UIScrollViewDelegate, NADViewDelegate, BodyTypeViewControllerDelegate>{
    float _viewWidth, _viewHeight;
}

@property (nonatomic, strong) UIScrollView *pagerScrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) StatureViewController *statureViewCon;
@property (nonatomic, strong) StateViewController *stateViewCon;
@property (nonatomic, strong) BodyTypeViewController *bodyTypeViewCon;


@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel1;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel2;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel3;



@property (nonatomic, weak) UIButton *getPBtn;
@property (nonatomic, weak) UIButton *rArrowButton;
@property (nonatomic, weak) UIButton *lArrowButton;

@property(nonatomic,retain) NADView* nadView;

- (IBAction)changePage:(id)sender;

- (void)previousPage;
- (void)nextPage;

- (IBAction)backToParentViewController:(id)sender;
@end
