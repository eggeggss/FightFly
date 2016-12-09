//
//  ViewController.h
//  NewPlant
//
//  Created by RogerRoan on 2016/1/9.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"
@interface ViewController : UIViewController<MyViewDelegateMsg>
@property (weak, nonatomic) IBOutlet MyView *myview;

@end

