//
//  TableModelViewController.m
//  Flcker
//
//  Created by Vadim Raitses on 10/30/14.
//  Copyright (c) 2014 Vadim Raitses. All rights reserved.
//

#import "TableModelViewController.h"

@implementation TableModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   //  NSLog(@"output=%@",[self picsDictionary]);
    // Do any additional setup after loading the view.
    
    //self.title = self.place.name;
    //self.slogen.text = self.place.slogan;
    //self.textView.text = self.place.placeDescription;
//    self.title = self.name;
//    self.slogen.text = self.slogan;
//    self.textView.text = self.placeDescription;
//    
//    //NSURL *url = [NSURL URLWithString:self.place.imageFileName];
//    NSURL *url = [NSURL URLWithString:self.imageUrl];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
//    
//    [self.imageView setImageWithURLRequest:request
//                          placeholderImage:placeholderImage
//                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//                                       
//                                       self.imageView.image = image;
//                                       [self.imageView setNeedsLayout];
//                                       
//                                   } failure:nil];
//    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
