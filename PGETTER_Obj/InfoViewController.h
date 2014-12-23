//
//  InfoViewController.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/26.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Mask.h"
#import "NADView.h"

@interface InfoViewController : UIViewController


@property (nonatomic, retain) UILabel *testLabel;


@property (weak, nonatomic) IBOutlet UITextView *explainTextView;


- (IBAction)backToParentViewController:(id)sender;
@end
