//
//  OpeningScreenModelViewController.m
//  Flcker
//
//  Created by Vadim Raitses on 10/31/14.
//  Copyright (c) 2014 Vadim Raitses. All rights reserved.
//

#import "OpeningScreenModelViewController.h"
#import "PictureModelViewController.h"

@interface OpeningScreenModelViewController ()
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UITextField *tagField;
@property NSString* request;

@end

@implementation OpeningScreenModelViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (IBAction)GoButton:(id)sender {
    
    
_request=[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=%@&tag_mode=all&api_key=7679aeae565f727964c1a17c23fdb8d3", self.tagField.text];
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
    PictureModelViewController *vc = 	[segue destinationViewController];
    if([segue.identifier isEqualToString:@"seg"]){
        vc.picsDictionary  = [self executeFlickrFetch:_request];
    }
    
}

-(NSDictionary *)executeFlickrFetch:(NSString *)query
{
    query = [NSString stringWithFormat:@"%@&format=json&nojsoncallback=1", query];
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error] : nil;
    return results;
}

@end
