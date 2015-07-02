//
//  DetailViewController.h
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIRenderer.h"
#import "TriviaSheetProtocol.h"

@interface DetailViewController : UIViewController <UIAlertViewDelegate, TriviaSheetProtocol>

@property (strong, nonatomic) id detailItem;

@property (nonatomic, retain) IBOutletCollection(UISwitch) NSArray* switchCollection;

@property (nonatomic, retain)
IBOutletCollection(UILabel) NSArray* labelCollection;

@property (strong, nonatomic) IBOutlet UIWebView *questionWebView;

@property (strong, nonatomic) IBOutlet UILabel *questionlbl;
@property (strong, nonatomic) IBOutlet UILabel *answer1lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer2lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer3lbl;
@property (strong, nonatomic) IBOutlet UILabel *answer4lbl;
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;

@property (strong, nonatomic) UIImage* catImage;

@end

