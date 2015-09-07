//
//  ViewController.m
//  GradualNavigationBar
//
//  Created by yangyang on 15/9/7.
//  Copyright (c) 2015年 yang. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+GradualColor.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

#define NAVIGATION_BAR_COLOR(x) [UIColor colorWithRed:0/255.0 green:255/255.0 blue:200/255.0 alpha:x]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //初始化navigation bar
    self.title = @"index";
    [self.navigationController.navigationBar setNavigationBarBackgroundColor:[UIColor clearColor]];

    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offset_y = scrollView.contentOffset.y;
    CGFloat alpha = MIN(1,(64 + offset_y)/64-1);
    
    if (offset_y >= 0) {
        [self.navigationController.navigationBar setNavigationBarBackgroundColor:NAVIGATION_BAR_COLOR(alpha)];
    }else{
        [self.navigationController.navigationBar setNavigationBarBackgroundColor:NAVIGATION_BAR_COLOR(0)];
    }
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
