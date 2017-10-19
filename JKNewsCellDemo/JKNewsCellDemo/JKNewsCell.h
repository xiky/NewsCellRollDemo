//
//  JKNewsCell.h
//  JKNewsCellDemo
//
//  Created by lqb on 2017/10/18.
//  Copyright © 2017年 lqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKNewsModel;
@interface JKNewsCell : UITableViewCell

@property (nonatomic, strong) NSArray<JKNewsModel *> *newsArr;

@end
