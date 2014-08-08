//
//  NextViewController.h
//  Navigation
//
//  Created by Oscar Vicente González Greco on 21/7/13.
//  Copyright (c) 2013 Codehero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) IBOutlet UILabel *benefCod;
@property (nonatomic, strong) IBOutlet UILabel *benefNom;

@property (nonatomic, strong) IBOutlet UILabel *bolAno;
@property (nonatomic, strong) IBOutlet UILabel *bolMes;
@property (nonatomic, strong) IBOutlet UILabel *bolFch;
@property (nonatomic, strong) IBOutlet UILabel *bolPla;
@property (nonatomic, strong) IBOutlet UILabel *bolGrado;
@property (nonatomic, strong) IBOutlet UILabel *bolDsc;
@property (nonatomic, strong) IBOutlet UILabel *bolTot;


@property (weak, nonatomic) IBOutlet UILabel *label;

@end
