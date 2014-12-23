//
//  UIImage+Mask.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/02.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "UIImage+Mask.h"

@implementation UIImage (Mask)

- (UIImage *)imageMaskWithColor:(UIColor *)maskColor shadowOffset:(CGPoint)shadow
{
    CGFloat shadowOpacity = 0.54f;
    BOOL hasShadow = !(shadow.x == 0.0f && shadow.y == 0.0f);
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    CGRect shadowRect = CGRectMake(shadow.x, shadow.y, self.size.width, self.size.height);
    
    CGRect newRect = hasShadow ? CGRectUnion(imageRect, shadowRect) : imageRect;
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    CGContextTranslateCTM(ctx, 0.0f, -(newRect.size.height));
    CGContextSaveGState(ctx);
    
    if(hasShadow) {
        CGContextClipToMask(ctx, shadowRect, self.CGImage);
        CGContextSetFillColorWithColor(ctx, [UIColor colorWithWhite:0 alpha:shadowOpacity].CGColor);
        CGContextFillRect(ctx, shadowRect);
    }
    
    CGContextRestoreGState(ctx);
    CGContextClipToMask(ctx, imageRect, self.CGImage);
    CGContextSetFillColorWithColor(ctx, maskColor.CGColor);
    CGContextFillRect(ctx, imageRect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
