//
//  LQPhotoGroupEntity.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <photos/photos.h>

@interface LQPhotoGroupEntity : NSObject

///相册名字
@property (nonatomic, copy) NSString *albumName;
///该相册内相片数量
@property (nonatomic, assign) NSUInteger albumImageCount;
///相册第一张图片缩略图
@property (nonatomic, strong) PHAsset *firstImageAsset;
///相册集，通过该属性获取该相册集下所有照片
@property (nonatomic, strong) PHAssetCollection *assetCollection;
@end
