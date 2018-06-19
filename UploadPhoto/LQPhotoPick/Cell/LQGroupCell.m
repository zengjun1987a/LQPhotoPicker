//
//  LQGroupCell.m
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import "LQGroupCell.h"
#import "LQPhotoManager.h"
#define SCALE [UIScreen mainScreen].scale


@implementation LQGroupCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setGroup:(LQPhotoGroupEntity *)group{
    _group = group;
    
    self.groupNameLabel.text = group.albumName;
    self.groupPicCountLabel.text = [NSString stringWithFormat:@"(%ld)",(long)group.albumImageCount];
    
    __block UIImage *img = nil;
    [[LQPhotoManager sharedManager] requestImageForAsset:group.firstImageAsset size:CGSizeMake(70 * SCALE, 70 * SCALE) resizeMode:PHImageRequestOptionsResizeModeExact completion:^(UIImage *image, NSDictionary *info) {
        img = image;
    }];
    self.groupImageView.image = img;
    self.groupImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.groupImageView.clipsToBounds = YES;
}

+ (instancetype) instanceCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
