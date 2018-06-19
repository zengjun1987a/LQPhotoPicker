//
//  LQGroupCell.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQPhotoGroupEntity.h"

@interface LQGroupCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *groupImageView;
@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupPicCountLabel;


@property (nonatomic , strong) LQPhotoGroupEntity *group;

+ (instancetype) instanceCell;

@end
