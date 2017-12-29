//
//  MTScrollContentView.m
//  MasoryTest
//
//  Created by Chris Yang on 2017/12/29.
//  Copyright © 2017年 Chris Yang. All rights reserved.
//

#import "TestSupport.h"

#import "MTScrollContentView.h"

@implementation MTScrollContentView

- (id)init {
    
    self = [super init];
    
    if (self) {
        [self configSelf];
        [self allocSubviews];
        [self configSubviews];
    }
    
    return self;
}

- (void)configSelf {
    [self setBackgroundColor:MTColor(0xf9f9f9, 1)];
}

- (void)allocSubviews {
    _scrollView = [[UIScrollView alloc] init];
    _noteView = [[UIView alloc] init];
}

- (void)configSubviews {
    
    /* Scroll View */
    [_scrollView setBackgroundColor:[UIColor clearColor]];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    
    /* Note View */
    [_noteView setBackgroundColor:MTRandonColor(0.2)];
    
    [self addSubview:_scrollView];
    [_scrollView addSubview:_noteView];
    
    [self subViewsAutoLayoutSetting];
}

- (void)subViewsAutoLayoutSetting {
    
    MTWeakSelf(mainView);
    
    /* ScrollView */
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(mainView);
        make.size.equalTo(mainView);
    }];
    
    /* Risk Note View */
    [_noteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainView).offset(-100);
        make.left.equalTo(mainView.scrollView);
        make.width.equalTo(mainView);
        make.height.mas_equalTo(44);
    }];
}

#pragma mark - MISC

- (void)itemViewsAutoLayoutSetting {
    
    UIView *refView = nil;
    
    MTWeakSelf(mainView);
    for (int i = 0; i < _itemViewArray.count; i++) {
        
        MTScrollContentItemView *tmpView = _itemViewArray[i];
        
        if (0 == i) {
            /* 首项 */
            [tmpView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(mainView.scrollView).offset(100);
                make.left.equalTo(mainView).offset(15);
                make.right.equalTo(mainView).offset(-15);
                make.height.mas_equalTo(50);
            }];
            [tmpView setBackgroundColor:[UIColor yellowColor]];
            
        } else {
            /* 普通项目 */
            [tmpView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(refView.mas_bottom).offset(10);
                make.left.equalTo(mainView).offset(15);
                make.right.equalTo(mainView).offset(-15);
                make.height.mas_equalTo(50);
            }];
        }
        
        refView = tmpView;
    }
    
    /* Note View */
    [_noteView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(refView.mas_bottom);
        make.left.equalTo(mainView);
        make.width.equalTo(mainView);
        make.height.mas_equalTo(44);
        make.bottom.equalTo(mainView.scrollView);
    }];
}

#pragma mark - User Interface

- (void)resetWithDetailArray:(NSArray<NSString *> *)detailStrArray {
    
    for (UIView *tmpView in _itemViewArray) {
        [tmpView removeFromSuperview];
    }
    _itemViewArray = nil;
    
    NSMutableArray *tmpMulArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < detailStrArray.count; i++) {
        MTScrollContentItemView *tmpView = [[MTScrollContentItemView alloc] init];
        [tmpView updateDetailInfo:detailStrArray[i]];
        tmpView.tag = i;
        
        [_scrollView addSubview:tmpView];
        [tmpMulArray addObject:tmpView];
    }
    _itemViewArray = tmpMulArray.copy;
    
    [self itemViewsAutoLayoutSetting];
}

@end
