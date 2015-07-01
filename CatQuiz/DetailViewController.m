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

int ansChoice = -1;

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

- (IBAction)toggle:(id)sender {
    [self.submitBtn setEnabled:true];
    for(int i = 0; i < self.switchCollection.count; i++){
        UISwitch* s = [self.switchCollection objectAtIndex:i];
        if (![s isEqual:sender]) {
            [s setOn:NO animated:YES];
        }else{
            if([s isOn]) ansChoice = i + 1;
            else{
                ansChoice = -1;
                [self.submitBtn setEnabled:NO];
            }
        }
    }
}

- (IBAction)submitAnswer:(id)sender {
    if(ansChoice == self.correctAns){
        NSLog(@"correct answer");
        //display cat
        //pop back?
    }else{
        NSLog(@"wrong");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError* err = nil;
    
    self.questionlbl.attributedText =
        [[NSAttributedString alloc]
         initWithData: [self.questiontxt dataUsingEncoding:NSUTF8StringEncoding]
         options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
         documentAttributes: nil
         error: &err];
    
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
