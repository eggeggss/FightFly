//
//  MyPlant.m
//  NewPlant
//
//  Created by RogerRoan on 2016/1/9.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import "MyPlant.h"

@implementation MyPlant

-(id) initwith:(CGFloat) planex andy:(CGFloat) planey andW:(CGFloat) viewW andH:(CGFloat) viewH andView:(MyView *)myview
{
    _planex=planex;
    _planey=planey;
    _viewW=viewW;
    _viewH=viewH;
    _myview=myview;
    _myview.delegatefire=self;
    _rect=CGRectMake(planex, planey, _viewW, _viewH);
    
    return self;
}


-(void)fireInvoke:(NSInteger)number{

    static int fire_number=0;
    
    
    int64_t delayInSeconds = 1;
    /*
     *@parameter 1,时间参照，从此刻开始计时
     *@parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
     */
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    
    if (fire_number>=20)
    {
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            fire_number=0;//NSLog(@"hello world!");
    
        });
    }else{
    
        fire_number++;
        _bullet=[[Bullet alloc] initwithx:_planex andy:_planey andW:_viewW andH:_viewH andbullets:_myview.bullet_list];
        _bullet.bulletW=10;
        _bullet.bulletH=10;
        [_myview.bullet_list addObject:_bullet];
        //NSLog(@"%i",fire_number);

    }
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
