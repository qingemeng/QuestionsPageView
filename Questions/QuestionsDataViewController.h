//
//  QuestionsDataViewController.h
//  Questions
//
//  Created by Gemeng Qin on 22/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray * questions;
}
- (void)loadQuestions;


@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;


@end
