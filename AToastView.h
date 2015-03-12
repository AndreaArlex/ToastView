//
//  AToastView.h
//  ArlexovincyFrameWork
//
//  Created by Arlexovincy on 14/11/14.
//  Copyright (c) 2014年 Arlexovincy. All rights reserved.
//

/***********************使用说明***********************/
//使用本类需要添加ArlexovincyFrameWork的以下几个类
//1.NSString+Addition
//2.AMacros
/*****************************************************/

#import <UIKit/UIKit.h>

@interface AToastView : UIView
{
    CGFloat width;
    CGFloat height;
}

@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) CGFloat dismissSecond;

/**
 *  带内容的显示
 *
 *  @param content 要显示的内容
 */
- (void)showWithContent:(NSString*)content;

/**
 *  显示内容并且可以控制Y轴的偏移量
 *
 *  @param content 内容
 *  @param y       Y轴偏移量
 */
- (void)showWithContent:(NSString *)content heighForY:(CGFloat)y;

@end
