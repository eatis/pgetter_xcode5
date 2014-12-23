//
//  StartViewController.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/08/25.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NADView.h"

@interface StartViewController : UIViewController <NADViewDelegate>

@property(nonatomic,retain) NADView* nadView;

@end
