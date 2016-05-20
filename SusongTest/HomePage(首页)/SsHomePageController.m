//
//  SsHomePageController.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/13.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsHomePageController.h"
#import "SsMessageController.h"
#import "MJBannnerPlayer.h"
#import "SsOrderViewController.h"

@interface SsHomePageController ()<MJBannnerPlayerDeledage>

@property (nonatomic, assign) BOOL hasUpdatedConstraints;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;

@end

@implementation SsHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hk_clock2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(messageItemClick)];
    self.navigationItem.rightBarButtonItem = messageItem;
    
    
    [self prepareUI];
    
    
    //图片轮播期
    UIImage *imageOne = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://devsusong.iwshop.cn/uploads/userhead/3ce/3ce32fc342844897aeccf35dc5c6c37b.jpg"]]];
    UIImage *imageTwo = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://devsusong.iwshop.cn/uploads/userhead/f5e/f5ebc5737215f925c0ad1ea0c9b2c644.jpg"]]];
    NSArray *imageArray = @[imageOne,imageTwo];
   
    [MJBannnerPlayer initWithUrlArray:imageArray addTarget:self delegate:self withSize:CGRectMake(0, 64 , self.view.frame.size.width, 195) withTimeInterval:2.0f];

    
}

/**
 *  界面的准备
 */
-(void)prepareUI{
    
    [_recordBtn setImage:[UIImage imageNamed:@"组-22-拷贝-2"] forState:UIControlStateNormal];


    [_orderBtn setImage:[UIImage imageNamed:@"组-21-拷贝"] forState:UIControlStateNormal];

        [_imageBtn setImage:[UIImage imageNamed:@"hk_pic"] forState:UIControlStateNormal];
        _imageBtn.userInteractionEnabled = NO;


}



/**
 *  图片轮播期的点击
 */
-(void)MJBannnerPlayer:(UIView *)bannerPlayer didSelectedIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

/**
 *  发单按钮点击
 */
- (IBAction)orderBtnClick {
     SsOrderViewController *ordeVc = [[SsOrderViewController alloc] init];
    [self.navigationController pushViewController:ordeVc animated:YES];
}

/**
 *  录音按钮点击
 */
- (IBAction)recorderBtnClick{
}

/**
 *  导航栏点击
 */
-(void)messageItemClick{
    SsMessageController *messageVc = [[SsMessageController alloc] init];
    [self.navigationController pushViewController:messageVc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
