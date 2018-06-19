//
//  LQPickerViewController.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQGroupPickerViewController.h"
#import "LQPhotoCollectionViewCell.h"
#import "LQPhotoGroupEntity.h"

@interface LQPickerViewController : UIViewController

@property (nonatomic, strong) LQPhotoGroupEntity *groupEntity;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic , strong) NSMutableArray *photoArray;

@property (nonatomic , assign) NSInteger minCount;
@property (nonatomic , assign) NSInteger maxCount;

@property (nonatomic , strong) NSMutableArray *cheooseArray;

@property (nonatomic , weak) IBOutlet UIButton *doneBtn;
@property (nonatomic , weak) IBOutlet UILabel *countLab;

@end
