//
//  LQPhotoCollectionViewCell.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQPhotoManager.h"
#import "LQCollectionCellEntity.h"

@interface LQPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic , strong) LQCollectionCellEntity *cellEnity;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *maskView;
@property (weak, nonatomic) IBOutlet UIImageView *check_imageView;

///选中
@property (nonatomic , assign) BOOL isCheck;
@end
