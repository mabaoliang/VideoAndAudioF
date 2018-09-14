//
//  RecordingViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RecordingViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface RecordingViewController ()
@property(strong,nonatomic)AVAudioSession *session; //
@property(strong,nonatomic)AVAudioRecorder *recorder;
@property(strong,nonatomic)AVAudioPlayer *player;
@property(strong,nonatomic)NSURL *pathUrl;
@property(strong,nonatomic)UIButton *btnA;
@property(strong,nonatomic)UIButton *btnB;
@property(strong,nonatomic)UIButton *btnC;
@end

@implementation RecordingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"录音";
    self.view.backgroundColor=[UIColor whiteColor];
    [self initUI];
    [self initWay];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initUI{
    
    self.btnA=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.btnA setTitle:@"开始录音" forState:UIControlStateNormal];
    self.btnA.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.btnA];
    [self.btnA addTarget:self action:@selector(Away:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnA.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *AcenterY=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:20];
    
    NSLayoutConstraint *Aleft=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:20];
    
    NSLayoutConstraint *Awidth=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(kNilOptions) multiplier:1.0 constant:80];
    
    NSLayoutConstraint *Aheight=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil   attribute:(kNilOptions) multiplier:1.0 constant:30];
    [self.view addConstraints:@[AcenterY,Aleft]];
    [self.btnA addConstraints:@[Awidth,Aheight]];
    
    
    
    
    self.btnB=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.btnB setTitle:@"结束录音" forState:UIControlStateNormal];
    self.btnB.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.btnB];
    [self.btnB addTarget:self action:@selector(Bway:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnB.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *BcenterY=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:20];
    
    NSLayoutConstraint *Bleft=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *Bwidth=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(kNilOptions) multiplier:1.0 constant:80];
    
    NSLayoutConstraint *Bheight=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil   attribute:(kNilOptions) multiplier:1.0 constant:30];
    [self.view addConstraints:@[BcenterY,Bleft]];
    [self.btnB addConstraints:@[Bwidth,Bheight]];
    
    self.btnC=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.btnC setTitle:@"播放录音" forState:UIControlStateNormal];
    self.btnC.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.btnC];
    [self.btnC addTarget:self action:@selector(Cway:) forControlEvents:UIControlEventTouchUpInside];
    self.btnC.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *CcenterY=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:20];
    
    NSLayoutConstraint *Cleft=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:-20];
    
    NSLayoutConstraint *Cwidth=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(kNilOptions) multiplier:1.0 constant:80];
    
    NSLayoutConstraint *Cheight=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil   attribute:(kNilOptions) multiplier:1.0 constant:30];
    [self.view addConstraints:@[CcenterY,Cleft]];
    [self.btnC addConstraints:@[Cwidth,Cheight]];
    
    
    
}



-(void)initWay
{
    
    //创建录音文件存放路径
    NSString *path=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject ;
    path=[path stringByAppendingPathComponent:@"test.wav"];
    self.pathUrl=[NSURL  fileURLWithPath:path];
    //管理对音频硬件设备（麦克风，扬声器)的资源使用
    self.session=[AVAudioSession sharedInstance];
    [self.session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil]; //支持播放支持录音
    [self.session setActive:YES error:nil]; //开启
    //设置参数
    NSDictionary *recordSetting = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   //采样率  8000/11025/22050/44100/96000（影响音频的质量）
                                   [NSNumber numberWithFloat: 8000.0],AVSampleRateKey,
                                   // 音频格式
                                   [NSNumber numberWithInt: kAudioFormatLinearPCM],AVFormatIDKey,
                                   //采样位数  8、16、24、32 默认为16
                                   [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                                   // 音频通道数 1 或 2
                                   [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                   //录音质量
                                   [NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey,
                                   nil];
    self.recorder=[[AVAudioRecorder alloc]initWithURL:self.pathUrl settings:recordSetting error:nil];
    [self.recorder prepareToRecord]; //录音准备
    
    
}

/**开始录音*/
-(void)Away:(UIButton *)sender
{
   
    [self.recorder record];
}

/**结束录音*/
-(void)Bway:(UIButton *)sender
{
    if ([self.recorder isRecording]) {
        [self.recorder stop];
    }
    
}
/**播放录音*/
-(void)Cway:(UIButton *)sender
{
    [self.recorder stop];
    
    self.player=[[AVAudioPlayer alloc]initWithContentsOfURL:self.pathUrl error:nil];
    [self.session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [self.player prepareToPlay];
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
