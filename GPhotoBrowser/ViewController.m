//
//  ViewController.m
//  GPhotoBrowser
//
//  Created by yejunyou on 2017/5/11.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "ViewController.h"
#import "VViewController.h"
#import "HViewController.h"
#import "VHViewController.h"


@interface ViewController ()
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSArray *vcArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataList = @[@"竖向滑动", @"水平滑动", @"四面八方滑动"];
    _vcArray = @[
                 [[VViewController alloc] init],
                 [[HViewController alloc] init],
                 [[VHViewController alloc] init],
                 ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = _dataList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = _vcArray[indexPath.row];
    vc.view.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
