//
//  ReCordSPBViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ReCordSPBViewController.h"
#import <AVFoundation/AVFoundation.h>

#import <AssetsLibrary/AssetsLibrary.h>

@interface ReCordSPBViewController ()<AVCaptureFileOutputRecordingDelegate>

//会话 负责输入和输出设备之间的数据传递
@property(strong,nonatomic)AVCaptureSession *session;
//设备
@property(strong,nonatomic)AVCaptureDevice *device;
//视频输入流
@property(strong,nonatomic)AVCaptureDeviceInput *deviceInput;
//视频输出流
@property(strong,nonatomic)AVCaptureMovieFileOutput *fileOut;
//相机拍摄预览图层
@property(strong,nonatomic)AVCaptureVideoPreviewLayer *preViewLayer;

@end

@implementation ReCordSPBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initW];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
   
}

-(void)viewWillDisappear:(BOOL)animated
{
    if (self.session==nil) {
        [self.session stopRunning];
        [self.fileOut stopRecording];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if (self.session==nil) {
        return;
    }
    
    if ([self.session isRunning])
    {
        [self.session stopRunning];
        [self.fileOut stopRecording];
        
    }else
    {
        [self.session startRunning];
        [self fileOutStart];
    }
   
}

-(void)initW{
    
    //初始化一个会话
    
    if (![UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        return;
    }
    self.session=[[AVCaptureSession alloc]init]; //用于输入输出之间的对话
    self.session.sessionPreset=AVCaptureSessionPresetHigh; //设置分辨率
    //创建视频设备
    self.device=[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //根据设备创建输入信号
    self.deviceInput=[AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    //添加输出设备
    self.fileOut=[[AVCaptureMovieFileOutput alloc]init];
    [self.session beginConfiguration]; //开始重设
    //session 添加设备输入信号
    if ([self.session canAddInput:self.deviceInput]) {
        [self.session addInput:self.deviceInput];
    }
    //添加设备输出信号
    if ([self.session canAddOutput:self.fileOut]) {
        
        [self.session addOutput:self.fileOut];
    }
    [self.session commitConfiguration]; //提交重设
    
    //创建视频预览图层
    self.preViewLayer=[[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    self.preViewLayer.frame=CGRectMake(0, 0, ScreenWidth, 200);
    self.preViewLayer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.preViewLayer];
    
   
}

/**输出流*/
-(void)fileOutStart
{
 NSString *path=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
 path=[path stringByAppendingPathComponent:@"movie.mp4"];

 [self.fileOut startRecordingToOutputFileURL:[NSURL fileURLWithPath:path] recordingDelegate:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)captureOutput:(AVCaptureFileOutput *)output didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray<AVCaptureConnection *> *)connections error:(NSError *)error
{
    NSLog(@"%@",outputFileURL);
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
