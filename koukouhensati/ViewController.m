//
//  ViewController.m
//  new taikis app
//
//  Created by 大氣 on 2015/01/10.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *csvFile;
    NSData *csvData;
    NSString *csv;
    NSArray *lines;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    table.delegate = self;
    table.dataSource = self;
    
   
    if (taiki == 0) {
        taiki = 3;
    }
    
    
    switch (taiki) {
        case 1:
            csvFile = [[NSBundle mainBundle] pathForResource:@"東京公立高偏差値表" ofType:@"csv"];

            break;
        case 2:
            csvFile = [[NSBundle mainBundle] pathForResource:@"東京私立高偏差値表" ofType:@"csv"];

            break;
        case 3:
            csvFile = [[NSBundle mainBundle] pathForResource:@"東京偏差値表" ofType:@"csv"];

            break;
        
    }
    
  
    csvData = [NSData dataWithContentsOfFile:csvFile];
    csv = [[NSString alloc] initWithData:csvData encoding:NSUTF8StringEncoding];
    
    lines= [csv componentsSeparatedByString:@"\n"];
    if (!nameArray) {
        nameArray = [NSMutableArray new];
        
    }
    for (NSString *row in lines) {
        [nameArray addObject:row];
        
    }
    
    [table reloadData];
    NSLog(@"table:%d",taiki);
}
/**
 * テーブルのセルの数を返す
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nameArray.count;
}

/**
 * 指定されたインデックスパスのセルを作成する
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // セルにテキストを設定
    cell.textLabel.text = [nameArray objectAtIndex:indexPath.row];
    
    return cell;
}

/**
 * セルが選択されたとき
 */

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = @"title";
    return title;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
