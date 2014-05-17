//
//  ViewController.m
//  My Daily Fitness Guide
//
//  Created by yogesh on 14/05/2014.
//  Copyright (c) 2014. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Add UINavigationBar to view
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 63)];
    navbar.barTintColor = [UIColor blackColor];
    navbar.tintColor = [UIColor whiteColor];
    [self.view addSubview:navbar];
    
    // Add UINavigationItem to UINavigationBar
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@""];
    navbar.items = [NSArray arrayWithObject:item];
    
    // Add UIBarButtonItem to UINavigationItem
    UIBarButtonItem *agreeButton = [[UIBarButtonItem alloc] initWithTitle:@"AGREE" style:UIBarButtonItemStylePlain target:self action:@selector(agreeClicked)];
    item.rightBarButtonItem = agreeButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)agreeClicked {
    [[NSUserDefaults standardUserDefaults] setValue:@"agreeClicked" forKey:@"agree"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    UIViewController *v = [self.storyboard instantiateViewControllerWithIdentifier:@"register"];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.8;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:transition forKey:nil];
    [self presentViewController:v animated:NO completion:nil];
}

@end