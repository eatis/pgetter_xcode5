//
//  BodyTypeViewController.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/02.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Mask.h"

@class BodyTypeViewController;

@protocol BodyTypeViewControllerDelegate <NSObject>
//Delegate Method

- (void)pushToNextView:(id)sender;

@end

@interface BodyTypeViewController : UIViewController {
    float _viewWidth, _viewHeight;

}

@property (nonatomic, weak) id <BodyTypeViewControllerDelegate> delegate;
@property (nonatomic, strong) UILabel *statureLabel;

@end
