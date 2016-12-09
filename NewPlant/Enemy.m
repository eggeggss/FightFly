//
//  Enemy.m
//  NewPlant
//
//  Created by RogerRoan on 2016/1/13.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import "Enemy.h"
#import "MyView.h"
@implementation Enemy
{
    NSTimer *timer;
    MyView *myview;
    
}

-(id)initwithx:(CGFloat) x andy:(CGFloat) y andW:(CGFloat) w andH:(CGFloat) h andEnemyx:(CGFloat)ex andEnemyy:(CGFloat)ey andenemys:(NSMutableArray *)enemy
{
    _enemyx=x;
    _enemyy=y;
    _viewH=h;
    _viewW=w;
    _dx=4;
    _dy=4;
    _ex=ex;
    _ey=ey;
    _rect=CGRectMake(x, y, ex, ey);
    _survival=true;
    _enemy_list=enemy;
    [_enemy_list addObject:self];
    self->timer=[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(run:) userInfo:nil repeats:YES];
    
    return self;
}

-(void) setMyview:(MyView *)view{


}

-(void) run:(NSTimer *) timer
{
    _enemyy+=_dy;
    
    _rect=CGRectMake(_enemyx , _enemyy, 64, 64);
    
    if (_enemyy>=541){
     
        [self.enemy_list removeObject:self];
        [timer invalidate];
    }
}



@end
