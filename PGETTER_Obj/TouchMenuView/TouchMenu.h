//
//  TouchMenu.h
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/04.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchItem.h"

@class TouchMenu;

@protocol TouchMenuDelegate <NSObject>

/*
 Delegate method, executed when the user press any item
 
 @param	menu	TouchMenu component
 @param	selectedIndex	index of the item selected by the user
 */
- (void)touchMenu:(TouchMenu *)menu didSelectIndex:(NSInteger)selectedIndex;

@end

@interface TouchMenu : UIView <TouchItemDelegate>

//Type of animations
typedef enum {
	TouchedFadeZoomIn,
	TouchedFadeZoomOut,
	TouchedShake,
	TouchedClassicAnimation,
	TouchedZoomOut
} TouchedAnimation;


@property (nonatomic, weak) id <TouchMenuDelegate> delegate;

@property (nonatomic, strong) NSArray *menuArray;
@property (nonatomic, assign) TouchedAnimation animationType;

/*
 Set up the menu programatically, if you are using storyboard, you dont need to use it.
 
 @param	frame	frame of the container
 @param	bgColor	background color of the container
 @param	menuItems	Array with the ACPItems
 
 @return	The container with the items in order
 */
- (id)initTouchMenuViewWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)bgColor menuItems:(NSArray *)menuItems;


/*
 The same as the method before, but we should have defined the component in the storyboard or xib file.
 
 @param	frame	frame of the container
 @param	bgColor	background color of the container
 @param	menuItems	Array with the ACPItems
 
 @return	The container with the items in order
 */
- (void)setUpTouchMenuItems:(NSArray *)menuItems;

/*
 If you want an item selected by default
 
 @param	itemNumber	This number represent the item in itemsArray
 */
- (void)setThisItemHighlighted:(NSInteger)itemNumber;

/*
 Change the background color of this view.
 
 @param	color	your favorite color.
 */
- (void)setTouchMenuViewBackgroundColor:(UIColor *)color;

@end
