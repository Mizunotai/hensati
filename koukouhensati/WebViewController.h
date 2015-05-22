//
//  WebViewController.h
//  koukouhensati
//
//  Created by 大氣 on 2015/05/16.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface WebViewController : UIViewController
<UIWebViewDelegate>{
    IBOutlet UIWebView *web;
}
@end
