//
//  MTScrollContentItemView.m
//  MasoryTest
//
//  Created by Chris Yang on 2017/12/29.
//  Copyright © 2017年 Chris Yang. All rights reserved.
//

#import "TestSupport.h"

#import "MTScrollContentItemView.h"

@implementation MTScrollContentItemView

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
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.layer.shadowColor = MTColor(0x000000, 0.02).CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowOpacity = 1;
}

- (void)allocSubviews {
    _iconImageView = [[UIImageView alloc] init];
    _questionLabel = [[UILabel alloc] init];
    _answerTitleLabel = [[UILabel alloc] init];
    _answerDetailLabel = [[UILabel alloc] init];
}

- (void)configSubviews {
    
    /* Icon Image View */
    [_iconImageView setBackgroundColor:MTRandonColor(0.1)];
    
    /* Question Label */
    [_questionLabel setText:@"问题标题"];
    [_questionLabel setTextColor:MTColor(0x333333, 1)];
    [_questionLabel setFont:MTFont(18)];
    [_questionLabel setTextAlignment:NSTextAlignmentLeft];
    [_questionLabel setAdjustsFontSizeToFitWidth:YES];
    [_questionLabel setBackgroundColor:MTRandonColor(0.1)];
    
    /* Answer Title Label */
    [_answerTitleLabel setText:@"回答标题"];
    [_answerTitleLabel setTextColor:MTColor(0x333333, 1)];
    [_answerTitleLabel setFont:MTFont(16)];
    [_answerTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [_answerTitleLabel setAdjustsFontSizeToFitWidth:YES];
    [_answerTitleLabel setBackgroundColor:MTRandonColor(0.1)];
    
    /* Answer Detail Label */
    [_answerDetailLabel setText:@"详细回答"];
    [_answerDetailLabel setTextColor:MTColor(0x999999, 1)];
    [_answerDetailLabel setFont:MTFont(12)];
    [_answerDetailLabel setTextAlignment:NSTextAlignmentLeft];
    [_answerDetailLabel setNumberOfLines:0];
    [_answerDetailLabel setBackgroundColor:MTRandonColor(0.1)];
    
    [self addSubview:_iconImageView];
    [self addSubview:_questionLabel];
    [self addSubview:_answerTitleLabel];
    [self addSubview:_answerDetailLabel];
    
    [self subViewsAutoLayoutSetting];
}

- (void)subViewsAutoLayoutSetting {
    
    MTWeakSelf(mainView);
    
    /* Icon Image View */
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView).offset(10);
        
        make.width.mas_equalTo(90).priorityHigh();
        make.height.mas_equalTo(70).priorityHigh();
        make.bottom.lessThanOrEqualTo(mainView).offset(-10).priorityMedium();
        make.top.equalTo(mainView).offset(65).priorityLow();
    }];
    
    /* Question Label */
    [_questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainView).offset(20);
        make.left.equalTo(mainView).offset(111);
        make.height.mas_equalTo(25);
        
        make.right.equalTo(mainView).offset(-6).priorityHigh();
        make.width.mas_greaterThanOrEqualTo(10).priorityLow();
    }];
    
    /* Answer Title Label */
    [_answerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainView.questionLabel.mas_bottom).offset(20);
        make.left.equalTo(mainView).offset(111);
        make.height.mas_equalTo(22);

        make.right.equalTo(mainView).offset(-6).priorityHigh();
        make.width.mas_greaterThanOrEqualTo(10).priorityLow();
    }];
    
    /* Answer Detail Label */
    [_answerDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainView.answerTitleLabel.mas_bottom).offset(5);
        make.left.equalTo(mainView).offset(111);
        make.bottom.equalTo(mainView).offset(-10);
        
        make.right.equalTo(mainView).offset(-6).priorityHigh();
        make.width.mas_greaterThanOrEqualTo(10).priorityLow();
    }];
}

#pragma mark - User Interface

- (void)updateDetailInfo:(NSString *)detailInfo {
    [_answerDetailLabel setText:detailInfo];
}

@end
