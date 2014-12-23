//
//  pGetViewController.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/26.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NADView.h"

typedef enum stature : NSUInteger {
    VERYTALL = 170,
    TALL = 160,
    MEDIUM = 150,
    SHOAT = 140
} stature;

@interface pGetViewController : UIViewController <NADViewDelegate>

@property(nonatomic,retain) NADView* nadView;

@property (weak, nonatomic) IBOutlet UILabel *sMStemp170;
@property (weak, nonatomic) IBOutlet UILabel *sMSteps160;
@property (weak, nonatomic) IBOutlet UILabel *sMSteps150;


@property (weak, nonatomic) IBOutlet UILabel *steps170;
@property (weak, nonatomic) IBOutlet UILabel *steps160;
@property (weak, nonatomic) IBOutlet UILabel *steps150;

@property (weak, nonatomic) IBOutlet UILabel *mSteps170;
@property (weak, nonatomic) IBOutlet UILabel *mSteps160;
@property (weak, nonatomic) IBOutlet UILabel *mSteps150;


@property (assign, nonatomic) float myHeight;

@property (assign, nonatomic) int locationDataTag;
@property (assign, nonatomic) int bodyTypeDataTag;

@property (assign, nonatomic) int stairs;


- (IBAction)backToRootViewController:(id)sender;
- (IBAction)backToParentViewController:(id)sender;
@end
