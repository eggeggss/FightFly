//
//  Bullet.h
//  NewPlant
//
//  Created by RogerRoan on 2016/1/13.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NumberHand.h"

@interface Bullet : NSObject
@property CGFloat bulletx,bullety,viewW,viewH,dx,dy,bulletW,bulletH;
@property CGRect rect;
@property NSMutableArray *b;
@property NSMutableArray *bullets;
@property CGFloat rcolor,gcolor,bcolor;
@property BOOL bbad;
@property BOOL bhitenemy;
-(id)initwithx:(CGFloat) x andy:(CGFloat) y andW:(CGFloat) w andH:(CGFloat) h andbullets:(NSMutableArray*) list;

-(void) fire;
-(void) changeColorr:(CGFloat)r and:(CGFloat)g andb: (CGFloat) b ;
-(void) changeSize:(CGFloat)w andH:(CGFloat)h;
@end
