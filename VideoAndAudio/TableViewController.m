//
//  TableViewController.m
//  VideoAndAudio
//
//  Created by mac on 2018/9/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TableViewController.h"
#import "VideoMPMoviewPlayerController.h"
#import "VideoMPMoviewPlayerViewController.h"
#import "VideoAVPlayerViewController.h"
#import "VideoAVPlayerTViewController.h"
#import "AudioViewController.h"
#import "RecordingViewController.h"
#import "RecordSPAViewController.h"
#import "ReCordSPBViewController.h"
@interface TableViewController ()
@property(strong,nonatomic)NSArray *arrItem;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"项目";
    self.view.backgroundColor=[UIColor whiteColor];
    self.arrItem=@[@"VideoMPMoviewPlayerController",@"VideoMPMoviewPlayerViewController",@"videoAVPlayer",@"avdieoAVPlayerViewController",@"audio",@"record",@"recordUIIamgePicker",@"recordAVCature"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrItem.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    cell.textLabel.text=self.arrItem[indexPath.row];
 
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:  //视频
        {
            VideoMPMoviewPlayerController *vc=[[VideoMPMoviewPlayerController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1: //视频
        {
            VideoMPMoviewPlayerViewController *vc=[[VideoMPMoviewPlayerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2: //视频
        {
            VideoAVPlayerViewController *vc=[[VideoAVPlayerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3: //视频
        {
            VideoAVPlayerTViewController *vc=[[VideoAVPlayerTViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4: //音频
        {
            AudioViewController *vc=[[AudioViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5: //录音
        {
            RecordingViewController *vc=[[RecordingViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6: //录频
        {
            RecordSPAViewController *vc=[[RecordSPAViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7: //录频
        {
            ReCordSPBViewController *vc=[[ReCordSPBViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
