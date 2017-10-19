//
//  JKNewsCell.m
//  JKNewsCellDemo
//
//  Created by lqb on 2017/10/18.
//  Copyright © 2017年 lqb. All rights reserved.
//

#import "JKNewsCell.h"
#import "JKNewsView.h"
#import "JKNewsModel.h"


#define SCREEN_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)

@interface JKNewsCell () <CAAnimationDelegate>

@property (nonatomic, strong) JKNewsView *newsView;

@end

static NSInteger countInt = 0;
static NSString *notice_index;

@implementation JKNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - configUI
- (void)setupUI {
    [self.contentView addSubview:self.newsView];
}

#pragma mark - modelArr
- (void)setNewsArr:(NSArray<JKNewsModel *> *)newsArr {
    _newsArr = newsArr;
    
    countInt = self.newsArr.count;
    [self displayNews];
}

// 动画
- (void)displayNews {
    countInt++;
    
    if (countInt >= [self.newsArr count]) {
        countInt = 0;
    }
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
    
    notice_index = ((JKNewsModel *)self.newsArr[countInt]).naticeId;
    
    [self.newsView.titleLabel.layer addAnimation:animation forKey:@"animationID"];
    self.newsView.model = self.newsArr[countInt];
}


- (void)topNewsInfoClicked:(id)sender {
    NSLog(@"跳转更多");
}

- (JKNewsView *)newsView {
    if (_newsView == nil) {
        _newsView = [[JKNewsView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 32.0f)];
        
        [_newsView.newsButton addTarget:self action:@selector(topNewsInfoClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [UIView animateWithDuration:0.25 delay:0 options:0 animations:^(){
            _newsView.alpha = 0.2;
            [_newsView exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
            _newsView.alpha = 1;
            
        } completion:^(BOOL finished){
            //设置定时器
            [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
        }];
        
    }
    return _newsView;
}

@end
