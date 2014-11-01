//
//  PictureModelViewController.m
//  Flcker
//
//  Created by Vadim Raitses on 10/31/14.
//  Copyright (c) 2014 Vadim Raitses. All rights reserved.
//

#import "PictureModelViewController.h"
#import "UIImageView+AFNetworking.h"
static NSString* staticflickr = @"staticflickr.com";

@interface PictureModelViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property NSString* URI;

@property NSString* farm;
@property NSString* id;
@property NSString* server;
@property NSString* secret;
@property NSMutableArray *viewed;
@property NSMutableArray *current;



@end

@implementation PictureModelViewController

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
    [self.imageView setUserInteractionEnabled:YES];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    // Adding the swipe gesture on image view
    [self.imageView addGestureRecognizer:swipeLeft];
    [self.imageView addGestureRecognizer:swipeRight];
    if(self.viewed==NULL){
        self.viewed = [[NSMutableArray alloc] init];
    }
    if(self.current==NULL){
        self.current = [[NSMutableArray alloc] init];
    }

    [super viewDidLoad];
    
     NSLog(@"output=%@",[self picsDictionary]);
    NSDictionary *photos = [_picsDictionary objectForKey:@"photos"];
    photos =[photos objectForKey:@"photo"];
    
    for (NSDictionary *element in  photos) {
        [self.current addObject:element];
    }
    
    NSDictionary *a = self.current[0];
    [self.current removeObjectAtIndex:0];
    [self PerformPicture:a];

    

    // Do any additional setup after loading the view.
}

-(void)PerformPicture:(NSDictionary*) element{
    
//    _URI = [NSString stringWithFormat:@"https://www.flickr.com/photos/%@/%@_m.jpeg"
//            ,[element objectForKey:@"owner"]
//            ,[element objectForKey:@"id"]];
 
    _URI = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_m.jpg",[element objectForKey:@"farm"]
                                  ,[element objectForKey:@"server"]
                                  ,[element objectForKey:@"id"]
                                  ,[element objectForKey:@"secret"]];

//self.URI =    @"https://farm3.staticflickr.com/2285/3527828062_8235c39550.jpg";
    NSURL *url = [NSURL URLWithString:_URI];
    NSLog(@"URL is %@",self.URI);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    
    [self.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       self.imageView.image = image;
                                       [self.imageView setNeedsLayout];
                                       
                                   } failure:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)Swipe:(id)sender{

}


- (IBAction)actio:(id)sender {
    NSLog(@"Swipe");
    NSLog(@"Swipe");
    
    
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Left Swipe");
        NSDictionary *a = self.viewed[0];
        [self.viewed removeObjectAtIndex:0];
        [self.current addObject:a];
        [self PerformPicture:a];
    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Right Swipe");
        NSLog(@"Left Swipe");
        NSDictionary *a = self.current[0];
        [self.current removeObjectAtIndex:0];
        [self.viewed addObject:a];
        [self PerformPicture:a];
    }
    
}
/*
#prag	ma mark - Navigation
 farm = 3;
 id = 3527828062;
 isfamily = 0;
 isfriend = 0;
 ispublic = 1;
 owner = "75392327@N00";
 secret = 8235c39550;
 server = 2285;
 title = "";

 https://farm1.staticflickr.com/2/1418878_1e92283336_m.jpg
 https://farm3.staticflickr.com/2285/3527828062_8235c39550.jpg
 
 https://farm1.staticflickr.com/2/1418878_1e92283336_m.jpg
 
 farm-id: 1
 server-id: 2
 photo-id: 1418878
 secret: 1e92283336
 size: m
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
