//
//  LQPhotoManager.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQPhotoGroupEntity.h"


@interface LQPhotoManager : NSObject

+ (LQPhotoManager *)sharedManager;

///得到所有相册
- (NSArray <LQPhotoGroupEntity *> *)getPhotoAlbums;

- (NSArray<PHAsset *> *)getAllAssetInPhotoAblumWithAscending:(BOOL)ascending;

- (NSArray<PHAsset *> *)getAssetsInAssetCollection:(PHAssetCollection *)assetCollection ascending:(BOOL)ascending;

///请求小图，缩略图
- (void)requestImageForAsset:(PHAsset *)asset size:(CGSize)size resizeMode:(PHImageRequestOptionsResizeMode)resizeMode completion:(void (^)(UIImage *image, NSDictionary *info))completion;

///请求大图，
- (void)requestImageForAsset:(PHAsset *)asset resizeMode:(PHImageRequestOptionsResizeMode)resizeMode completion:(void (^)(UIImage *image))completion;

- (BOOL)judgeAssetisInLocalAblum:(PHAsset *)asset ;

///保存在相册册中
- (void)saveImageToAblum:(UIImage *)image completion:(void (^)(BOOL success, PHAsset *asset))completion;
@end
