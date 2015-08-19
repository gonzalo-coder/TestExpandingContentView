//
//  ViewController.m
//  TestExpandingContentView
//
//  Created by Castro, Gonzalo on 7/10/15.
//  Copyright (c) 2015 Castro, Gonzalo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIButton *topButton;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *expanderViewAHeightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *expanderViewBHeightConstraint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidLayoutSubviews
{
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (void)adjustContentSizeToContentView
{
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (IBAction)buttonAAction:(id)sender
{
    BOOL isOpen = (self.expanderViewAHeightConstraint.constant > 2.0);
    
    [UIView animateWithDuration:0.25f
                          delay:0.0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.expanderViewAHeightConstraint.constant = isOpen ? 2.0 : 100.0;
                         [self.contentView layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self adjustContentSizeToContentView];
                     }];
}

- (IBAction)buttonBAction:(id)sender
{
    BOOL isOpen = (self.expanderViewBHeightConstraint.constant > 2.0);

    [UIView animateWithDuration:0.25f
                          delay:0.0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.expanderViewBHeightConstraint.constant = isOpen ? 2.0 : 100.0;
                         [self.contentView layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self adjustContentSizeToContentView];
                     }];
}

@end
