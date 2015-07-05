//
//  SplashViewController.m
//  CatQuiz
//
//  Created by Sean Phillips on 7/4/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import "SplashViewController.h"
#import "API.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [API getCategories:self];
    
    [self performSegueWithIdentifier:@"" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}


@end
