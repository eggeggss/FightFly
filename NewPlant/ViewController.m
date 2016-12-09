//
//  ViewController.m
//  NewPlant
//
//  Created by RogerRoan on 2016/1/9.
//  Copyright © 2016年 RogerRoan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//delegate
-(void) message:(UIAlertController *)alert
{
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.myview.delegatemyview=self;
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) viewDidAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
