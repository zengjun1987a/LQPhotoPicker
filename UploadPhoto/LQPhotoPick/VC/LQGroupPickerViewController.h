//
//  LQGroupPickerViewController.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQPhotoManager.h"
#import "LQGroupCell.h"

@interface LQGroupPickerViewController : UIViewController

@property (nonatomic , strong) NSMutableArray *groupArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic , assign) NSInteger minCount;
@property (nonatomic , assign) NSInteger maxCount;

@end
