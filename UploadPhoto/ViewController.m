//
//  ViewController.m
//  UploadPhoto
//
//  Created by zengjun on 2018/6/12.
//  Copyright © 2018年 jun. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>

@interface ViewController ()

@end

#define CollectionName  @"新建相册-uploadPhoto"

@implementation ViewController


- (IBAction)clickBtn:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择照片来源" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = NO;
            picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:^{
            }];
        }
    }];
    UIAlertAction *photosAction = [UIAlertAction actionWithTitle:@"相册(多选)" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        
        LQPickVC *vc = [[LQPickVC alloc] init];
        vc.maxCount = 6;
        vc.callBackBlock = ^(NSArray *assets) {
            NSLog(@"%@",assets);
        };
        [self presentViewController:vc animated:YES completion:nil];

    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        
    }];
    [alertController addAction:cameraAction];
    [alertController addAction:photosAction];
    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
        [[LQPhotoManager sharedManager] saveImageToAblum:image completion:^(BOOL success, PHAsset *asset) {
            NSLog(@"%@",asset);
        }];
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
