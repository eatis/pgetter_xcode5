//
//  CalcPEquation.h
//  PGetter
//
//  Created by EATis on 2013/06/16.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcPEquation : NSObject {
    float _numberOfStairs;
    float _eyesPosition;
    //float _lengthOfSkirt;
    //float _widthOfSkirt;
}

@property (nonatomic, assign) int numberOfSteps;
@property (nonatomic, assign) float heightOfStairs;
@property (nonatomic, assign) float widthOfStairs;
@property (nonatomic, assign) float lengthOfSkirt;
@property (nonatomic, assign) float widthOfSkirt;




//======================================================================
- (int)calcStepsMyHeight:(float)myHeight heightOfTerget:(float)tergetHeight withState:(int)state withTergetBodyType:(int)bodyType withSkirtLength:(int)skirtLength;

- (void)selectState:(int)state;
- (void)selectBodyType:(int)bodyType;
- (void)selectSkirtLength:(int)skirtLength;

@end
