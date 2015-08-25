//
//  ViewController.m
//  TestExpandingContentView
//
//  Created by Castro, Gonzalo on 7/10/15.
//  Copyright (c) 2015 Castro, Gonzalo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *expanderViewAHeightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *expanderViewBHeightConstraint;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self adjustContentSizeToContentView];
}

- (void)adjustContentSizeToContentView
{
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (IBAction)buttonAAction:(id)sender
{
    CGPoint offset = self.scrollView.contentOffset;

    BOOL isOpen = (self.expanderViewAHeightConstraint.constant > 2.0);
    self.expanderViewAHeightConstraint.constant = isOpen ? 2.0 : 100.0;

    [UIView animateWithDuration:0.25f
                          delay:0.0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         [self.scrollView layoutIfNeeded];
                         self.scrollView.contentOffset = offset;
                         [self adjustContentSizeToContentView];
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (IBAction)buttonBAction:(id)sender
{
    CGPoint offset = self.scrollView.contentOffset;

    BOOL isOpen = (self.expanderViewBHeightConstraint.constant > 2.0);
    self.expanderViewBHeightConstraint.constant = isOpen ? 2.0 : 100.0;

    [UIView animateWithDuration:0.25f
                          delay:0.0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         [self.scrollView layoutIfNeeded];
                         self.scrollView.contentOffset = offset;
                         [self adjustContentSizeToContentView];
                     }
                     completion:^(BOOL finished) {
                     }];
}

@end