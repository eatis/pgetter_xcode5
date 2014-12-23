//
//  TouchMenu.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/04.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "TouchMenu.h"
#import <QuartzCore/QuartzCore.h>

static CGFloat const kScrollViewFirstWidth = 12.0f;
static CGFloat const kScrollViewItemMarginWidth = 6.0f;

@implementation TouchMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

# pragma mark -
# pragma mark Initialization
# pragma mark -


- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		// Do something
	}
	return self;
}

- (id)initTouchMenuViewWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)bgColor menuItems:(NSArray *)menuItems {
	self = [super initWithFrame:frame];
	if (!self) {
		return nil;
	}
    
	if (menuItems.count == 0) {
		return nil;
	}
    
	[self setUpTouchMenuItems:menuItems];
	[self setTouchMenuViewBackgroundColor:bgColor];
    
	return self;
}

- (void)setUpTouchMenuItems:(NSArray *)menuItems
{
	if (menuItems.count == 0) {
		return;
	}

	//int menuItemsArrayCount = menuItems.count;
    self.menuArray = menuItems;
    
    //簡易的にmethodを書く
    float _frameHeight = 75+25;
    
    if ([app pagerViewHeight] == 443) {
        _frameHeight += 88;
    }
    
    int i = 0;
	for (TouchItem *menuItem in _menuArray) {
        menuItem.exclusiveTouch = YES;
        
		menuItem.tag = 1000 + i;
        if (i < 2) {
            menuItem.center = CGPointMake(menuItem.frame.size.width / 2 + kScrollViewFirstWidth + kScrollViewItemMarginWidth * i + menuItem.frame.size.width * i, _frameHeight / 2);
            menuItem.delegate = self;
            [self addSubview:menuItem];
            //NSLog(@"test1 %f %f", menuItem.center.x, menuItem.center.y);
        } else if (i >= 2 && i <4) {
            menuItem.center = CGPointMake(menuItem.frame.size.width / 2 + kScrollViewFirstWidth + kScrollViewItemMarginWidth * (i-2) + menuItem.frame.size.width * (i-2), _frameHeight / 2 + kScrollViewItemMarginWidth + menuItem.frame.size.height);
            menuItem.delegate = self;
            [self addSubview:menuItem];
            //NSLog(@"test2 %f %f", menuItem.center.x, menuItem.center.y);
        } else {
            menuItem.center = CGPointMake(menuItem.frame.size.width / 2 + kScrollViewFirstWidth + kScrollViewItemMarginWidth * (i-4) + menuItem.frame.size.width * (i-4), _frameHeight / 2 + kScrollViewItemMarginWidth * 2 + menuItem.frame.size.height * 2);
            menuItem.delegate = self;
            [self addSubview:menuItem];
            //NSLog(@"test3 %f %f", menuItem.center.x, menuItem.center.y);
        }
        
		i++;
	}
    
	//[self setMenu];
    
    //[self itemTouchesEnd:[_menuArray objectAtIndex:2]];
    [self setThisItemHighlighted:2];
    
	_animationType = TouchedZoomOut;
}


# pragma mark -
# pragma mark Delegate Methods
# pragma mark -

- (void)itemTouchesBegan:(TouchItem *)item {
	//item.highlighted = YES;
}

- (void)itemTouchesEnd:(TouchItem *)item {
	// blowUp animation
    
	[self startAnimation:item];
    
	if ([_delegate respondsToSelector:@selector(touchMenu:didSelectIndex:)]) {
		[_delegate touchMenu:(id)self didSelectIndex:item.tag - 1000];
	}
}

# pragma mark -
# pragma mark Animation & behaviour
# pragma mark -

- (void)startAnimation:(TouchItem *)item {
	[self removeHighlighted];
	item.highlighted = YES;
	switch (_animationType) {
		case TouchedFadeZoomIn: {
			[UIView animateWithDuration:0.25f animations: ^{
			    CGAffineTransform scaleUpAnimation = CGAffineTransformMakeScale(1.9f, 1.9f);
			    item.transform = scaleUpAnimation;
			    item.alpha = 0.2;
			} completion: ^(BOOL finished) {
			    [UIView animateWithDuration:0.25f animations: ^{
			        item.transform = CGAffineTransformIdentity;
			        item.alpha = 1.0f;
				} completion: ^(BOOL finished) {
			        item.highlighted = YES;
				}];
			}];
			break;
		}
            
		case TouchedFadeZoomOut: {
			[UIView animateWithDuration:0.1f animations: ^{
			    CGAffineTransform scaleDownAnimation = CGAffineTransformMakeScale(0.9f, 0.9f);
			    item.transform = scaleDownAnimation;
			    item.alpha = 0.2;
			} completion: ^(BOOL finished) {
			    [UIView animateWithDuration:0.1f animations: ^{
			        item.transform = CGAffineTransformIdentity;
			        item.alpha = 1.0f;
				} completion: ^(BOOL finished) {
			        item.highlighted = YES;
				}];
			}];
			break;
		}
            
		case TouchedZoomOut: {
			[UIView animateWithDuration:0.1f animations: ^{
			    CGAffineTransform scaleDownAnimation = CGAffineTransformMakeScale(0.9f, 0.9f);
			    item.transform = scaleDownAnimation;
			} completion: ^(BOOL finished) {
			    [UIView animateWithDuration:0.1f animations: ^{
			        item.transform = CGAffineTransformIdentity;
				} completion: ^(BOOL finished) {
			        item.highlighted = YES;
                    //[self setThisItemHighlighted:item.tag-1000];
				}];
			}];
			break;
		}
            
		default: {
			[UIView animateWithDuration:0.25f animations: ^{
			    CGAffineTransform scaleUpAnimation = CGAffineTransformMakeScale(1.9f, 1.9f);
			    item.transform = scaleUpAnimation;
			    item.alpha = 0.2;
			} completion: ^(BOOL finished) {
			    [UIView animateWithDuration:0.25f animations: ^{
			        item.transform = CGAffineTransformIdentity;
			        item.alpha = 1.0f;
				} completion: ^(BOOL finished) {
			        item.highlighted = YES;
				}];
			}];
			break;
		}
	}
}

- (void)removeHighlighted  {
    NSLog(@"removeHighlighted");
    
	for (TouchItem *menuItem in self.menuArray) {
		menuItem.highlighted = NO;
	}
}

- (void)setThisItemHighlighted:(NSInteger)itemNumber {
    NSLog(@"setThisItemHighlighted");
    
	[self removeHighlighted];
	[[self.menuArray objectAtIndex:itemNumber] setHighlighted:YES];
}

# pragma mark -
# pragma mark Extra configuration
# pragma mark -


- (void)setTouchMenuViewBackgroundColor:(UIColor *)color {
	self.backgroundColor = color;
}

@end
