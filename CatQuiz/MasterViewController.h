//
//  MasterViewController.h
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, assign) int correctAns;
@property (strong, nonatomic) NSString* questiontext;
@property (strong, nonatomic) NSString* answer1text;
@property (strong, nonatomic) NSString* answer2text;
@property (strong, nonatomic) NSString* answer3text;
@property (strong, nonatomic) NSString* answer4text;


@end

