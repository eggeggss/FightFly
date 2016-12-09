//
//  Bullet.m
//  NewPlant
//
//  Created by RogerRoan on 2016/1/13.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet
{
    NSTimer *time;

}
    
-(id)initwithx:(CGFloat) x andy:(CGFloat) y andW:(CGFloat) w andH:(CGFloat) h andbullets:(NSMutableArray *) list{
    
    _bulletx=x+30;
    _bullety=y;
    _viewW=w;
    _viewH=h;
    _dx=0;
    _dy=-4;

    self.bullets=list;
   
    [self changeColorr:1 and:1 andb:0];
    time=[NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(fire:) userInfo:nil repeats:YES ];
    return self;
}


-(void) fire:(NSTimer *) time{
    
    if (_bullety<=0)
    {
        ///*
        int i=arc4random() % 2;
        _dy *=-1;
        _dx=i-1;
        _dx=(_dx==0)? 1:_dx;
        //*/
        
        //int _dx=[Util returnRandomNumber];
        _dx=(arc4random()% 4) * _dx;
        
        if(self.bhitenemy)
        {
            [self changeColorr:1 and:0 andb:0];
            
            [self changeSize:20 andH:20];

        }
        else
        {
            [self changeColorr:0.3 and:1 andb:0];
            
            _bbad=YES;
        }
    }
    
    if ( _bulletx<0 || _bulletx+_bulletW > 280)
    {
        _dx*=-1;
    }
    
    _bullety+=_dy;
    _bulletx+=_dx;

    
    _rect=CGRectMake(_bulletx, _bullety, _bulletW  , _bulletH);
    
    if (_bullety+10 >528)
    {
        [self.bullets removeObject:self];
        [time invalidate];
        
    }
    
    //[self.bullets removeObject:self];
    //NSLog(@"remove self");
}


-(void) changeColorr:(CGFloat)r and:(CGFloat)g andb: (CGFloat) b
{
    _rcolor=r;
    _gcolor=g;
    _bcolor=b;
    
}

-(void) changeSize:(CGFloat)w andH:(CGFloat)h
{
    self.bulletW=w;
    self.bulletH=h;

}

@end
