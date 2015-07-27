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
    
    NSMutableArray *farstNameArray;
    NSArray *farstSerchhResolt;
    UITableViewCell *cell;
    UIAlertView *al;
    UIAlertView *alert;
    
    BOOL searchBool;
    NSString *str;
    int nukky ;
}

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (weak, nonatomic) IBOutlet UISearchBar *serchBar;

@property (nonatomic ,strong)NSArray *serchResolt;

@property (nonatomic,strong)NSMutableArray *nameArray;

@property (nonatomic,strong)NSArray *nameArrayCopy;




@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _table.delegate = self;
    _table.dataSource = self;
    
    mut = [[NSMutableArray alloc]init];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    
    if (checkBox.isChecked) {
        taiki =1;
        if (checkBox2.isChecked) {
            alert =
            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
            [alert show];
        }else if (checkBox3.isChecked){
            alert =
            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
            [alert show];
        }
    }else if(checkBox2.isChecked){
        taiki =2;
        
        if (checkBox.isChecked) {
            alert =
            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
            [alert show];
        }else if (checkBox3.isChecked){
            alert =
            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
            [alert show];
        }
    }else if (checkBox3.isChecked){
        taiki=3;
        if (checkBox.isChecked) {
            alert =
            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
            [alert show];
        }else if (checkBox2.isChecked){
            alert =
            [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"他のが選択せれています。"
                                      delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
            [alert show];
        }
    }
    
    
    
    //    NSLog(@"table:%d",taiki);
    
    NSString *string = [NSString stringWithFormat:@"%d,%d",mizuno,taiki];
    if (taiki == 1) {
        
        csvFile =[[NSBundle mainBundle] pathForResource:string ofType:@"csv"];
    }else if (taiki == 2){
        csvFile =[[NSBundle mainBundle] pathForResource:string ofType:@"csv"];
        
    }else if (taiki == 3){
        csvFile =[[NSBundle mainBundle] pathForResource:string ofType:@"csv"];
    }
    
    
    csvData = [NSData dataWithContentsOfFile:csvFile];
    csv = [[NSString alloc] initWithData:csvData encoding:NSUTF8StringEncoding];
    
    lines= [csv componentsSeparatedByString:@"\n"];
    
    
    if (!_nameArray) {
        _nameArray = [NSMutableArray new];
        
    }else{
        [_nameArray removeAllObjects];
    }
    for (NSString *row in lines) {
        [_nameArray addObject:row ];
        _nameArrayCopy = [_nameArray copy];
        
    }
    NSString *obj;
    NSArray *items;
    NSMutableArray *matrics;
    farstNameArray =[NSMutableArray array];
    matrics = [[NSMutableArray alloc]initWithCapacity:1];
    for (obj in  lines) {
        items =[obj componentsSeparatedByString:@","];
        [matrics addObject:items];
    }
    for (int i = 0;i < [matrics count] ; i++) {
        NSArray *temp =[matrics objectAtIndex:i];
        
        [farstNameArray addObject:[temp objectAtIndex:0]];
        
    }

    self.serchResolt = [[NSArray alloc]init];
    
    [_table reloadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finish) name:UIApplicationWillResignActiveNotification object:nil];
    NSLog(@"%d,%d",mizuno,taiki);
}


/**
 * テーブルのセルの数を返す
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return self.serchResolt.count ;
    }else{
        return  self.nameArrayCopy.count;
    }
    
}

/**
 * 指定されたインデックスパスのセルを作成する
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
   
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [self.serchResolt objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [self.nameArrayCopy objectAtIndex:indexPath.row];
    }
    return cell;
    
}

-(void)filterContentForSearchText:(NSString *)serchText scope:(NSString *)scope{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",serchText];
    self.serchResolt = [self.nameArrayCopy filteredArrayUsingPredicate:predicate];
    searchBool = YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}
/**
 * セルが選択されたとき
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    al=[[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:self
                       cancelButtonTitle:@"お気に入り登録" otherButtonTitles:@"webへ", nil ];
    [al show];
    
    
    
    nukky =indexPath.row;
    NSLog(@"%d",nukky);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (al == alertView) {
        
        NSLog(@"%d",nukky);
        switch (buttonIndex) {
            case 0:
            {
                NSLog(@"お気に入りとうろく");
                if (searchBool == YES) {
                    str =[NSString stringWithFormat:@"%@",[self.serchResolt objectAtIndex:nukky]];
                     NSLog(@"%@",str);
                }else if (searchBool == NO){
                    str = [NSString stringWithFormat:@"%@",[self.nameArrayCopy objectAtIndex:nukky]];
                     NSLog(@"%@",str);
                }
               
                NSUInteger index =[mut indexOfObject:str];
                if (index != NSNotFound) {//yes
                    
                }else{//no
                    [mut addObject:str];
                }
                
                
                NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
                NSData *data =[NSKeyedArchiver archivedDataWithRootObject:mut];
                [ud setObject:data forKey:@"key"];
                [ud synchronize];
                
                break;
            }
            case 1:
                if (searchBool == YES) {
                    string = [NSString stringWithFormat:@"%@",[_serchResolt objectAtIndex:nukky]];
                }else if(searchBool == NO){
                    string =[NSString stringWithFormat:@"%@",[farstNameArray objectAtIndex:nukky]];
                    NSLog(@"%@",string);
                    
                    

                }
                ViewController *webViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"web"];
                [self presentViewController:webViewController animated:YES completion:nil];
                
        }
    }
    
}


-(void)finish{
    NSLog(@"ta");
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    NSData *data =[NSKeyedArchiver archivedDataWithRootObject:mut];
    [ud setObject:data forKey:@"key"];
    [ud synchronize];
}




@end
