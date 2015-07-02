//
//  PrizeViewController.m
//  CatQuiz
//
//  Created by Sean Phillips on 7/2/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import "PrizeViewController.h"

@implementation PrizeViewController

-(void)viewDidLoad{
    [self.catView setImage:self.catImage];
}

- (IBAction)acceptBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
