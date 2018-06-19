//
//  LQPhotoLayout.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/13.
//  Copyright © 2018年 jun. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LQPhotoLayout : UICollectionViewFlowLayout
{

}
///固定行数
@property (nonatomic, assign )NSInteger countOfRow;
///cell的宽，正方形
@property (nonatomic, assign,readonly)CGFloat cellWidth;

@end
