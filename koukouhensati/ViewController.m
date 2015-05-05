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
    

    
    
  

    
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"table:%d",taiki);
        
    if (taiki == 1) {
        csvFile =[[NSBundle mainBundle] pathForResource:@"東京公立高偏差値表" ofType:@"csv"];
    }else if (taiki == 2){
        csvFile =[[NSBundle mainBundle] pathForResource:@"東京私立高偏差値表" ofType:@"csv"];
        
    }else if (taiki == 3){
        csvFile =[[NSBundle mainBundle] pathForResource:@"東京偏差値表" ofType:@"csv"];
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
    self.serchResolt = [[NSArray alloc]init ];

    [_table reloadData];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
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

/**
 * セルが選択されたとき
 */

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = @"title";
    return title;
}


-(IBAction)idou{
    MenuViewController *menuVC =[self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    
    [self presentViewController:menuVC animated:YES completion:nil];
}

-(void)filterContentForSearchText:(NSString *)serchText scope:(NSString *)scope{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",serchText];
    self.serchResolt = [self.nameArrayCopy filteredArrayUsingPredicate:predicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
