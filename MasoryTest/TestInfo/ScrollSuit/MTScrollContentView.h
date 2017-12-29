//
//  MTScrollContentView.h
//  MasoryTest
//
//  Created by Chris Yang on 2017/12/29.
//  Copyright © 2017年 Chris Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTScrollContentItemView.h"

@interface MTScrollContentView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray<MTScrollContentItemView *> *itemViewArray;
@property (nonatomic, strong) UIView *noteView;

- (void)resetWithDetailArray:(NSArray<NSString *> *)detailStrArray;

@end
