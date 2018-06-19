//
//  LQPhotoCollectionViewCell.m
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import "LQPhotoCollectionViewCell.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define SCALE [UIScreen mainScreen].scale

@implementation LQPhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
}

- (CGFloat)cellWidth
{
    return (WIDTH - 3 * 5) / 4;
}

- (void)initView
{
    
    if (self.cellEnity.image) {
        self.imageView.image = self.cellEnity.image;
    }
    else
    {
        __block UIImage *img = nil;
        CGSize size = CGSizeMake([self cellWidth] * SCALE , [self cellWidth] * SCALE);
        [[LQPhotoManager sharedManager] requestImageForAsset:self.cellEnity.asset size:size resizeMode:PHImageRequestOptionsResizeModeExact completion:^(UIImage *image, NSDictionary *info) {
            img = image;
        }];
        self.cellEnity.image = img;
        self.imageView.image = self.cellEnity.image;

    }

    
    if (self.cellEnity.isCheck) {
        self.check_imageView.image = [UIImage imageNamed:@"photo_bg_1"];
        self.maskView.hidden = NO;
    }
    else{
        self.check_imageView.image = [UIImage imageNamed:@"photo_bg"];
        self.maskView.hidden = YES;
    }
}

- (void)setCellEnity:(LQCollectionCellEntity *)cellEnity{
    _cellEnity = cellEnity;
    
    [self initView];
}

- (void)setIsCheck:(BOOL)isCheck
{
    _isCheck = isCheck;
    
    self.cellEnity.isCheck = _isCheck;
    if (_isCheck) {
        self.check_imageView.image = [UIImage imageNamed:@"photo_bg_1"];
        self.maskView.hidden = NO;

    }
    else{
        self.check_imageView.image = [UIImage imageNamed:@"photo_bg"];
        self.maskView.hidden = YES;
    }
}

@end
