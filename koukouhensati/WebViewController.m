//
//  WebViewController.m
//  koukouhensati
//
//  Created by 大氣 on 2015/05/16.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    web.delegate=self;
    web.scalesPageToFit = YES;
    NSString *searchUrl = [NSString stringWithFormat:@"http://www.google.co.jp/search?hl=ja&lr=lang_ja&q=%@",string];
    NSString *encodeUrl = [searchUrl stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSURL *url =[NSURL URLWithString: encodeUrl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [web loadRequest:req];
    
    /* 右スワイプ */
    UISwipeGestureRecognizer* swiperightGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(view_SwipeRight:)];
    
    // 右スワイプを認識するように設定
    swiperightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    // ビューにジェスチャーを追加
    [self.view addGestureRecognizer:swiperightGesture];
    
    /* 左スワイプ */
    UISwipeGestureRecognizer* swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(view_SwipeLeft:)];
    
    // 左スワイプを認識するように設定
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    
    // ビューにジェスチャーを追加
    [self.view addGestureRecognizer:swipeLeftGesture];
    
}
/**
 * 右スワイプがされたとき
 */
- (void)view_SwipeRight:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右スワイプがされました．");
    [web goBack];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 * 左スワイプがされたとき
 */
- (void)view_SwipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左スワイプがされました．");
    [web goForward];
}
-(IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
