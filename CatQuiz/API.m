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
#import "TriviaSheetProtocol.h"
#import <UNIRest.h>

@implementation API

+(void)getRandomQuestion:(UIViewController <TriviaSheetProtocol>*) viewController{
    [self getRandomQuestion:viewController alertView:nil];
}

+(void)getRandomQuestion:(UIViewController <TriviaSheetProtocol>*) viewController alertView:(UIAlertView*)alertView{
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.color = [UIColor blueColor];
    spinner.center = viewController.view.center;
    [spinner startAnimating];
    [viewController.view addSubview:spinner];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    NSDictionary *headers = @{@"X-Mashape-Key": @"r4jP7hJ4p2mshjCkXqNoAXxcAENvp1Nz85Tjsn9XrqzjJlrUCH", @"size": @"small"};
    [[UNIRest get:^(UNISimpleRequest *request) {
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
        
        if([viewController isMemberOfClass: [MasterViewController class]]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner removeFromSuperview];
                [spinner stopAnimating];
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                [viewController performSegueWithIdentifier:@"showDetail" sender:nil];
            });
        }else{
            if (alertView != nil) {while ([alertView isVisible]) {}} //wait for the alertview to go away
            dispatch_async(dispatch_get_main_queue(), ^{
                [viewController viewDidLoad];
                [spinner removeFromSuperview];
                [spinner stopAnimating];
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                
            });
        }
    }];
}


+(void)getKitten:(DetailViewController*) viewController{
    
    NSDictionary *parameters = @{@"api_key": @"MjM5Mzc"};
    [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"http://thecatapi.com/api/images/get"];
        [request setParameters: parameters];
    }] asBinaryAsync:^(UNIHTTPBinaryResponse *response, NSError *error) {
        NSData *body = response.body;
        UIImage* image = [UIImage imageWithData:body];
        viewController.catImage = image;
    }];

    
}

+(void)getCategories:(MasterViewController*) viewControlller{
    
    NSDictionary *headers = @{@"X-Mashape-Key": @"r4jP7hJ4p2mshjCkXqNoAXxcAENvp1Nz85Tjsn9XrqzjJlrUCH", @"Accept": @"application/json"};
    [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://pareshchouhan-trivia-v1.p.mashape.com/v1/getCategoryList"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        UNIJsonNode *body = response.body;
        NSArray* array = body.JSONArray;
        
        NSMutableArray* categories = [[NSMutableArray alloc] init];
        categories[0] = @"Random";
        for (NSDictionary* questionPair in array) {
            int index = [[questionPair valueForKey:@"id"] intValue];
            NSString* category = [questionPair valueForKey:@"categ_name"];
            categories[index] = category;
            viewControlller.categories = categories;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [viewControlller.tableView reloadData];
            
            [UIView transitionWithView:viewControlller.imageOverlay
                            duration:1
                            options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:nil];
            
            viewControlller.imageOverlay.hidden = YES;
        });
    }];
}

+(void)getCategoricalQuestion:(UIViewController <TriviaSheetProtocol>*) viewController cat:(int) cat alertView:(UIAlertView*)alertView{
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.color = [UIColor blueColor];
    spinner.center = viewController.view.center;
    [spinner startAnimating];
    [viewController.view addSubview:spinner];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    NSDictionary *headers = @{@"X-Mashape-Key": @"r4jP7hJ4p2mshjCkXqNoAXxcAENvp1Nz85Tjsn9XrqzjJlrUCH", @"size": @"small"};
    [[UNIRest get:^(UNISimpleRequest *request) {
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
        
        if([viewController isMemberOfClass: [MasterViewController class]]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner removeFromSuperview];
                [spinner stopAnimating];
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                [viewController performSegueWithIdentifier:@"showDetail" sender:nil];
            });
        }else{
            if (alertView != nil) {while ([alertView isVisible]) {}} //wait for the alertview to go away
            dispatch_async(dispatch_get_main_queue(), ^{
                [viewController viewDidLoad];
                [spinner removeFromSuperview];
                [spinner stopAnimating];
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                
            });
        }
    }];
}


+(NSString*)trim:(NSString*)string{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
