//
//  QuestionsModelController.h
//  Questions
//
//  Created by Gemeng Qin on 22/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuestionsDataViewController;

@interface QuestionsModelController : NSObject <UIPageViewControllerDataSource>

- (QuestionsDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(QuestionsDataViewController *)viewController;

@end
