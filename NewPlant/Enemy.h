//
//  Enemy.h
//  NewPlant
//
//  Created by RogerRoan on 2016/1/13.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Enemy : NSObject
@property CGFloat enemyx,enemyy,viewW,viewH,dx,dy,ex,ey;
@property CGRect rect;
@property BOOL survival;
@property NSMutableArray *enemy_list;
-(id)initwithx:(CGFloat) x andy:(CGFloat) y andW:(CGFloat) w andH:(CGFloat) h andEnemyx:(CGFloat) ex andEnemyy:(CGFloat)ey andenemys:(NSMutableArray*) enemy;

@end
