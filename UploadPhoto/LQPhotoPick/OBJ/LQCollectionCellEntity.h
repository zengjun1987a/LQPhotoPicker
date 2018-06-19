//
//  LQCollectionCellEntity.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/14.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <photos/photos.h>


@interface LQCollectionCellEntity : NSObject

///
@property (nonatomic, strong) PHAsset *asset;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BOOL isCheck;


@end
