//
//  MenuViewController.h
//  new taikis app
//
//  Created by 大氣 on 2015/03/29.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFPaperCheckbox.h"
#import "ViewController.h"
int mizuno;
@interface MenuViewController : UIViewController
<UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    IBOutlet UINavigationItem *item ;
    
    NSArray *nameArray ;
}
@property BFPaperCheckbox *checkBox;
@property BFPaperCheckbox *checkBox2;
@property BFPaperCheckbox *checkBox3;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
