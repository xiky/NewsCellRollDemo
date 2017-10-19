//
//  JKNewsView.h
//  JKNewsCellDemo
//
//  Created by lqb on 2017/10/18.
//  Copyright © 2017年 lqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKNewsModel;
@interface JKNewsView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *newsButton;

@property (nonatomic, strong) JKNewsModel *model;

@end
