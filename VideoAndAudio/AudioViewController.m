//
//  AudioViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AudioViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface AudioViewController ()

@property(strong,nonatomic)AVAudioPlayer *audioPlayer;
@property(strong,nonatomic)NSArray *arrItem;
@property(strong,nonatomic)UIButton *btnA;
@property(strong,nonatomic)UIButton *btnB;
@property(strong,nonatomic)UIButton *btnC;
@property(strong,nonatomic)UIImageView *imgView;
@property(assign,nonatomic)NSInteger num ;
@end

@implementation AudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"音乐播放";
    self.view.backgroundColor=[UIColor whiteColor];
    self.num=0;
    //本地路径
    NSString *pathA=[[NSBundle mainBundle]pathForResource:@"A" ofType:@"mp3"];
    NSURL *urlA=[NSURL fileURLWithPath:pathA];
    NSString *pathB=[[NSBundle mainBundle]pathForResource:@"B" ofType:@"mp3"];
    NSURL *urlB=[NSURL fileURLWithPath:pathB];
    NSString *pathC=[[NSBundle mainBundle]pathForResource:@"C" ofType:@"mp3"];
    NSURL *urlC=[NSURL fileURLWithPath:pathC];
    self.arrItem=@[urlA,urlB,urlC];
    [self initUI];
    [self initAudio:self.arrItem[0]];
    // Do any additional setup after loading the view.
}

-(void)initAudio:(NSURL *)url{
    
  
   //网络url路径
   // NSURL *webUrl=[NSURL URLWithString:@""];
    self.audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.audioPlayer.volume=0.5; //音量
    self.audioPlayer.numberOfLoops=0; //单次播放
    [self.audioPlayer prepareToPlay]; //准备播放
    [self.audioPlayer play]; //播放
    
}

-(void)initUI{
    
    self.btnA=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.btnA setTitle:@"上一首" forState:UIControlStateNormal];
    self.btnA.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.btnA];
    [self.btnA addTarget:self action:@selector(Away:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnA.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *AcenterY=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:20];
    
     NSLayoutConstraint *Aleft=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:20];
    
     NSLayoutConstraint *Awidth=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(kNilOptions) multiplier:1.0 constant:60];
    
     NSLayoutConstraint *Aheight=[NSLayoutConstraint constraintWithItem:self.btnA attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil   attribute:(kNilOptions) multiplier:1.0 constant:30];
    [self.view addConstraints:@[AcenterY,Aleft]];
    [self.btnA addConstraints:@[Awidth,Aheight]];
   
    
    
    
    self.btnB=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.btnB setTitle:@"开始" forState:UIControlStateNormal];
    self.btnB.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.btnB];
    [self.btnB addTarget:self action:@selector(Bway:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnB.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *BcenterY=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:20];
    
    NSLayoutConstraint *Bleft=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *Bwidth=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(kNilOptions) multiplier:1.0 constant:50];
    
    NSLayoutConstraint *Bheight=[NSLayoutConstraint constraintWithItem:self.btnB attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil   attribute:(kNilOptions) multiplier:1.0 constant:30];
    [self.view addConstraints:@[BcenterY,Bleft]];
    [self.btnB addConstraints:@[Bwidth,Bheight]];
    
    self.btnC=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.btnC setTitle:@"下一首" forState:UIControlStateNormal];
    self.btnC.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.btnC];
    [self.btnC addTarget:self action:@selector(Cway:) forControlEvents:UIControlEventTouchUpInside];
    self.btnC.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *CcenterY=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:20];
    
    NSLayoutConstraint *Cleft=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:-20];
    
    NSLayoutConstraint *Cwidth=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(kNilOptions) multiplier:1.0 constant:60];
    
    NSLayoutConstraint *Cheight=[NSLayoutConstraint constraintWithItem:self.btnC attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil   attribute:(kNilOptions) multiplier:1.0 constant:30];
    [self.view addConstraints:@[CcenterY,Cleft]];
    [self.btnC addConstraints:@[Cwidth,Cheight]];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**上一首*/
-(void)Away:(UIButton *)sender
{
   [self.btnB setTitle:@"开始" forState:UIControlStateNormal];
    if (self.num>0) {
        
        self.num-=1;
        [self initAudio:self.arrItem[self.num]];
        
    }
    
}

/***/
-(void)Bway:(UIButton *)sender
{
    if ([self.audioPlayer isPlaying])
    {
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [self.audioPlayer pause];
    }else
    {
        [sender setTitle:@"开始" forState:UIControlStateNormal];
        [self.audioPlayer play];
    }
    
}
/**下一首*/
-(void)Cway:(UIButton *)sender
{
     [self.btnB setTitle:@"开始" forState:UIControlStateNormal];
    if (self.num<2)
    {
        self.num+=1;
       [self initAudio:self.arrItem[self.num]];;
    }
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
