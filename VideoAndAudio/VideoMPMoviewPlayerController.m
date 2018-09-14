//
//  VideoViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "VideoMPMoviewPlayerController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoMPMoviewPlayerController ()

@property(strong,nonatomic)MPMoviePlayerController *playerController;
@end

@implementation VideoMPMoviewPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"视频播放";
    self.view.backgroundColor=[UIColor whiteColor];
    [self initPlayer];
    // Do any additional setup after loading the view.
}

-(void)initPlayer{
    
    //本地视频路径
   // NSString* localFilePath=[[NSBundle mainBundle]pathForResource:@"videoA" ofType:@"mp4"];
  //  NSURL *localVideoUrl = [NSURL fileURLWithPath:localFilePath];
    
    //网络视频路径
    NSURL *webVideoUrl = [NSURL URLWithString:UrlA];
    //初始化播放器
    self.playerController =[[MPMoviePlayerController alloc]initWithContentURL:webVideoUrl];
    self.playerController.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight-PCBNavBar_Height);
    [self.view addSubview:self.playerController.view];
    
    //设置控制面板风格:无，嵌入，全屏，默认
    self.playerController.controlStyle = MPMovieControlStyleDefault;
    //设置是否自动播放(默认为YES）
   // self.playerController.shouldAutoplay = NO;
    //设置播放器显示模式，类似于图片的处理，设置Fill有可能造成部分区域被裁剪
    self.playerController.scalingMode = MPMovieScalingModeAspectFit;
    //设置重复模式
    self.playerController.repeatMode = MPMovieRepeatModeOne;
    [self.playerController play];
}

//退出界面的时候，关闭播放器
-(void)dealloc
{
    [self.playerController stop];
     self.playerController=nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
