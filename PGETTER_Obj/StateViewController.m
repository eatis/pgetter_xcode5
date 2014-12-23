//
//  StateViewController.m
//  PGETTER_Obj
//
//  Created by EATis on 2013/09/02.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "StateViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface StateViewController ()

@end

@implementation StateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, 320, [app pagerViewHeight]);
    [self.view setBackgroundColor:[UIColor colorWithRed:0.973f green:0.973f blue:1.0f alpha:1.0]];
    //self.view.layer.shadowOpacity = 0.8;
    //self.view.layer.shadowOffset = CGSizeMake(2, 2);
    
    [self setUpTouchMenuView];
    
    
    //pageControll内のViewの大きさ
    _viewWidth  = self.view.frame.size.width;
    _viewHeight = self.view.frame.size.height - 50;
    
    
    
    /*
     @"駅・歩道橋など(緩やか)",@"百貨店・大型ビルなど(少し緩やか)",@"平均値(普通)",@"アパート・マンションなど(少し急な)",@"飲み屋・飲食店など(急な)",@"エスカレーター"
     */

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpTouchMenuView {
	NSMutableArray *array = [[NSMutableArray alloc] init];
    NSArray *nameArray =
    [NSArray arrayWithObjects:@"駅・歩道橋\n(緩やか)",@"百貨店・\n大型ビル\n(少し緩やか)",@"平均値\n(普通)",@"アパート・\nマンション\n(少し急な)",@"飲み屋・\n飲食店\n(急な)",@"エスカ\nレーター", nil];

	for (int i = 1; i < 7; i++) {
		NSString *imgName = [NSString stringWithFormat:@"%d.png", i];
		NSString *imgSelectedName = [NSString stringWithFormat:@"%ds.png", i];
        
		//Set the items
		//TouchItem *item = [[TouchItem alloc] initTouchItem:[UIImage imageNamed:@"bg.png"] iconImage:[UIImage imageNamed:imgName] andLabel:@"少し緩やか\nTest Test\nTest Test"];
        NSString *nameStr = [nameArray objectAtIndex:i-1];
        TouchItem *item = [[TouchItem alloc] initTouchItem:[UIImage imageNamed:@"bg.png"] iconImage:[UIImage imageNamed:imgName] andLabel:nameStr];
        
		//Set highlighted behaviour
		[item setHighlightedBackground:nil iconHighlighted:[UIImage imageNamed:imgSelectedName] textColorHighlighted:[UIColor colorWithRed:255/255 green:60/255 blue:16/255 alpha:1]];
        
		[array addObject:item];
        
	}
    
    TouchMenu *_menuView = [[TouchMenu alloc] initTouchMenuViewWithFrame:self.view.frame withBackgroundColor:[UIColor clearColor] menuItems:array];
    
    //[_touchMenu setUpTouchMenuItems:array];
    
	//We choose an animation when the user touch the item (you can create your own animation)
	[_menuView setAnimationType:TouchedZoomOut];
    
	_menuView.delegate = self;
    [self.view addSubview:_menuView];
    
    _selectedMenuIndex = 2;
}

# pragma mark -
# pragma mark Delegate Methods
# pragma mark -
- (void)touchMenu:(TouchItem *)menu didSelectIndex:(NSInteger)selectedIndex {
	NSLog(@"Item %d", selectedIndex);
    _selectedMenuIndex = selectedIndex;
    //DO somenthing here
}

@end
