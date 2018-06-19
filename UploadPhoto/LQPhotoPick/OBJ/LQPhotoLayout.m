//
//  LQPhotoLayout.m
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import "LQPhotoLayout.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width


@implementation LQPhotoLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.countOfRow = ceilf([self.collectionView numberOfItemsInSection:0] / 4.0);
}

- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    NSInteger currentRow = indexPath.item / 4;
    
    CGRect frame = CGRectMake( (indexPath.item % 4) * ([self cellWidth] + 5),currentRow * ([self cellWidth] + 5), [self cellWidth], [self cellWidth]);
    attris.frame = frame;
    attris.zIndex = 1;
    
    return attris;
}

// 该方法的返回值控制UICollectionViewLayoutAttributes集合依次控制
// 指定CGRect范围内各单元格的大小和位置.
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray* attributes = [NSMutableArray array];
    // 将控制每个单元格大小和位置的UICollectionViewLayoutAttributes
    // 添加到NSArray中
    for (NSInteger i=0 ; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath* indexPath = [NSIndexPath
                                  indexPathForItem:i inSection:0];
        [attributes addObject:
         [self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return attributes;
    
}

- (CGFloat)cellWidth
{
    return (WIDTH - 3 * 5) / 4;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(WIDTH, self.countOfRow * ([self cellWidth] + 5));
}

@end
