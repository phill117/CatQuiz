//
//  DetailViewController.h
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIRenderer.h"

@interface DetailViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (nonatomic, retain) IBOutletCollection(UISwitch) NSArray* switchCollection;

@property (nonatomic, retain)
IBOutletCollection(UILabel) NSArray* labelCollection;

@property (strong, nonatomic) IBOutlet UILabel *questionlbl;
@property (strong, nonatomic) IBOutlet UILabel *answer1lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer2lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer3lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer4lbl;
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;

@property (nonatomic, assign) int correctAns;
@property (strong, nonatomic) NSString* questiontxt;
@property (strong, nonatomic) NSString* answer1txt;
@property (strong, nonatomic) NSString* answer2txt;
@property (strong, nonatomic) NSString* answer3txt;
@property (strong, nonatomic) NSString* answer4txt;

@property (strong, nonatomic) UIImage* catImage;

@end

