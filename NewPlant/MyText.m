//
//  MyText.m
//  NewPlant
//
//  Created by RogerRoan on 2016/1/15.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import "MyText.h"

@implementation MyText

-(id)initwithx:(CGFloat) x andy:(CGFloat) y andviewW:(CGFloat) w andviewH:(CGFloat) h andTexts:(NSMutableArray*) list
{
    _textx=x;
    _texty=y;
    _textW=w;
    _textH=h;
    _texts=list;
    _text=[NSMutableString new] ;
    [_text setString:@""];
    return self;
}

-(void) changeColorr:(CGFloat)r and:(CGFloat)g andb: (CGFloat) b
{
    _rcolor=r;
    _gcolor=g;
    _bcolor=b;
}

-(void) changeSize:(CGFloat)w andH:(CGFloat)h
{
    _textW=w;
    _textH=h;

}


@end
