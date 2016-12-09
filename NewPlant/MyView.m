//
//  MyView.m
//  NewPlant
//
//  Created by RogerRoan on 2016/1/9.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import "MyView.h"
#import "MyPlant.h"
#import "NumberHand.h"
@implementation MyView
{
    MyPlant *plane;
    NSTimer *enemytime;
    float enemy_level;
    //NSMutableString *str_score;
    
}

int static score=0;

int score_level=0;

//127~285
-(id) initWith:(CGRect)rect
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"空戰英豪" message:@"遊戲規則\n 綠色加分 \n 紅色死亡" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"開始遊戲" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
        
        self->enemytime=[NSTimer scheduledTimerWithTimeInterval:self->enemy_level target:self selector:@selector(enemy_gen:) userInfo:nil repeats:YES];
        
        _timer=[NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(run:) userInfo:nil repeats:YES];
    
        
    }];
    
    
   [alert addAction:action];
   
    
   if (　[_delegatemyview respondsToSelector:@selector(message:)])
   {
       [_delegatemyview message:alert];
   }
   
    
    //[_delegatemyview message:alert];

    lb_init=YES;
    
    context=UIGraphicsGetCurrentContext();
    self->rect=rect;
    self->viewH= CGRectGetWidth(rect);
    self->viewW=CGRectGetHeight(rect);
    
    imagePlane=[UIImage imageNamed:@"00.jpg"].CGImage;
    imageEnemy=[UIImage imageNamed:@""].CGImage;
    
    plane=[[MyPlant alloc] initwith:113 andy:400 andW:self->viewW andH:self->viewW andView:self];
    
    _bullet_list=[NSMutableArray new];
    _enemy_list=[NSMutableArray new];
    _text_list=[NSMutableArray new];
    
    
    self->enemy_level=3.00;
    
    self.stScore=@"";

    
    return self;
}


-(void) reloadAllmemberandresetscore:(BOOL)lb
{
    if(lb)
    {
      score=0;
      self->lb_init=NO;
      [self setNeedsDisplay];
        
    }else
    {
      _timer=[NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(run:) userInfo:nil repeats:YES];
       self->enemytime=[NSTimer scheduledTimerWithTimeInterval:self->enemy_level target:self selector:@selector(enemy_gen:) userInfo:nil repeats:YES];
        
      [self setNeedsDisplay];
    }
}

-(void) enemy_gen:(NSTimer *) time
{
    int random=0;
    int static staticx=0;
    int genx=0;
    
    random=arc4random() % 250;
    
    genx=staticx+random;
    
    Enemy *enemy=[[Enemy alloc] initwithx:genx andy:0 andW:self->viewW andH:self->viewH andEnemyx:64 andEnemyy:64 andenemys:self.enemy_list];
}


-(void) intersetDetetionTouchPlane{

    for(Bullet *bull in self.bullet_list)
    {
        if (CGRectIntersectsRect(bull.rect, plane.rect))
        {
            if (bull.bbad)
            {
                score++;
                
                score_level++;
                
                if(score_level>=1000)
                {
                    self->enemy_level=self->enemy_level-0.1;
                    
                    //NSLog(@"NEXT LEVEL %f",self->enemy_level);
                    score_level=0;
                    
                    if ([self->enemytime isValid])
                    {
                        [self->enemytime invalidate];
                    }
                    
                   self->enemytime=[NSTimer scheduledTimerWithTimeInterval:self->enemy_level target:self selector:@selector(enemy_gen:) userInfo:nil repeats:YES];
                    
                }
                
                
                NSString *s=[NSString stringWithFormat:@"Score: %i",score];
                
                self.stScore=s;
                
                bull.rcolor=0;
                bull.gcolor=0;
                bull.bcolor=0;
            }
            
            if (bull.bhitenemy)
            {
                
                NSString *s=[NSString stringWithFormat:@"你的得分是: %i",score];
                
                [bull changeColorr:1 and:0 andb:0];
                [self.timer invalidate];
                [self->enemytime invalidate];
                
                
                UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"GameOver" message:s preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *action=[UIAlertAction actionWithTitle:@"重玩" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self reloadAllmemberandresetscore:YES ];
            
                }];
        
                
                UIAlertAction *action2=[UIAlertAction actionWithTitle:@"接關" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self reloadAllmemberandresetscore:NO ];
                }];
                
                [alert addAction:action];
                [alert addAction:action2];

                
                
                [_delegatemyview message:alert ];
                
            }
            
        }
    }
    
}

-(void) intersetDetetion{

    for(Bullet *bull in self.bullet_list)
    {
        for (NSInteger i=0; i<self.enemy_list.count;i++)
        {
            Enemy *enemy=self.enemy_list[i];
            
            if (CGRectIntersectsRect(bull.rect, enemy.rect))
            {
                if(enemy.survival)
                {
                   enemy.survival=NO;
                
                   [self.enemy_list replaceObjectAtIndex:i withObject:enemy];
                
                    bull.bhitenemy=YES;
                    
                    [bull changeColorr:1 and:0 andb:0];
                    [bull changeSize:20 andH:20];
                    //NSLog(@"發生碰撞 %i",i);
                }
            }
        }
        
    }

}


-(void)run:(NSTimer *)time
{
    
    [self setNeedsDisplay];
    [self intersetDetetion];
    [self intersetDetetionTouchPlane];
    
    [_delegatefire fireInvoke:5];
    
    
}


-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touchs=[touches anyObject];
    
    CGPoint loc=[touchs locationInView:self];
    //plane change location
    self->planetx=loc.x;
    self->planety=loc.y;
    
    self->plane.planex=loc.x;
    self->plane.planey=loc.y-100;
    
    self->plane.rect=CGRectMake(self->plane.planex, self->plane.planey, 54, 54);
    

}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

   
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touchs=[touches anyObject];

    CGPoint loc=[touchs locationInView:self];
    
    self->planetx=loc.x;
    self->planety=loc.y;
    
    NSLog(@"orig x=>%f  y=>%f",loc.x,loc.y);
}



- (void)drawRect:(CGRect)rect
{
    
    if(lb_init==NO)
    {
        [self initWith:rect];
    }
    
    CGContextSaveGState(context);
    
    CGContextDrawImage(context, CGRectMake(self->plane.planex, self->plane.planey, 64, 64), imagePlane);
    
    //[self drawText:@"Hello" x:50 y:50];
    
    for (Enemy *enemy  in self.enemy_list)
    {
     if (enemy.survival)
        CGContextDrawImage(context, enemy.rect, imageEnemy);
    }
    
    for(Bullet *bull in self.bullet_list)
    {
        
        CGContextSetRGBFillColor(context, bull.rcolor, bull.gcolor, bull.bcolor, 1);
        CGContextAddEllipseInRect(context,bull.rect);
        CGContextDrawPath(context, kCGPathFill);
    }
    

    
    CGContextSelectFont(context, "Arial", 20, kCGEncodingMacRoman);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGAffineTransform xform = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
    CGContextSetTextMatrix(context, xform);
    CGContextSetTextPosition(context, 170, 33); // 20 is y-axis offset pixels
    CGContextShowText(context, [self.stScore UTF8String], strlen([self.stScore UTF8String]));     //NSLog(@"drawRect");
  
    
    
    CGContextRestoreGState(context);
    
}
@end
