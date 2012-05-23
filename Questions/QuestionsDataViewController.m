//
//  QuestionsDataViewController.m
//  Questions
//
//  Created by Gemeng Qin on 22/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionsDataViewController.h"

@interface QuestionsDataViewController ()

@end

@implementation QuestionsDataViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadQuestions];


	// Do any additional setup after loading the view, typically from a nib.
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.dataLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [questions count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString * rowContent = [questions objectAtIndex:indexPath.row];
    NSArray * questionComponents = [rowContent componentsSeparatedByString:@"?"];

    
    NSLog(@"%@",[rowContent componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString: @"\n\t "]]);
    
    CGSize theBlankSize = CGSizeMake(60, 30);
    cell.textLabel.text = [questionComponents objectAtIndex:0];
    cell.textLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:20];
    CGSize theFirstHalfSize = [ [questionComponents objectAtIndex:0] sizeWithFont:[UIFont fontWithName:@"Arial" size:24]];
    
    //second half of the question
    NSInteger basePointX = theFirstHalfSize.width;
    NSInteger i = 1;
    
    while( i < questionComponents.count && [questionComponents objectAtIndex:i]!=@"" )
    {
        //add textField
        UITextField *blank = [[UITextField alloc] initWithFrame:CGRectMake(basePointX+10,7, theBlankSize.width, theBlankSize.height)];
        blank.returnKeyType = UIReturnKeyDone;
        blank.autocapitalizationType = UITextAutocapitalizationTypeWords;
        blank.adjustsFontSizeToFitWidth = TRUE;
        blank.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:20];
        blank.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        blank.borderStyle = UITextBorderStyleRoundedRect; 
        [cell.contentView addSubview:blank];
        
        
        //add another component
        UILabel *nextComponent =  [[UILabel alloc] initWithFrame: CGRectMake(basePointX + 20 + theBlankSize.width,0, [ [questionComponents objectAtIndex:i] sizeWithFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:20]].width , cell.frame.size.height)];
        nextComponent.text = [questionComponents objectAtIndex:1];
        nextComponent.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:20];
        [cell.contentView addSubview:nextComponent];
        
        basePointX =10+ basePointX + theBlankSize.width + [ [questionComponents objectAtIndex:i] sizeWithFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:20]].width ;
        i++;
        
        
    }
    
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma loadingQuestions
- (void)loadQuestions
{
    questions = [[NSMutableArray alloc] init];
    NSString * testString = @"1 + 2 =?";
    NSString * testString2 = @"2 ×?= 4";
    NSString * testString3 = @"1 + 2 × 24 =?";

    [questions addObject:testString];
    [questions addObject:testString2];
    [questions addObject:testString3];

    
}
@end
