//
//  NextViewController.m
//  Navigation
//
//  Created by Oscar Vicente González Greco on 21/7/13.
//  Copyright (c) 2013 Codehero. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)consultaBenef;
{
    NSString *userCod = self.label.text;
    NSString *urlTxt = @"http://localhost:8080/LaCajaREST/resources/servicios/benef/";
    urlTxt = [urlTxt stringByAppendingString:userCod];
    urlTxt = [urlTxt stringByAppendingString:@"/"];
    
    NSURL *url = [NSURL URLWithString:urlTxt];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *benef = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:NULL];
             self.benefNom.text = [benef objectForKey:@"APENOM"];
             self.benefCod.text = [benef objectForKey:@"CODPER"];
             NSString *perCod = [benef objectForKey:@"CODPER"];
             [self consultaBoleta:perCod];
         }
     }];
}

- (void)consultaBoleta:(NSString*) perCod
{
    //perCod = self.benefCod.text;
    NSLog(@"perCod %@", perCod);
    NSString *urlTxt = @"http://localhost:8080/LaCajaREST/resources/servicios/boleta/";
    urlTxt = [urlTxt stringByAppendingString:perCod];
    urlTxt = [urlTxt stringByAppendingString:@"/"];
    
    NSURL *url = [NSURL URLWithString:urlTxt];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *boleta = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:NULL];
             
             NSNumber *ano = [boleta objectForKey:@"PERANO"];
             self.bolAno.text = [NSString stringWithFormat:@"%@",ano];
             NSNumber *mes = [boleta objectForKey:@"PERMES"];
             self.bolMes.text = [NSString stringWithFormat:@"%@",mes];
             self.bolFch.text = [boleta objectForKey:@"FECGEN"];
             self.bolPla.text = [boleta objectForKey:@"PLANA"];
             NSNumber *des = [boleta objectForKey:@"TOTDES"];
             self.bolDsc.text = [NSString stringWithFormat:@"%@",des];
             NSNumber *tot = [boleta objectForKey:@"TOTREM"];
             self.bolTot.text = [NSString stringWithFormat:@"%@",tot];
             
         }
     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_label setText:_text];
    
    [self consultaBenef];
    
    //[self consultaBoleta];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
