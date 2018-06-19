//
//  LQPickVC.m
//  UploadPhoto
//
//  Created by zengjun on 2018/6/14.
//  Copyright © 2018年 jun. All rights reserved.
//

#import "LQPickVC.h"
#import "LQGroupPickerViewController.h"


@interface LQPickVC ()

@property (nonatomic , strong) LQGroupPickerViewController *groupVC;
@end

#define PICKER_TAKE_DONE @"PICKER_TAKE_DONE"

@implementation LQPickVC

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self createNavigationController];
    }
    return self;
}

#pragma mark 初始化导航控制器
- (void)createNavigationController{
    LQGroupPickerViewController *groupVc = [[LQGroupPickerViewController alloc] initWithNibName:@"LQGroupPickerViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:groupVc];
    nav.view.frame = self.view.bounds;
    [nav.navigationBar setTranslucent:NO];
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];
    self.groupVC = groupVc;
    
}

- (void)setMinCount:(NSInteger)minCount{
    _minCount = minCount;
    self.groupVC.minCount = minCount;
}
- (void)setMaxCount:(NSInteger)maxCount{
    _maxCount = maxCount;
    self.groupVC.maxCount = maxCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotification];
}

#pragma mark - 展示控制器


- (void)addNotification{
    // 监听异步done通知
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(done:) name:PICKER_TAKE_DONE object:nil];
    });
}

- (void)done:(NSNotification *)note{
    NSArray *selectArray =  note.userInfo[@"selectAssets"];
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(pickerViewControllerDoneAsstes:)])
        {
            [self.delegate pickerViewControllerDoneAsstes:selectArray];
        }else if (self.callBackBlock)
        {
            self.callBackBlock(selectArray);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
