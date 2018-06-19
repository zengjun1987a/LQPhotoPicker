//
//  LQPickVC.h
//  UploadPhoto
//
//  Created by zengjun on 2018/6/14.
//  Copyright © 2018年 jun. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^CallBackBlock)(NSArray *assets);

@protocol LQPickDelagete <NSObject>

/**
 *  返回所有的Asstes对象
 */
- (void)pickerViewControllerDoneAsstes:(NSArray *)assets;

@end

@interface LQPickVC : UIViewController

///代理
@property (nonatomic , weak) id<LQPickDelagete> delegate;

/// 可以用代理来返回值或者用block来返回值
@property (nonatomic , copy) CallBackBlock callBackBlock;

@property (nonatomic , assign) NSInteger minCount;
@property (nonatomic , assign) NSInteger maxCount;


@end
