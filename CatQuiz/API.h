//
//  API.h
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface API : NSObject
+(void)getRandomQuestion:(UIViewController <TriviaSheetProtocol>*) viewController;
+(void)getRandomQuestion:(UIViewController <TriviaSheetProtocol>*) viewController alertView:(UIAlertView*)alertView;
+(void)getKitten:(DetailViewController*) viewController;
@end
