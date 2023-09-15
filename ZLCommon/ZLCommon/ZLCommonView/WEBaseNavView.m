//
//  WEBaseNavView.m
//  Weather
//
//  Created by yanglin on 2017/7/10.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "WEBaseNavView.h"
#import "ZLMacros.h"
#import "WEConstant.h"
#import "UIColor+JZDjHex.h"

@interface WEBaseNavView ()
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) CALayer *lineLayer;

@end


@implementation WEBaseNavView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = FONTBOLD(17);
    self.titleLabel.textColor = [UIColor colorWithHexString:KFont2Color];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.titleLabel.font = FONT(15);
    [self.leftBtn setImage:nil forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn setTitleColor:[UIColor colorWithHexString:KFont2Color] forState:0];
    [self addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.hidden = YES;
    self.rightBtn.titleLabel.font = FONT(15);
    self.rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.rightBtn addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn setTitleColor:[UIColor colorWithHexString:KFont2Color] forState:0];
    [self addSubview:self.rightBtn];
    
    self.lineLayer = [CALayer layer];
    self.lineLayer.backgroundColor = [UIColor colorWithHexString:KbggreyColor].CGColor;
    [self.layer addSublayer:self.lineLayer];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)clickLeft{
    if (self.clickLeftBlock) {
        self.clickLeftBlock();
    }
}

- (void)clickRight{
    if (self.clickRightBlock) {
        self.clickRightBlock();
    }
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setLeftImg:(NSString *)leftImg{
    _leftImg = leftImg;
    [self.leftBtn setImage:nil forState:UIControlStateNormal];
}

- (void)setRightTitle:(NSString *)rightTitle{
    _rightTitle = rightTitle;
    self.rightHidden = NO;
    [self.rightBtn setTitle:_rightTitle forState:UIControlStateNormal];
}

- (void)setRightImg:(NSString *)rightImg{
    _rightImg = rightImg;
    self.rightBtn.hidden = NO;
    [self.rightBtn setImage:nil forState:UIControlStateNormal];
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.titleLabel.textColor = textColor;
    [self.leftBtn setTitleColor:textColor forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:textColor forState:UIControlStateNormal];
}

- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.lineLayer.backgroundColor = lineColor.CGColor;
}

- (void)setStyleColor:(UIColor *)styleColor{
    _styleColor = styleColor;
    [self.rightBtn setTitleColor:styleColor forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:styleColor forState:UIControlStateNormal];
    self.titleLabel.textColor = styleColor;
}

- (void)setTitleHidden:(BOOL)titleHidden{
    _titleHidden = titleHidden;
    self.titleLabel.hidden = titleHidden;
}

- (void)setLeftHidden:(BOOL)leftHidden{
    _leftHidden = leftHidden;
    self.leftBtn.hidden = leftHidden;
}

- (void)setRightHidden:(BOOL)rightHidden{
    _rightHidden =  rightHidden;
    self.rightBtn.hidden = rightHidden;
}


@end
