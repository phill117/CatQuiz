//
//  DetailViewController.m
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import "DetailViewController.h"
#import "NSString_stripHtml.h"
#import "PrizeViewController.h"
#import "API.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
            while(self.catImage == nil){}; // wait
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self performSegueWithIdentifier:@"showKitten" sender:nil];
            });
        });
        
    }else{
        NSString* base = @"The correct answer was...\n";
        base = [base stringByAppendingString:[(UILabel*)self.labelCollection[self.correctAns - 1] text]];
        NSLog(@"base %@",base);
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect" message:base delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError* err = nil;
    
    self.catImage = nil;
    [API getKitten:self];
    
//    NSRegularExpression *regex = [NSRegularExpression
//                                  regularExpressionWithPattern:@"(&lt;).*(&gt;).*(&lt;)/.*(&gt;)" options:0 error:nil];
    
//    NSRegularExpression *regex2 = [NSRegularExpression
//                                  regularExpressionWithPattern:@"&lt;.*&gt;" options:0 error:nil];
    
//    NSLog(@"before %@", self.questiontxt);
//    [regex2 stringByReplacingMatchesInString:self.questiontxt options:nil range:NSMakeRange(0, [self.questiontxt length]) withTemplate:@""];
//    self.questionlbl.text = [self.questiontxt stripHtml];
//    NSLog(@"after  %@", self.questionlbl.text);
    
    self.questionlbl.attributedText =
        [[NSAttributedString alloc]
         initWithData: [self.questiontxt dataUsingEncoding:NSUTF8StringEncoding]
         options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
         documentAttributes: nil
         error: &err];
    
//    CGSize stringsize = [@"Submit" sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17.0] }];
//    [self.submitBtn setFrame:CGRectMake(10,0,stringsize.width, stringsize.height)];
    
    self.answer1lbl.text = self.answer1txt;
    self.answer2lbl.text = self.answer2txt;
    self.answer3lbl.text = self.answer3txt;
    self.answer4lbl.text = self.answer4txt;
    
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
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
