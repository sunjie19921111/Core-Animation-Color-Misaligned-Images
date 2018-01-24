//
//  ViewController.m
//  Core-Animation-Color Misaligned Images
//
//  Created by sxmaps on 2018/1/24.
//  Copyright © 2018年 sxmaps. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "UIView+Align.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

static NSString * const shouldRasterizeIdentifer = @"shouldRasterizeIdentifer";

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.view addSubview:self.tableView];
    [self test];
    [self testNumber];

}

#pragma mark - method

- (void)test {
    
    CGFloat b1FrameX = self.view.center.x;
    CGFloat b1FrameY = 100.0;
    UIImageView *big = [[UIImageView alloc] init];
    big.image = [UIImage imageNamed:@"me_couseDownload_pdf"];
    big.contentMode = UIViewContentModeScaleAspectFit;
    big.frame = CGRectMake(b1FrameX, b1FrameY, 0, 0);
    [big sizeToFit];
    [self.view addSubview:big]; // //{{187.5, 200}, {60, 60.333333333333336}}
 
    CGFloat b2FrameX = self.view.center.x;
    CGFloat b2FrameY = 200.0;
    UIImageView *big2 = [[UIImageView alloc] initWithFrame:CGRectMake(b2FrameX, b2FrameY, 0, 0)];
    big2.image = [UIImage imageNamed:@"me_couseDownload_pdf"];
    big2.contentMode = UIViewContentModeScaleAspectFit;
    [big2 sizeToFit];
    [big2  align];
    [self.view addSubview:big2];
    NSLog(@"%@",NSStringFromCGRect(big2.frame)); //{{188, 200}, {60, 61}}
 
    CGFloat b3FrameX = self.view.center.x;
    CGFloat b3FrameY = 300.0;
    CGFloat b3FrameWidth = 80.0;
    CGFloat b3FrameHeight = 80.0;
    UIImageView *big3 = [[UIImageView alloc] initWithFrame:CGRectMake(b3FrameX, b3FrameY, b3FrameWidth, b3FrameHeight)];
    big3.contentMode = UIViewContentModeScaleAspectFit;
    big3.image = [UIImage imageNamed:@"me_couseDownload_pdf"];
    big3.frame = CGRectIntegral(big3.frame);
    [self.view addSubview:big3];
    NSLog(@"%@",NSStringFromCGRect(big3.frame));  //{{187, 300}, {81, 80}}

}

- (void)testNumber {
    
    CGFloat j = floorf(33.33333333333);
    CGFloat i = floorf(33.77777777777);
    NSLog(@"j = %f----i = %f",j,i); //j = j = 33.000000----i = 33.000000
    
    CGFloat a = ceil(33.3333333333333333);
    CGFloat b = ceil(33.777777777777777);
    NSLog(@"a = %f----b = %f",a,b); //a = 34.000000----b = 34.000000
    
    CGFloat c = roundf(33.3333333333333333);
    CGFloat d = roundf(33.777777777777777);
    NSLog(@"c = %f----d = %f",c,d); //c = 33.000000----d = 34.000000
}


#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shouldRasterizeIdentifer];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:shouldRasterizeIdentifer];
    }
    
    NSArray *images = @[@"icon_message_ateacher",@"me_couseDownload_pdf",@"me_couseDownload_pdf",@"icon_message_ateacher"];
    //cell.bigImageView.image = [UIImage imageNamed:images[arc4random() % 4]];
    //cell.bigImageView.image = [UIImage imageNamed:@"icon_message_ateacher"];
    cell.bigImageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.titleLabel.text = @"sunjie";

    if (indexPath.row == 0) {
        cell.bigImageView.image = [UIImage imageNamed:@"me_couseDownload_pdf"];
        cell.bigImageView.frame = CGRectMake(10, 10, 60,61);
        
        [cell.bigImageView sizeToFit];
        cell.bigImageView.layer.shouldRasterize = YES;
    } else if (indexPath.row == 1) {
        cell.bigImageView.image = [UIImage imageNamed:@"icon_message_ateacher"];
        
        cell.bigImageView.frame = CGRectMake(10, 10, 66, 66);
    } else if (indexPath.row == 2) {
        cell.bigImageView.image = [UIImage imageNamed:@"icon_message_ateacher"];
        
        cell.bigImageView.frame = CGRectMake(10, 10, 55, 55);
    } else  {
        cell.bigImageView.image = [UIImage imageNamed:@"icon_message_ateacher"];
        [cell.bigImageView sizeToFit];
    }

    return cell;
}

#pragma mark - Property

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.rowHeight = 100.f;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



@end
