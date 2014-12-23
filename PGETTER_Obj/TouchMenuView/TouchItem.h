//
//  TouchItem.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/04.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchItem;

@protocol TouchItemDelegate <NSObject>

- (void)itemTouchesBegan:(TouchItem *)item;
- (void)itemTouchesEnd:(TouchItem *)item;

@end

@interface TouchItem : UIView

typedef enum {
	TouchImageItem,
	TouchLabelItem,
	TouchImageAndLabeItem
} TouchItemType;

@property (nonatomic, weak) id <TouchItemDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *labelItem;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

@property (assign, nonatomic) BOOL highlighted;

/*
 Initialization of the item inside of the scrollview
 
 @param	backgroundImage	The background image
 @param	iconImage	Icon of the item. Could be nil if you dont want an icon
 @param	labelItem	Text of the item. Could be nil if you only want the icon
 
 @return	Item
 */
- (id)initTouchItem:(UIImage *)backgroundImage iconImage:(UIImage *)iconImage andLabel:(NSString *)labelItem;

/*
 Implement this method if you want a custom highlighted state for you item
 */

- (void)setHighlightedBackground:(UIImage *)backgroundImageHightlighted iconHighlighted:(UIImage *)iconImageHighlighted textColorHighlighted:(UIColor *)texColorHighlighted;

@end
