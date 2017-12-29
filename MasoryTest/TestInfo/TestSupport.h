//
//  TestSupport.h
//  MasoryTest
//
//  Created by Chris Yang on 2017/12/29.
//  Copyright © 2017年 Chris Yang. All rights reserved.
//

#ifndef TestSupport_h
#define TestSupport_h

#import <Masonry/Masonry.h>

/* COLOR */
#define MTColor(hex, alp) \
[UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0f \
green:((hex & 0xFF00) >> 8) / 255.0f \
blue:(hex & 0xFF) / 255.0f \
alpha:alp]

#define MTRandonColor(alp)  MTColor((rand() % 0xffffff), alp)

/* FONT */
#define MTFont(fontSize)    [UIFont systemFontOfSize:fontSize]

/* Weak Self */
#define MTWeakSelf(weakSelf)    __weak __typeof(self) weakSelf = self

#endif /* TestSupport_h */
