//
//  CalcPEquation.m
//  PGetter
//
//  Created by EATis on 2013/06/16.
//  Copyright (c) 2013年 EATis. All rights reserved.
//

#import "CalcPEquation.h"

@implementation CalcPEquation

/*======================================================================
 s：スカートの長さ（股から裾まで）
 s'：スカートの後ろ幅
 m：股下の長さ
 t：身長
 e：目線の位置（頭から目までの長さ）
 h：階段の高さ
 d：階段の幅
 n：階段の段数
 */

/*例
 自分の身長：170cm
 目線の位置：13cm
 ターゲットの股下：74cm
 スカートの長さ：6cm
 スカートの後ろ幅：12cm
 階段の高さ：20cm
 階段の幅：28cm
 
 HIP80cm（スリム）の時のS'の値＝ 11cm
 HIP86cm（標準）の時のS'の値＝ 13cm
 HIP92cm（グラマー）の時のS'の値＝ 15cm
 
 上記のデータから、ターゲットの身長を
 「小柄（約148cm）」「低め（約154cm）」「普通（約159cm）」「高め（約165cm）」「モデル並（約170cm）」
 の5つのグループに分け、さらに股下の長さはそれらに×0.45した値で一般化することにした。
 
 駅・歩道橋など(緩やか)、百貨店・大型ビルなど(少し緩やか)、平均値(普通)、アパート・マンションなど(少し急な)、飲み屋・飲食店など(急な)、エスカレーター
 エスカレーター:高さ21cm、幅40cm
 ======================================================================*/


- (int)calcStepsMyHeight:(float)myHeight heightOfTerget:(float)tergetHeight withState:(int)state withTergetBodyType:(int)bodyType withSkirtLength:(int)skirtLength {
    
    //s/s' ＜ (hn+m-(t-e))/dn
    //n < ((hn+m-(t-e))s')/ds
    //n < s'(m-(t-e))/(sd-s'h)
    /*
    s：スカートの長さ（股から裾まで）
    s'：スカートの後ろ幅
    m：股下の長さ
    t：身長
    e：目線の位置（頭から目までの長さ）
    h：階段の高さ
    d：階段の幅
    n：階段の段数
     */
    
    _eyesPosition = 13;
    
    [self selectState:state];
    [self selectBodyType:bodyType];
    [self selectSkirtLength:skirtLength];
    
    NSLog(@"calc steps myHeight:%f tergetHeight:%f wSkirt:%f lSkirt:%f wStairs:%f hStairs:%f",myHeight, tergetHeight, _widthOfSkirt, _lengthOfSkirt, _widthOfStairs, _heightOfStairs);
    
    _numberOfStairs = _widthOfSkirt * (0.45*tergetHeight - (myHeight - _eyesPosition))/(_lengthOfSkirt * _widthOfStairs - _widthOfSkirt * _heightOfStairs);
    
    //_numberOfStairs = (0.45*tergetHeight - (myHeight - _eyesPosition))*_widthOfSkirt/(_lengthOfSkirt * _widthOfStairs - _heightOfStairs * _widthOfSkirt);
    
    //_numberOfStairs = (0.45*tergetHeight - (myHeight - _eyesPosition))*skirtWidth/(skirtLength * stairsWidth - stairsHeight * skirtWidth);
    
    
    //ceilf()  階段の段数をintに変換
    NSLog(@"Number of stairs --> %f",ceilf(_numberOfStairs));
    _numberOfSteps = ceilf(_numberOfStairs);
    
    if (_numberOfStairs < 0.0) {
        _numberOfSteps = 0;
    }

    
    return self.numberOfSteps;
}

- (void)selectState:(int)state {
    switch (state) {
        case 0:
            _heightOfStairs = 14.0;
            _widthOfStairs = 30.0;
            break;
            
        case 1:
            _heightOfStairs = 16.0;
            _widthOfStairs = 30.0;
            break;
            
        case 2:
            _heightOfStairs = 20.0;
            _widthOfStairs = 28.0;
            break;
            
        case 3:
            _heightOfStairs = 21.0;
            _widthOfStairs = 30.0;
            break;
            
        case 4:
            _heightOfStairs = 24.0;
            _widthOfStairs = 30.0;
            break;
            
        case 5:
            _heightOfStairs = 46.0;
            _widthOfStairs = 75.0;
            break;
            
        default:
            break;
    }
    
    NSLog(@"selectState %f %f",_heightOfStairs, _widthOfStairs);
}

- (void)selectBodyType:(int)bodyType {
    switch (bodyType) {
        case 0:
            _widthOfSkirt = 15.0;
            break;
            
        case 1:
            _widthOfSkirt = 15.0;
            break;
            
        case 2:
            _widthOfSkirt = 13.0;
            break;
            
        case 3:
            _widthOfSkirt = 11.0;
            break;
            
        case 4:
            _widthOfSkirt = 11.0;
            break;
            
        default:
            break;
    }
    
    NSLog(@"selectBodyType %f", _widthOfSkirt);
    
}

- (void)selectSkirtLength:(int)skirtLength {
    switch (skirtLength) {
        case 0:
            _lengthOfSkirt = 6.0;
            break;
            
        case 1:
            _lengthOfSkirt = 8.0;
            break;
            
        case 2:
            _lengthOfSkirt = 10.0;
            break;
            
        default:
            break;
    }

    NSLog(@"selectSkirtLength %f", _lengthOfSkirt);
}

@end
