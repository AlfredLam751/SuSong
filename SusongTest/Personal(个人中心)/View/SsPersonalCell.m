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
#import "SsPersonalItemLabel.h"

@interface SsPersonalCell()

@property (nonatomic, strong) UIImageView *accessView;
@property (nonatomic, strong) UISwitch *accessSwitch;
@property (nonatomic, strong) UILabel *accessLabel;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation SsPersonalCell


+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"PersonaleCell";
    SsPersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SsPersonalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.lineView];
        [self setupCellBackgroundColor];
    }
    return self;
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
    CGFloat lineY = CGRectGetHeight(self.frame) - lineH;
    CGFloat lineW = CGRectGetWidth(self.frame) - lineX;
    
    self.lineView.frame = CGRectMake(lineX, lineY, lineW, lineH);
}

-(void)setItem:(SsPersonalItem *)item{
    _item = item;
    [self setupData];
    [self setupRightAccessory];

}

-(void)setupCellBackgroundColor{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor lightGrayColor];
    self.selectedBackgroundView = bgView;
}

-(void)setupData{
    self.textLabel.text = _item.name;
    self.imageView.image = _item.iconName ? [UIImage imageNamed:_item.iconName]:nil;
}

-(void)setupRightAccessory{
    
    if ([_item isKindOfClass:[SsPersonalItemSwitch class]]) {
        SsPersonalItemSwitch *itemSwitch = (SsPersonalItemSwitch *)_item;
        self.accessSwitch.on = itemSwitch.isOn;
        self.accessoryView = self.accessSwitch;
        
    }else if ([_item isKindOfClass:[SsPersonalItemArrow class]]){
        self.accessoryView = self.accessView;
    }else if ([_item isKindOfClass:[SsPersonalItemLabel class]]){
        SsPersonalItemLabel *itemLabel = (SsPersonalItemLabel *)_item;
        self.accessLabel.text = itemLabel.labelText;
        self.accessoryView = self.accessLabel;
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
        [_accessSwitch addTarget:self action:@selector(swithValueChange) forControlEvents:UIControlEventValueChanged];
    }
    return _accessSwitch;
}

-(UILabel *)accessLabel{
    if (_accessLabel == nil) {
        _accessLabel = [[UILabel alloc] init];
        _accessLabel.frame = CGRectMake(0, 0, 50, 20);
        _accessLabel.textAlignment = NSTextAlignmentCenter;
        _accessLabel.font = [UIFont systemFontOfSize:11];
    }
    return _accessLabel;
}

-(UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        _lineView.alpha = 0.3;
    }
    return _lineView;
}


-(void)swithValueChange{
    SsPersonalItemSwitch *itemSwitch = (SsPersonalItemSwitch *)_item;
    itemSwitch.isOn = self.accessSwitch.on;
}

@end
