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
 BFPaperCheckbox *checkBox;
 BFPaperCheckbox *checkBox2;
 BFPaperCheckbox *checkBox3;
@interface MenuViewController : UIViewController
<UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    IBOutlet UINavigationItem *item ;
    
    NSArray *nameArray ;
}


@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
