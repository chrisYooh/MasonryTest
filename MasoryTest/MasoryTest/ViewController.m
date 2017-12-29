//
//  ViewController.m
//  MasoryTest
//
//  Created by Chris Yang on 2017/12/29.
//  Copyright © 2017年 Chris Yang. All rights reserved.
//

#import "TestSupport.h"
#import "MTScrollContentView.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) MTScrollContentView *scView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _scView = [[MTScrollContentView alloc] init];
    
    [self.view addSubview:_scView];
    
    MTWeakSelf(mainVc);
    [_scView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(mainVc.view);
        make.center.equalTo(mainVc.view);
    }];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSArray *tmpArray = @[
                          [self testDetailStr],
//                          [self testDetailStr],
//                          [self testDetailStr],
//                          [self testDetailStr],
//                          [self testDetailStr],
//                          [self testDetailStr],
//                          [self testDetailStr],
//                          [self testDetailStr],
                          ];
    
    [_scView resetWithDetailArray:tmpArray];
}

#pragma mark - MISC

- (NSString *)testDetailStr {
    
    NSString *itemStr = @"这是一段测试数据...";
    
    NSInteger tmpInt = arc4random() % 20 + 1;
    NSMutableString *tmpMulStr = @"".mutableCopy;
    for (int i = 0; i < tmpInt; i++) {
        [tmpMulStr appendString:itemStr];
    }
    
    return tmpMulStr.copy;
}

@end
