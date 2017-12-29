//
//  MTScrollContentItemView.h
//  MasoryTest
//
//  Created by Chris Yang on 2017/12/29.
//  Copyright © 2017年 Chris Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTScrollContentItemView : UIView

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *questionLabel;
@property (nonatomic, strong) UILabel *answerTitleLabel;
@property (nonatomic, strong) UILabel *answerDetailLabel;

- (void)updateDetailInfo:(NSString *)detailInfo;

@end
