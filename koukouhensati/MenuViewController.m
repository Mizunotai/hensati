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
    checkBox=[[BFPaperCheckbox alloc]initWithFrame:CGRectMake(45,270,40,40)];
    checkBox2=[[BFPaperCheckbox alloc]initWithFrame:CGRectMake(45, 330, 40, 40)];
    checkBox3=[[BFPaperCheckbox alloc]initWithFrame:CGRectMake(45, 390, 40, 40)];
    [self.view addSubview:checkBox];
    [self.view addSubview:checkBox2];
    [self.view addSubview:checkBox3];
    NSLog(@"ホームda:%d",taiki);
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"戻る";
    self.navigationItem.backBarButtonItem = barButton;

    self.picker.delegate = self;
    self.picker.dataSource =self;
    
    nameArray = [NSArray arrayWithObjects:
                 @"北海道"
                 ,@"青森"
                 ,@"岩手"
                 ,@"宮城"
                 ,@"秋田"
                 ,@"山形"
                 ,@"福島"
                 ,@"茨城"
                 ,@"栃木"
                 ,@"群馬"
                 ,@"埼玉"
                 ,@"千葉"
                 ,@"東京"
                 ,@"神奈川"
                 ,@"新潟"
                 ,@"富山"
                 ,@"石川"
                 ,@"福井"
                 ,@"山梨"
                 ,@"長野"
                 ,@"岐阜"
                 ,@"静岡"
                 ,@"愛知"
                 ,@"三重"
                 ,@"滋賀"
                 ,@"京都"
                 ,@"大阪"
                 ,@"兵庫"
                 ,@"奈良"
                 ,@"和歌山"
                 ,@"鳥取"
                 ,@"島根"
                 ,@"岡山"
                 ,@"広島"
                 ,@"山口"
                 ,@"徳島"
                 ,@"香川"
                 ,@"愛媛"
                 ,@"高知"
                 ,@"福岡"
                 ,@"佐賀"
                 ,@"長崎"
                 ,@"熊本"
                 ,@"大分"
                 ,@"宮城"
                 ,@"鹿児島"
                 ,@"沖縄", nil];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return nameArray.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [nameArray objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSLog(@"%ld",selectedRow);
    
    mizuno = selectedRow + 1 ;
    NSLog(@"mizuno:%d",mizuno);
    
    
    
}


-(IBAction)back{
    
    
//    if (checkBox.isChecked) {
//        taiki =1;
//        
//        if (checkBox2.isChecked) {
//            UIAlertView *alert =
//            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
//                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
//            [alert show];
//        }else if (checkBox3.isChecked){
//            UIAlertView *alert =
//            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
//                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
//            [alert show];
//        }else{
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//        
//    }else if (checkBox2.isChecked){
//        
//        taiki=2;
//        
//        if (checkBox.isChecked) {
//            UIAlertView *alert =
//            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
//                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
//            [alert show];
//        }else if (checkBox3.isChecked){
//            UIAlertView *alert =
//            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
//                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
//            [alert show];
//        }else{
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
//    }else if (checkBox3.isChecked){
//       
//        
//        taiki =3;
//        if (checkBox.isChecked) {
//            UIAlertView *alert =
//            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
//                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
//            [alert show];
//        }else if (checkBox2.isChecked){
//            UIAlertView *alert =
//            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
//                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
//            [alert show];
//        }else{
//        [self dismissViewControllerAnimated:YES completion:nil];
//        }
//    
//    }
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
