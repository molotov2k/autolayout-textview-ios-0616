//
//  ViewController.m
//  autolayoutTextview
//
//  Created by Max Tkach on 6/27/16.
//  Copyright © 2016 Anvil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textFieldOutlet;
@property (weak, nonatomic) IBOutlet UIButton *firstButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *secondButtonOutlet;

@property (strong, nonatomic) NSLayoutConstraint *textFieldBottomConstraint;
@property (nonatomic) BOOL smallScreen;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFieldBottomConstraint = [self.textFieldOutlet.bottomAnchor constraintEqualToAnchor:self.firstButtonOutlet.topAnchor constant:0];
    self.smallScreen = true;
    
    if (self.view.bounds.size.height * self.view.bounds.size.width > 249084) {
        self.textFieldBottomConstraint.constant = -30;
        self.smallScreen = false;
    }
    
    
    // REMOVE AUTO CONSTRAINTS
    [self.view removeConstraints:self.view.constraints];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textFieldOutlet removeConstraints:self.textFieldOutlet.constraints];
    self.textFieldOutlet.translatesAutoresizingMaskIntoConstraints = NO;
    [self.firstButtonOutlet removeConstraints:self.firstButtonOutlet.constraints];
    self.firstButtonOutlet.translatesAutoresizingMaskIntoConstraints = NO;
    [self.secondButtonOutlet removeConstraints:self.secondButtonOutlet.constraints];
    self.secondButtonOutlet.translatesAutoresizingMaskIntoConstraints = NO;
    
    // SET NEW CONSTRAINTS
    [self.firstButtonOutlet.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.firstButtonOutlet.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    
    [self.secondButtonOutlet.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.secondButtonOutlet.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10].active = YES;
    
    [self.textFieldOutlet.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
    [self.textFieldOutlet.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.textFieldOutlet.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    if (self.smallScreen) {
        [self resetTextFieldBottomConstrain];
    }
    self.textFieldBottomConstraint.active = YES;

}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if (self.smallScreen) {
        [self resetTextFieldBottomConstrain];
    }
}

- (void)resetTextFieldBottomConstrain {
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
        self.textFieldBottomConstraint.constant = -20;
    } else {
        self.textFieldBottomConstraint.constant = -10;
    }
}

@end
