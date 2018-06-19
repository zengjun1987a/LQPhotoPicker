//
//  LQGroupPickerViewController.m
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import "LQGroupPickerViewController.h"
#import "LQPickerViewController.h"

@interface LQGroupPickerViewController ()

@end

@implementation LQGroupPickerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    return self;
}

- (NSMutableArray *)groupArray
{
    if (!_groupArray) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}

- (void)rightBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)setRightBarItemWith:(NSString *)title
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"相册选择";
    
    [self getGroup];
    [self setRightBarItemWith:@"关闭"];
}

- (void)getGroup
{
    NSArray *array = [[LQPhotoManager sharedManager] getPhotoAlbums];
    
    [self.groupArray removeAllObjects];
    [self.groupArray addObjectsFromArray:array];
    
    [self.tableView reloadData];
    
    [self goCameraRoll];
}

///默认跳转相机胶卷
- (void)goCameraRoll
{
    LQPhotoGroupEntity *theEntity = nil;
    for (int i = 0; i < self.groupArray.count; i++) {
        LQPhotoGroupEntity *entity = self.groupArray[i];
        if ([entity.albumName isEqualToString:@"Camera Roll"] || [entity.albumName isEqualToString:@"相机胶卷"])
        {
            theEntity = entity;
            break;
        }

    }
    if (theEntity) {
        [self goLQPickVC:theEntity animated:NO];
    }
    
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.groupArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LQGroupCell *cell = [LQGroupCell instanceCell];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.group = self.groupArray[indexPath.row];
    
    return cell;
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LQPhotoGroupEntity *entity = self.groupArray[indexPath.row];
    [self goLQPickVC:entity animated:YES];
  
}

- (void)goLQPickVC:(LQPhotoGroupEntity *)entity animated:(BOOL)animated
{
    LQPickerViewController *vc = [[LQPickerViewController alloc] initWithNibName:@"LQPickerViewController" bundle:nil];
    vc.groupEntity = entity;
    vc.maxCount = self.maxCount;
    vc.minCount = self.minCount;
    [self.navigationController pushViewController:vc animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
