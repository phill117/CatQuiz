//
//  DetailViewController.m
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import "DetailViewController.h"
#import "PrizeViewController.h"
#import "API.h"
#import "NSString+HTML.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize correctAns;
@synthesize questiontext;
@synthesize answer1text;
@synthesize answer2text;
@synthesize answer3text;
@synthesize answer4text;

int ansChoice = -1;

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
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            //while(self.catImage == nil){}; // wait
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self performSegueWithIdentifier:@"showKitten" sender:nil];
            });
        });
        
    }else{
        NSString* base = @"The correct answer was...\n";
        base = [base stringByAppendingString:[(UILabel*)self.labelCollection[self.correctAns - 1] text]];
        NSLog(@"base %@",base);
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect" message:base delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Try Another", nil];
        [alertView show];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.catImage = nil;
    [API getKitten:self];
    
    [self createWebViewWithHTML];
    
    self.answer1lbl.text = self.answer1text;
    self.answer2lbl.text = self.answer2text;
    self.answer3lbl.text = self.answer3text;
    self.answer4lbl.text = self.answer4text;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showKitten"]){
        PrizeViewController* viewController = (PrizeViewController*)segue.destinationViewController;
        viewController.catImage = self.catImage;
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        //while ([alertView isVisible]) {}
        [API getRandomQuestion:self alertView:alertView];
    }
}

- (void) createWebViewWithHTML{
    //create the string
    NSMutableString *html = [NSMutableString stringWithString: @"<html><head><title></title></head><body style=\"background:transparent;\">"];
    
    //continue building the string
    NSString* unescaped = [self.questiontext stringByDecodingHTMLEntities];
    [html appendString:unescaped];
    [html appendString:@"</body></html>"];
    
    //instantiate the web view
    //UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    //make the background transparent
    //[self.questionWebView setBackgroundColor:[UIColor clearColor]];
    
    //pass the string to the webview
    [self.questionWebView loadHTMLString:[html description] baseURL:nil];
    
}

@end
