//
//  ViewController.m
//  ecsoftdirectionboard
//
//  Created by Kalyan Kumar on 22/03/14.
//  Copyright (c) 2014 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    list = [[NSArray alloc]initWithObjects:@"WOW...",@"ATM...",@"STORE...",@"STORE 2",@"STORE 3",@"STORE 4", nil];
    /*UIButton* button;
    
    for (int i=0; i<=90; i+=10) {
        if (i>10 && i<60) {
            continue;
        }
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.height)*.375,(180+i),80,10)];
        [self.view addSubview:button];
    }
    
    for (int i=0; i<=135; i+=15) {
        if (i>15 && i<90) {
                continue;
        }
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setFrame:CGRectMake(433,(565+i),92,15)];
        [self.view addSubview:button];
     }*/
    //NSLog(@"Position Width %f",[[UIScreen mainScreen] bounds].size.width);
    //NSLog(@"Position Height %f",[[UIScreen mainScreen] bounds].size.height);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    //NSLog(@"Tapped %@",NSStringFromCGPoint(touchLocation));
    inc = 0;
    if ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"] || [[[UIDevice currentDevice] model] isEqualToString:@"iPad Simulator"]) {
        for (int i=0; i<=135; i+=15) {
            if (i>15 && i<90) {
                continue;
            }
            if (CGRectContainsPoint(CGRectMake(433,(565+i),92,15), touchLocation)) {
                [self showAlert:[NSString stringWithFormat:@"%@",list[inc]]];
                break;
            }
            inc++;
        }
    }else{
        for (int i=0; i<=90; i+=10) {
            if (i>10 && i<60) {
                continue;
            }
            if (CGRectContainsPoint(CGRectMake(([[UIScreen mainScreen] bounds].size.height)*.375,(180+i),80,10), touchLocation)) {
                [self showAlert:[NSString stringWithFormat:@"%@",list[inc]]];
                break;
            }
            inc++;
        }
    }
}

-(void)showAlert:(NSString*)message{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Direction Board" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
