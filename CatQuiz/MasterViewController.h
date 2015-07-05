//
//  MasterViewController.h
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TriviaSheetProtocol.h"

@class DetailViewController;

@interface MasterViewController : UIViewController<TriviaSheetProtocol,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray* categories;
@property (strong, nonatomic) IBOutlet UIView *imageOverlay;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

