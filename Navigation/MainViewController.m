//
//  MainViewController.m
//  Navigation
//
//  Created by Oscar Vicente González Greco on 21/7/13.
//  Copyright (c) 2013 Codehero. All rights reserved.
//

#import "NextViewController.h"

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToNextView:(UIButton *)sender {
    
    NSString *usu = self.ingUsu.text;
    NSString *psw = self.ingPsw.text;
    NSString *urlTxt = @"http://localhost:8080/LaCajaREST/resources/servicios/login/";
    urlTxt = [urlTxt stringByAppendingString:usu];
    urlTxt = [urlTxt stringByAppendingString:@"/"];
    urlTxt = [urlTxt stringByAppendingString:psw];
    
    NSLog(@"url: %@",urlTxt);
    
    NSURL *url = [NSURL URLWithString:urlTxt];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSString *resultado =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"resultado: %@",resultado);
             if ([resultado  isEqual: @"OK"]){
                 self.ingError.text = resultado;
    
    
    
    
    NextViewController *nextView = [[NextViewController alloc] initWithNibName:nil
                                                                        bundle:nil];
    
    [nextView setText:usu];
    
    [self.navigationController pushViewController:nextView
                                         animated:YES];
                 
                 
                 
             }else{
                 
                 self.ingError.text = resultado;
             }
         }
     }];
    
                 
                 
}

- (void)validaIngreso;
{
    NSString *usu = self.ingUsu.text;
    NSString *psw = self.ingPsw.text;
    NSString *urlTxt = @"http://localhost:8080/LaCajaREST/resources/servicios/login/";
    urlTxt = [urlTxt stringByAppendingString:usu];
    urlTxt = [urlTxt stringByAppendingString:@"/"];
    urlTxt = [urlTxt stringByAppendingString:psw];
    
    NSLog(@"url: %@",urlTxt);
    
    NSURL *url = [NSURL URLWithString:urlTxt];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSString *resultado =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"resultado: %@",resultado);
             if ([resultado  isEqual: @"OK"]){
                 self.ingError.text = resultado;
                 
             }else{
                 
                 self.ingError.text = resultado;
             }
         }
     }];
}
@end
