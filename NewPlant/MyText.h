//
//  MyText.h
//  NewPlant
//
//  Created by RogerRoan on 2016/1/15.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyText : NSObject
@property CGFloat textx,texty,viewW,viewH,dx,dy,textW,textH;
@property CGRect rect;
@property NSMutableArray *texts;
@property CGFloat rcolor,gcolor,bcolor;
@property NSMutableString *text;
-(id)initwithx:(CGFloat) x andy:(CGFloat) y andviewW:(CGFloat) w andviewH:(CGFloat) h andTexts:(NSMutableArray*) list;

-(void) changeColorr:(CGFloat)r and:(CGFloat)g andb: (CGFloat) b ;
-(void) changeSize:(CGFloat)w andH:(CGFloat)h;

@end
