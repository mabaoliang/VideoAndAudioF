//
//  VideoAVPlayerTViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "VideoAVPlayerTViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface VideoAVPlayerTViewController ()

@end

@implementation VideoAVPlayerTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"视频播放";
    [self initPlayer];
    // Do any additional setup after loading the view.
}

-(void)initPlayer
{
    //获取视频路径
    NSURL *webVideoUrl = [NSURL URLWithString:UrlC];
    //创建AVPlayer
    AVPlayer *avPlayer = [[AVPlayer alloc] initWithURL:webVideoUrl];
    //使用AVPlayer创建AVPlayerViewController，并跳转播放界面
    AVPlayerViewController *avPlayerVC =[[AVPlayerViewController alloc] init];
    avPlayerVC.player = avPlayer;
    [self presentViewController:avPlayerVC animated:YES completion:nil];
    
}


-(void)initPlayerT
{
    //获取视频路径
    NSURL *webVideoUrl = [NSURL URLWithString:UrlB];
    //创建AVPlayer
    AVPlayer *avPlayer = [[AVPlayer alloc] initWithURL:webVideoUrl];
    //使用AVPlayer创建AVPlayerViewController，并跳转播放界面
    AVPlayerViewController *avPlayerVC =[[AVPlayerViewController alloc] init];
    avPlayerVC.player = avPlayer;
    //：设置播放器视图大小
    avPlayerVC.view.frame = CGRectMake(25, 0, 320, 300);
    //特别注意:AVPlayerViewController不能作为局部变量被释放，否则无法播放成功
    //解决1.AVPlayerViewController作为属性
    //解决2:使用addChildViewController，AVPlayerViewController作为子视图控制器
    [self addChildViewController:avPlayerVC];
    [self.view addSubview:avPlayerVC.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
