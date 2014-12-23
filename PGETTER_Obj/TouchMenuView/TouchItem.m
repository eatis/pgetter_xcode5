//
//  TouchItem.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/04.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "TouchItem.h"

static inline CGRect ScaleRect(CGRect rect, float n) {
	return CGRectMake((rect.size.width - rect.size.width * n) / 2, (rect.size.height - rect.size.height * n) / 2, rect.size.width * n, rect.size.height * n);
}

@implementation TouchItem

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
# pragma mark Initialization method
# pragma mark -


- (id)initTouchItem:(UIImage *)backgroundImage iconImage:(UIImage *)iconImage andLabel:(NSString *)labelItem  {
	self = [[[NSBundle mainBundle] loadNibNamed:@"TouchItem" owner:self options:nil] lastObject];
	if (self) {
		// Initialization code
		self.bgImage.image = backgroundImage;
		self.labelItem.text = labelItem;
		self.iconImage.image = iconImage;
	}
        
	return self;
}

# pragma mark -
# pragma mark UIView Delegate methods
# pragma mark -


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	self.highlighted = YES;
    
    NSLog(@"menu touchsBegan");
    
	if ([_delegate respondsToSelector:@selector(itemTouchesBegan:)]) {
		[_delegate itemTouchesBegan:self];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	// if move out of 2x rect, cancel select menu...
	CGPoint location = [[touches anyObject] locationInView:self];
	if (!CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location)) {
		self.highlighted = NO;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //    self.highlighted = NO;
	CGPoint location = [[touches anyObject] locationInView:self];
	if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location)) {
		if ([_delegate respondsToSelector:@selector(itemTouchesEnd:)]) {
			[_delegate itemTouchesEnd:self];
		}
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	self.highlighted = NO;
}


# pragma mark -
# pragma mark Highlighted state
# pragma mark -

- (void)setHighlightedBackground:(UIImage *)backgroundImageHightlighted iconHighlighted:(UIImage *)iconImageHighlighted textColorHighlighted:(UIColor *)texColorHighlighted {
	if (backgroundImageHightlighted) {
		self.bgImage.highlightedImage = backgroundImageHightlighted;
	}
    
	if (iconImageHighlighted) {
		self.iconImage.highlightedImage = iconImageHighlighted;
	}
    
	if (texColorHighlighted) {
		[self.labelItem setHighlightedTextColor:texColorHighlighted];
	}
}

- (void)setHighlighted:(BOOL)highlighted {
	// [super setHighlighted:highlighted];
	[_bgImage setHighlighted:highlighted];
	[_iconImage setHighlighted:highlighted];
	[_labelItem setHighlighted:highlighted];
}

@end
