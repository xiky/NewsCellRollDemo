//
//  ViewController.m
//  JKNewsCellDemo
//
//  Created by lqb on 2017/10/18.
//  Copyright © 2017年 lqb. All rights reserved.
//

#import "ViewController.h"
#import "JKNewsCell.h"
#import "JKNewsModel.h"



@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *naticeLists;

@end

static NSString *const newsCellID = @"newsCellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    for (NSInteger i = 0; i < 9; i++) {
        JKNewsModel *model = [[JKNewsModel alloc] init];
        model.naticeId = [NSString stringWithFormat:@"%ld", i + 1000];
        model.text = [NSString stringWithFormat:@"第%ld条新闻", (long)(i + 1)];
        
        [self.naticeLists addObject:model];
    }

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[JKNewsCell class] forCellReuseIdentifier:newsCellID];
    
    [self.view addSubview:_tableView];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:newsCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.newsArr = self.naticeLists;
    
    return cell;
}

- (NSMutableArray *)naticeLists {
    if (!_naticeLists) {
        _naticeLists = [NSMutableArray array];
    }

    return _naticeLists;
}

@end
