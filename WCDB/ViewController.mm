//
//  ViewController.m
//  WCDB
//
//  Created by beaconnav on 2019/3/7.
//  Copyright © 2019 Mspacewiz. All rights reserved.
//

#import "ViewController.h"
//#import "Parking.h"
//#import "Parking+TableCoding.h"
#import "WCDB/WCDB.h"
#import "PoiInfoModel.h"
#import "JSONModel.h"
#import "PoiInfoModel+TableCoding.h"

#define TABLENAME @"PARKING"
#define FloorArray @[@"-2",@"-1",@"1"]
#define FixArray @[@"A",@"B",@"C"]

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) WCTDatabase *dataBase;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDataBase];
    [self initData];
    [self createUI];
}

- (void)initData
{
    _dataArray = [NSMutableArray array];
    
    self.navigationItem.title = @"搜索";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加电梯" style:UIBarButtonItemStylePlain target:self action:@selector(clickAddData)];
}

//添加数据
- (void)clickAddData
{
    NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"poi" ofType:@"json"]] options:0 error:nil];
    NSArray *poiArray = [PoiInfoModel arrayOfModelsFromDictionaries:resultDict[@"poi"] error:nil];
    BOOL success = [_dataBase insertObjects:poiArray into:TABLENAME];
    
    NSLog(@"插入是否成功: %d",success);
}


- (void)createDataBase
{
    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *path = [documents stringByAppendingPathComponent:@"fmdb"];
    _dataBase = [[WCTDatabase alloc] initWithPath:path];
    
    [_dataBase setTokenizer:WCTTokenizerNameWCDB];
    [_dataBase createVirtualTableOfName:TABLENAME withClass:PoiInfoModel.class];
}

- (void)createUI
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
    _searchBar.placeholder = @"搜索停车位";
    _searchBar.delegate = self;
    _searchBar.barTintColor = [UIColor whiteColor];
    //    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    _tableView.tableHeaderView = _searchBar;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"searchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    PoiInfoModel *model = _dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@     %@",model.floorid,model.bid];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PoiInfoModel *model = _dataArray[indexPath.row];
    NSLog(@"Model: %@",model);
}


#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    _dataArray =  [NSMutableArray arrayWithArray:[_dataBase getObjectsOfClass:PoiInfoModel.class fromTable:TABLENAME where:PoiInfoModel.PropertyNamed(TABLENAME).like([NSString stringWithFormat:@"%@*",searchBar.text])]];
    
    NSLog(@"dataArray_count: %lu",(unsigned long)_dataArray.count);
    
    typeof(self)weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
    
    [searchBar resignFirstResponder];
}











@end
