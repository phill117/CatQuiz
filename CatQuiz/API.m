//
//  API.m
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import "API.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import <UNIRest.h>

@implementation API

+(void)getRandomQuestion:(MasterViewController*) viewController{
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.color = [UIColor blueColor];
    spinner.center = viewController.view.center;
    [spinner startAnimating];
    [viewController.view addSubview:spinner];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    NSDictionary *headers = @{@"X-Mashape-Key": @"r4jP7hJ4p2mshjCkXqNoAXxcAENvp1Nz85Tjsn9XrqzjJlrUCH", @"size": @"small"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://pareshchouhan-trivia-v1.p.mashape.com/v1/getRandomQuestion"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        UNIJsonNode *body = response.body;
        NSLog(@"%@",body.JSONObject);
        NSDictionary* dic = body.JSONObject;
        
        viewController.correctAns = [[dic valueForKey:@"q_correct_option"] intValue];
        viewController.questiontext = [dic valueForKey:@"q_text"];
        viewController.answer1text = [self trim:[dic valueForKey:@"q_options_1"]];
        viewController.answer2text = [self trim:[dic valueForKey:@"q_options_2"]];
        viewController.answer3text = [self trim:[dic valueForKey:@"q_options_3"]];
        viewController.answer4text = [self trim:[dic valueForKey:@"q_options_4"]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner removeFromSuperview];
            [spinner stopAnimating];
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
            [viewController performSegueWithIdentifier:@"showDetail" sender:nil];
        });
    }];
}


+(void)getKitten:(DetailViewController*) viewController{
    
    NSDictionary *parameters = @{@"api_key": @"MjM5Mzc"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"http://thecatapi.com/api/images/get"];
        [request setParameters: parameters];
    }] asBinaryAsync:^(UNIHTTPBinaryResponse *response, NSError *error) {
        NSInteger code = response.code;
        NSData *body = response.body;
//        NSLog(@"%@",body);
//        NSLog(@"%ld",(long)code);
        UIImage* image = [UIImage imageWithData:body];
        viewController.catImage = image;
    }];

    
}

+(NSString*)trim:(NSString*)string{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
