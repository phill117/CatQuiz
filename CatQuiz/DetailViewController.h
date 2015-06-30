//
//  DetailViewController.h
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *answer1lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer2lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer3lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer4lbl;

@property (strong, nonatomic) NSString* answer1txt;
@property (strong, nonatomic) NSString* answer2txt;
@property (strong, nonatomic) NSString* answer3txt;
@property (strong, nonatomic) NSString* answer4txt;

@end

