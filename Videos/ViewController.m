//
//  ViewController.m
//  Videos
//
//  Created by Luke Parham on 12/11/15.
//  Copyright © 2015 Luke Parham. All rights reserved.
//

#import "ViewController.h"
#import "Videos-Swift.h"
#import "ASVideoNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  //works!
//    VideoView *video = [[VideoView alloc] initWithVideoURL:[NSURL URLWithString:@"https://files.parsetfss.com/3f4fcf03-cd60-4d6d-974a-fbac5507534c/tfss-e1597f80-8729-4901-ba1f-233a33071d17-movie.mov"]];

  //works!
//  VideoView *video = [[VideoView alloc] initWithVideoURL:[NSURL URLWithString:@"https://files.parsetfss.com/3f4fcf03-cd60-4d6d-974a-fbac5507534c/tfss-535d3c55-cd02-47de-8c2d-741fef2e630f-IMG_0828.mp4"]];
  
  //works!
    VideoView *video = [[VideoView alloc] initWithVideoURL:[NSURL URLWithString:@"https://files.parsetfss.com/3f4fcf03-cd60-4d6d-974a-fbac5507534c/tfss-b326aa16-5261-4338-8be6-d7719ea8c0f2-movie.m4v"]];
  
  ASVideoNode *player = [[ASVideoNode alloc] initWithURL:[NSURL URLWithString:@"https://files.parsetfss.com/3f4fcf03-cd60-4d6d-974a-fbac5507534c/tfss-b326aa16-5261-4338-8be6-d7719ea8c0f2-movie.m4v"]];
  
  video.frame = CGRectMake(0, 0, 300, 300);
  player.frame = CGRectMake(0, 350, 300, 300);
  
  video.backgroundColor = [UIColor blueColor];
  player.backgroundColor = [UIColor orangeColor];
  
  [video play];
  [player play];
  
  player.gravity = ASVideoGravityResizeAspectFill;
  
  [self.view addSubview:video];
  [self.view addSubnode:player];
  
  // Do any additional setup after loading the view, typically from a nib.
}

@end
