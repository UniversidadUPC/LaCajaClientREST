//
//  MainViewController.h
//  Navigation
//
//  Created by Oscar Vicente González Greco on 21/7/13.
//  Copyright (c) 2013 Codehero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

- (IBAction)goToNextView:(UIButton *)sender;
@property (nonatomic, strong) IBOutlet UILabel *ingError;
@property (nonatomic, strong) IBOutlet UITextField *ingUsu;
@property (nonatomic, strong) IBOutlet UITextField *ingPsw;

@end
