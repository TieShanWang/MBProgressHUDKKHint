//
//  TSTool.h
//  PZJ
//
//  Created by MR.KING on 16/5/3.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


CGRect CGZeroXYRectByWH(CGFloat width, CGFloat height);

CGRect CGZeroXYRectBySize(CGSize size);

CGRect CGRectFitSizeWithContentMode(CGSize superSize, CGSize size, UIViewContentMode contentMode);

/**
 *  将自己映射到一个矩形框中后，自身保留的位置
 *
 *  @param rect       自身在需要映射的矩形框中的位置
 *  @param targetSize 需要映射的矩形框
 *
 *  @return 保留frame
 */
CGRect CGRectConvertToSizeSelfSize(CGRect rect, CGSize targetSize);


@interface KKTool : NSObject
// 将时间差 转换为分秒
+(nonnull NSString*)transTimeIntervalString:(NSTimeInterval)timeInterval;

@end

NS_ASSUME_NONNULL_END
