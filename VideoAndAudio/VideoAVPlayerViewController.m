//
//  VdieoAVPlayerViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "VideoAVPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface VideoAVPlayerViewController ()
@property(strong,nonatomic)AVPlayer *player;
//@property(strong,nonatomic)AVPlayerItem *currentPlayerItem;
@property(strong,nonatomic)AVPlayerLayer *avLayer;
@end

@implementation VideoAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"视频播放";
    self.view.backgroundColor=[UIColor whiteColor];
    [self initPlayer];
    // Do any additional setup after loading the view.
}

-(void)initPlayer
{
    //本地视频路径
    //NSString *path=[[NSBundle mainBundle]pathForResource:@"videoA" ofType:@"mp4"];
    //NSURL *pathUrl=[NSURL fileURLWithPath:path];
    //网络url路径
    NSURL *webUrl=[NSURL URLWithString:UrlB];
    AVPlayerItem *itemA =[[AVPlayerItem alloc]initWithURL:webUrl];
    
    self.player=[[AVPlayer alloc]initWithPlayerItem:itemA];
    
    self.avLayer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    self.avLayer.videoGravity=AVLayerVideoGravityResizeAspect; //属性
    self.avLayer.frame=CGRectMake(0, 0, ScreenWidth,200);
    [self.view.layer addSublayer:self.avLayer];
    [self.player play];
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
