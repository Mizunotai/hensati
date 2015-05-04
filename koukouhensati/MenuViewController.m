//
//  MenuViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/03/29.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _checkBox=[[BFPaperCheckbox alloc]initWithFrame:CGRectMake(45,270,40,40)];
    _checkBox2=[[BFPaperCheckbox alloc]initWithFrame:CGRectMake(45, 330, 40, 40)];
    _checkBox3=[[BFPaperCheckbox alloc]initWithFrame:CGRectMake(45, 390, 40, 40)];
    [self.view addSubview:_checkBox];
    [self.view addSubview:_checkBox2];
    [self.view addSubview:_checkBox3];
    NSLog(@"ホームda:%d",taiki);
}


-(IBAction)back{
    if (_checkBox.isChecked) {
        taiki =1;
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else if (_checkBox2.isChecked){
        taiki=2;
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else if (_checkBox3.isChecked){
        taiki =3;
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"選択されてません"
                                  delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
    [alert show];
        
        
}
    NSLog(@"%@",_checkBox);
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
