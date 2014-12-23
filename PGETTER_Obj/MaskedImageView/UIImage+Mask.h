//
//  UIImage+Mask.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/02.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Mask)

- (UIImage *)imageMaskWithColor:(UIColor *)maskColor shadowOffset:(CGPoint)shadow;
@end
