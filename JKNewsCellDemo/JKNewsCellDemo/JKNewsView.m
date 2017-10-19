//
//  JKNewsView.m
//  JKNewsCellDemo
//
//  Created by lqb on 2017/10/18.
//  Copyright © 2017年 lqb. All rights reserved.
//

#import "JKNewsView.h"
#import "UIView+Additions.h"
#import "JKNewsModel.h"


#define SCREEN_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SCREEN_SCALE SCREEN_WIDTH / 414.0f

#define SYSTEM_SCALE_FONT(num) [UIFont systemFontOfSize: num * SCREEN_SCALE]


@interface JKNewsView ()

@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation JKNewsView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HP_todayNewsIcon"]];
        [self.iconView sizeToFit];
        self.iconView.frame = CGRectMake(10, (self.height - self.iconView.height) / 2, self.iconView.width, self.iconView.height);
        [self addSubview:self.iconView];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconView.frame) + 5, 0, (SCREEN_WIDTH - 35 - self.iconView.right) * SCREEN_SCALE, 32)];
        self.titleLabel.textColor = UIColorFromRGB(0x999999);
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = SYSTEM_SCALE_FONT(15);
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.titleLabel.numberOfLines = 1;
        self.titleLabel.userInteractionEnabled = YES;
        [self addSubview:self.titleLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGoNewsDetailWebVC:)];
        [self.titleLabel addGestureRecognizer:tap];
        tap = nil;
        
        self.newsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.newsButton.frame = CGRectMake(SCREEN_WIDTH - 60 * SCREEN_SCALE, 0, 60 * SCREEN_SCALE, 32);
        [self.newsButton setTitle:@"更多 >" forState:UIControlStateNormal];
        self.newsButton.titleLabel.font = SYSTEM_SCALE_FONT(15);
        [self.newsButton setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [self addSubview:self.newsButton];
    }
    return self;
}

- (void)tapGoNewsDetailWebVC:(UITapGestureRecognizer *)tap {
    NSLog(@"跳转详情");
}

- (void)setModel:(JKNewsModel *)model {
    _model = model;
    
    self.titleLabel.text = model.text;
}

@end
