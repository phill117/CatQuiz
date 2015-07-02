//
//  TriviaSheetProtocol.h
//  CatQuiz
//
//  Created by Sean Phillips on 7/2/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TriviaSheetProtocol <NSObject>

@property (nonatomic, assign) int correctAns;
@property (strong, nonatomic) NSString* questiontext;
@property (strong, nonatomic) NSString* answer1text;
@property (strong, nonatomic) NSString* answer2text;
@property (strong, nonatomic) NSString* answer3text;
@property (strong, nonatomic) NSString* answer4text;

@end