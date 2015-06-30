//
//  DetailViewController.m
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize answer1lbl;
@synthesize answer2lbl;
@synthesize answer3lbl;
@synthesize answer4lbl;

@synthesize answer1txt;
@synthesize answer2txt;
@synthesize answer3txt;
@synthesize answer4txt;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answer1lbl.text = self.answer1txt;
    self.answer2lbl.text = self.answer2txt;
    self.answer3lbl.text = self.answer3txt;
    self.answer4lbl.text = self.answer4txt;
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
