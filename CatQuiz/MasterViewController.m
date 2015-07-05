//
//  MasterViewController.m
//  CatQuiz
//
//  Created by Sean Phillips on 6/29/15.
//  Copyright (c) 2015 Sean Phillips. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "API.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

@synthesize correctAns;
@synthesize questiontext;
@synthesize answer1text;
@synthesize answer2text;
@synthesize answer3text;
@synthesize answer4text;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** ADD BAR BUTTON ITEMS
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
     **/
    
    [API getCategories:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        
        controller.correctAns = self.correctAns;
        controller.answer1text = self.answer1text;
        controller.answer2text = self.answer2text;
        controller.answer3text = self.answer3text;
        controller.answer4text = self.answer4text;
        controller.questiontext = self.questiontext;
        
        NSLog(@"nc %@",self.navigationController);
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *object = self.categories[indexPath.row];
    cell.textLabel.text = object;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 0) {
        //get categorical question
    }else [API getRandomQuestion:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
