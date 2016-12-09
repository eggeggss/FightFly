//
//  MyPlant.h
//  NewPlant
//
//  Created by RogerRoan on 2016/1/9.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"
#import "Bullet.h"
@interface MyPlant : NSObject<MyViewDelegateFire>
@property MyView *myview;
@property CGFloat planex,planey,viewW,viewH;
@property Bullet *bullet;
@property CGRect rect;
-(id) initwith:(CGFloat)planex andy:(CGFloat)planey andW:(CGFloat)viewW andH:(CGFloat)viewH andView:(MyView *)myview;

@end

