//
//  FavViewController.m
//  koukouhensati
//
//  Created by 大氣 on 2015/05/30.
//  Copyright (c) 2015年 Taiki. All rights reserved.
//

#import "FavViewController.h"

@interface FavViewController (){
    NSMutableArray *array;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation FavViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.table.delegate = self;
    self.table.dataSource = self;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *data = [ud objectForKey:@"key"];
    mut = [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *data = [ud objectForKey:@"key"];
    array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
/*セル数*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
/*セル作成*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =[array objectAtIndex:indexPath.row];
    return cell;
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
