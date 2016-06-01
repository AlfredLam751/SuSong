//
//  SsPersonalCell.m
//  SusongTest
//
//  Created by Alfred Lam on 16/5/31.
//  Copyright © 2016年 Alfred Lam. All rights reserved.
//

#import "SsPersonalCell.h"
#import "SsPersonalItem.h"
#import "SsPersonalItemSwitch.h"
#import "SsPersonalItemArrow.h"

@interface SsPersonalCell()

@property (nonatomic, strong) UIImageView *accessView;
@property (nonatomic, strong) UISwitch *accessSwitch;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation SsPersonalCell


+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"PersonaleCell";
    SsPersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SsPersonalCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
-(void)setHidenLine:(BOOL)hidenLine{
    _hidenLine = hidenLine;
    self.lineView.hidden = _hidenLine;
}

/**
 *  布局子控件
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat lineX = self.textLabel.frame.origin.x;
    CGFloat lineH = 1;
    CGFloat lineY  = self.frame.size.height - lineH;
    CGFloat lineW = self.frame.size.width - lineX;
    self.lineView.frame = CGRectMake(lineX, lineY, lineH, lineW);
}

-(void)setItem:(SsPersonalItem *)item{
    _item = item;
    [self setupData];
    [self setupRightAccessory];

}

-(void)setupData{
    self.textLabel.text = _item.name;
    self.imageView.image = _item.iconName ? [UIImage imageNamed:_item.iconName]:nil;
}

-(void)setupRightAccessory{
    
    if ([_item isKindOfClass:[SsPersonalItemSwitch class]]) {
        self.accessoryView = self.accessSwitch;
    }else if ([_item isKindOfClass:[SsPersonalItemArrow class]]){
        self.accessoryView = self.accessView;
    }else{
        self.accessView = nil;
    }
}


#pragma mark 懒加载
-(UIImageView *)accessView{
    if (_accessView == nil) {
        _accessView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hk_jump2"]];
    }
    return _accessView;
}

-(UISwitch *)accessSwitch{
    if (_accessSwitch == nil) {
        _accessSwitch = [[UISwitch alloc] init];
    }
    return _accessSwitch;
}

-(UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
        _lineView.alpha = 0.3;
    }
    return _lineView;
}


@end
