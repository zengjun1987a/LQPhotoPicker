//
//  LQPickerViewController.m
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import "LQPickerViewController.h"
#import "LQPhotoLayout.h"
#import "LQCollectionCellEntity.h"

@interface LQPickerViewController ()

@end

static NSString *CellIdentifier = @"LQPhotoCollectionViewCell";

#define PICKER_TAKE_DONE @"PICKER_TAKE_DONE"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
@implementation LQPickerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}

- (NSMutableArray *)photoArray
{
    if (!_photoArray) {
        _photoArray = [NSMutableArray array];
    }
    return _photoArray;
}

- (NSMutableArray *)cheooseArray
{
    if (!_cheooseArray) {
        _cheooseArray = [NSMutableArray array];
    }
    return _cheooseArray;
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

///
- (IBAction)done:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:PICKER_TAKE_DONE object:nil userInfo:@{@"selectAssets":self.cheooseArray}];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *nib = [UINib nibWithNibName:@"LQPhotoCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:CellIdentifier];

    LQPhotoLayout *layout = [[LQPhotoLayout alloc] init];
    [self.collectionView setCollectionViewLayout:layout];

    
    self.title = self.groupEntity.albumName;
    [self setRightBarItemWith:@"取消"];

    [self getData];

}

- (void)getData
{
    NSArray *array = [[LQPhotoManager sharedManager] getAssetsInAssetCollection:self.groupEntity.assetCollection ascending:YES];
    [self.photoArray removeAllObjects];
    
    for (int i = 0; i < array.count; i++)
    {
        PHAsset *asset = [array objectAtIndex:i];
        
        LQCollectionCellEntity *entity = [[LQCollectionCellEntity alloc] init];
        entity.asset = asset;
        entity.isCheck = NO;
        
        [self.photoArray addObject:entity];
    }
    
    [self.collectionView reloadData];
     
    [self performSelector:@selector(goBottom) withObject:nil afterDelay:0.3];
}

- (void)goBottom
{
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:[self.collectionView numberOfItemsInSection:0] - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
    
}

#pragma mark - collection view data sources
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LQPhotoLayout *layout = (LQPhotoLayout *)collectionViewLayout;
    return CGSizeMake([layout cellWidth],[layout cellWidth]);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    LQPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.cellEnity = [self.photoArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.maxCount > 0 && self.cheooseArray.count >= self.maxCount) {
        return;
    }
    
    LQCollectionCellEntity *entity = self.photoArray[indexPath.row];
    PHAsset *asset = entity.asset;
    
    LQPhotoCollectionViewCell *cell = (LQPhotoCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (cell.isCheck) {
        cell.isCheck = NO;
        if ([self.cheooseArray containsObject:asset])
        {
            [self.cheooseArray removeObject:asset];
        }
    }
    else
    {
        if (![self.cheooseArray containsObject:asset])
        {
            [self.cheooseArray addObject:asset];
        }
        cell.isCheck = YES;

    }
    
    self.doneBtn.enabled = (self.cheooseArray.count > 0);
    
    if (self.doneBtn.enabled)
    {
        self.doneBtn.backgroundColor = RGBCOLOR(76, 218, 100);
    }
    else
    {
        self.doneBtn.backgroundColor = [UIColor grayColor];;
    }
    
    
    NSString *countStr = [NSString stringWithFormat:@"已选：%ld张 (最多可选%ld张)",(long)self.cheooseArray.count,(long)self.maxCount];
    if (self.maxCount <= 0)
    {
        countStr = [NSString stringWithFormat:@"已选：%ld张",(long)self.cheooseArray.count];
    }
    self.countLab.text = countStr;
    
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
