//
//  StateViewController.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/02.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchMenu.h"

@interface StateViewController : UIViewController <TouchMenuDelegate> {
    float _viewWidth,_viewHeight;
}

@property (nonatomic, assign) int selectedMenuIndex;

@end
