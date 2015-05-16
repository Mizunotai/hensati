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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
