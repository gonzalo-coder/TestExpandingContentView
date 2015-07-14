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
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *magicExpanderViewHeightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *moreMagicExpanderViewHeightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewHeightConstraint;

- (IBAction)magicAction:(id)sender;
- (IBAction)moreMagicAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

- (void)viewDidLayoutSubviews
{
    self.scrollView.contentSize = self.contentView.frame.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)adjustContentSizeToContentView
{
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (IBAction)magicAction:(id)sender
{
    BOOL isOpen = (self.magicExpanderViewHeightConstraint.constant > 2.0);
    
    [UIView animateWithDuration:0.25f
                          delay:0.0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.magicExpanderViewHeightConstraint.constant = isOpen ? 2.0 : 100.0;
                         self.contentViewHeightConstraint.constant += isOpen ? -100 : 100.0;
                         [self.contentView layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self adjustContentSizeToContentView];
                     }];
}

- (IBAction)moreMagicAction:(id)sender
{
    BOOL isOpen = (self.moreMagicExpanderViewHeightConstraint.constant > 2.0);

    [UIView animateWithDuration:0.25f
                          delay:0.0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.moreMagicExpanderViewHeightConstraint.constant = isOpen ? 2.0 : 100.0;
                         self.contentViewHeightConstraint.constant += isOpen ? -100 : 100.0;
                         [self.contentView layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self adjustContentSizeToContentView];
                     }];
}

@end
