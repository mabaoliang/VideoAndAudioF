//
//  RecordTheFreQuenCyViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RecordSPAViewController.h"
#import <Photos/Photos.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface RecordSPAViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(strong,nonatomic)UIButton *btnA;
@property(strong,nonatomic)UIButton *btnB;
@property(strong,nonatomic)UIButton *btnC;
@end

@implementation RecordSPAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}

-(void)initUI{
    
    self.btnA=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.btnA setTitle:@"开始录频" forState:UIControlStateNormal];
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
    [self.btnB setTitle:@"相机拍照" forState:UIControlStateNormal];
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
    [self.btnC setTitle:@"播放视频" forState:UIControlStateNormal];
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



/**开始录频*/
-(void)Away:(UIButton *)sender
{
    
    if (![UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        //该设备不支持拍照
        return;
    }
    
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.sourceType=UIImagePickerControllerSourceTypeCamera; //拾取源类型照片的来源  摄像头
    picker.mediaTypes=[[NSArray alloc]initWithObjects:(NSString *)kUTTypeMovie, nil];//媒体类型
    picker.videoMaximumDuration=60.0; //视频录制的最大时长
    picker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModeVideo; //相机的模式 拍照/摄像
    picker.videoQuality=UIImagePickerControllerQualityTypeHigh; //视频质量
   // picker.cameraFlashMode=UIImagePickerControllerCameraFlashModeAuto; //闪光灯自动
    picker.delegate=self;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

/*拍摄照片*/
-(void)Bway:(UIButton *)sender
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //判断相机是否可用
        return;
    }
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.sourceType=UIImagePickerControllerSourceTypeCamera; //照片的来源 摄像头
    picker.mediaTypes=[[NSArray  alloc] initWithObjects:(NSString *)kUTTypeImage, nil];//媒体类型
    picker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModePhoto; //相机的模式 摄像
    picker.allowsEditing=YES; //允许简单编辑图片
    picker.delegate=self;
    [self presentViewController:picker animated:YES completion:nil];
    
}
/**播放视频*/
-(void)Cway:(UIButton *)sender
{
    
}
/**UIImagePickerController代理 获取到媒体资源*/
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *mediaType=info[UIImagePickerControllerMediaType]; //媒体类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image=nil;
        if ([picker allowsEditing]) {
            image=info[UIImagePickerControllerEditedImage]; //获取编辑后的照片
        }else
        {
            image=info[UIImagePickerControllerOriginalImage]; //获取原始照片
        }
        
        if (picker.sourceType==UIImagePickerControllerSourceTypeCamera) {
            NSData* imageData =  UIImageJPEGRepresentation(image, 0.1);
            UIImage* newImage = [UIImage imageWithData:imageData];
            UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil); //保存到相册
        }
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        NSURL *videoUrl=info[UIImagePickerControllerMediaURL] ;// 视频路径
        //UIImage *image=[self get_videoThumbImage:videoUrl] ;//
        if (picker.sourceType==UIImagePickerControllerSourceTypeCamera) {
            
            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([videoUrl path])) {
                UISaveVideoAtPathToSavedPhotosAlbum([videoUrl path], self, @selector(video:didFinishSavingWithError:contextInfo:), nil); //保存视频到相簿
            }
        }
    }else
    {
        
    }
}
/**用户取消操作*/
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    手动销毁界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//图片保存到相册之后的回调
- (void) image:(UIImage *)image didFinishSavingWithError:(NSError *) error contextInfo:(void *) contextInfo{
    
    
    NSLog(@"呵呵哒");
    
}
//视频保存到相册之后的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        // 保存失败
    }else {
        // 处理视频
        
    }
}

/**
 获取视频时长
 */
- (CGFloat)get_videoTotalWith:(NSURL *)videoURL
{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:videoURL options:opts];
    float second = 0;
    second = urlAsset.duration.value/urlAsset.duration.timescale;
    return second;
}

/**
 获取视频缩略图
 */
- (UIImage *)get_videoThumbImage:(NSURL *)videoURL
{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:videoURL options:opts];
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    generator.appliesPreferredTrackTransform = YES;
    CMTime actualTime;
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(0, 600) actualTime:&actualTime error:&error];
    if (error) {
        return nil;
    }
    return [UIImage imageWithCGImage:img];
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
