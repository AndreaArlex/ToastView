//
//  AToastView.m
//  ArlexovincyFrameWork
//
//  Created by Arlexovincy on 14/11/14.
//  Copyright (c) 2014年 Arlexovincy. All rights reserved.
//

#import "AToastView.h"
#import "NSString+Addition.h"

@implementation AToastView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initView];
    }
    
    return self;
}

#pragma mark- 初始化界面
- (void)initView
{
    _fontSize = 12; //default fontSize
    _dismissSecond = 1; //default dismissSecond
    
    self.backgroundColor = UIColorFromRGB(0x525152);
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4;
    self.layer.borderColor = UIColorFromRGB(0x636563).CGColor;
}

- (void)makeToastViewWithContent:(NSString*)content
{
    for (AToastView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        
        if ([view isKindOfClass:[AToastView class]]) {
            
            [view removeFromSuperview];
        }
    }
    
    width = [content getStringWidth:[UIFont systemFontOfSize:_fontSize]];
    height = [content getMultiLineStringHeight:[UIFont systemFontOfSize:_fontSize] andMaxWidth:1000];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.font = [UIFont systemFontOfSize:_fontSize];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.text = content;
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:contentLabel];
    
    if (width > 270) {
        
        height = [content getMultiLineStringHeight:[UIFont systemFontOfSize:_fontSize] andMaxWidth:270];
        width = 270;
        
    }
    
    self.frame = CGRectMake((Main_Screen_Width - width - 10)/ 2.0, Main_Screen_Height - height - 20, width + 10, height + 10);
    contentLabel.frame = CGRectMake(5, 5, width, height);
}

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_dismissSecond * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.5 animations:^{
        
            self.alpha = 0;
        } completion:^(BOOL finished){
        
             [self removeFromSuperview];
        }];
    });
}

#pragma mark- 带内容的显示
- (void)showWithContent:(NSString*)content
{
    [self makeToastViewWithContent:content];
    
    [self show];
}

#pragma mark- 显示内容并且可以控制Y轴的偏移量
- (void)showWithContent:(NSString *)content heighForY:(CGFloat)y
{
    [self makeToastViewWithContent:content];
    self.frame = CGRectMake((Main_Screen_Width - width - 10)/ 2.0, y, width + 10, height + 10);
    [self show];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
