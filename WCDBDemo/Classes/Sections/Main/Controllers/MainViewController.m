//
//  MainViewController.m
//  WCDBDemo
//
//  Created by 黄耀武 on 2017/8/23.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "MainViewController.h"
#import "MainManager.h"
#import "UserModel.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray *tableData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"WCDB";
    _tableData = [NSArray array];
    
    [self updateUserWithUserID:@"1" username:@"yaowu"];
//    [self loadCacheData];
    [self loadRemoteData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 获取数据
- (void)loadCacheData {
    NSArray *list = [[MainManager sharedManager] getCachedUserList];
    self.tableData = [NSArray arrayWithArray:list];
    [self.tableView reloadData];
}

- (void)loadRemoteData {
    __weak MainViewController *weakSelf = self;
    [[MainManager sharedManager] fetchUserListWithHandler:^(NSError *error, NSArray<UserModel *> *list) {
        if (!error) {
            if (list.count > 0) {
                weakSelf.tableData = [NSArray arrayWithArray:list];
                [weakSelf.tableView reloadData];
            }
        } else {
            //
        }
    }];
}

#pragma mark - 修改数据
- (BOOL)updateUserWithUserID:(NSString *)userID
                    username:(NSString *)username {
    return [[MainManager sharedManager] updateUserWithUserID:userID username:username];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"WCDBTestCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    UserModel *model = [self.tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = model.username;
    cell.detailTextLabel.text = model.company.name;
    return cell;
}

@end
