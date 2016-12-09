//
//  MyView.h
//  NewPlant
//
//  Created by RogerRoan on 2016/1/9.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Enemy.h"
#import "MyText.h"

@protocol MyViewDelegateMsg <NSObject>
-(void) message:(UIAlertController *)alert;
@end

@protocol MyViewDelegateFire<NSObject>
-(void) fireInvoke:(NSInteger) number;
@end

@interface MyView : UIView
{
    CGContextRef context;
    CGFloat viewW,viewH,planetx,planety;
    CGImageRef imagePlane,imageEnemy;
    BOOL lb_init;
    CGRect rect;
}

@property NSTimer *timer;
@property NSMutableArray *bullet_list;
@property NSMutableArray *enemy_list;
@property NSMutableArray *text_list;
@property NSString *stScore;

@property id<MyViewDelegateFire> delegatefire;
@property id<MyViewDelegateMsg> delegatemyview;

-(id) initWith:(CGRect)rect;

-(void) reloadAllmemberandresetscore: (BOOL) lb;

@end
