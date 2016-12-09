//
//  NumberHand.m
//  NewPlant
//
//  Created by RogerRoan on 2016/1/15.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import "NumberHand.h"

@implementation Util
+(NSInteger) returnRandomNumber
{
    int i1=arc4random() % 2;
    
    int x=(i1==0)? -1:i1;
   
    return x;
}
@end
