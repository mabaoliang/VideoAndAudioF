//
//  VideoMPMoviewPlayerViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "VideoMPMoviewPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoMPMoviewPlayerViewController ()

@end

@implementation VideoMPMoviewPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"视频播放";
     self.view.backgroundColor=[UIColor whiteColor];
    [self initPlayer];
    // Do any additional setup after loading the view.
}

-(void)initPlayer
{
    //本地视频
  //  NSString* localFilePath=[[NSBundle mainBundle]pathForResource:@"videoA" ofType:@"mp4"];
   // NSURL *localVideoUrl = [NSURL fileURLWithPath:localFilePath];
    //在线视频
    NSURL *webVideoUrl = [NSURL URLWithString:UrlA];
    
    //第二步:创建视频播放器
    MPMoviePlayerViewController *playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:webVideoUrl];
    
    //第三步:设置播放器属性
    //通过moviePlayer属性设置播放器属性(与MPMoviePlayerController类似)
    playerViewController.moviePlayer.scalingMode = MPMovieScalingModeFill;
    
    //第四步:跳转视频播放界面
    [self presentViewController:playerViewController animated:YES completion:nil];
    
}


@end
