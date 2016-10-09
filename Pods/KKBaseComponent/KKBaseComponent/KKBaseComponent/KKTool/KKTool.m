//
//  TSTool.m
//  PZJ
//
//  Created by MR.KING on 16/5/3.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKTool.h"

CGRect CGZeroXYRectByWH(CGFloat width, CGFloat height){
    return CGRectMake(0, 0, width, height);
}

CGRect CGZeroXYRectBySize(CGSize size){
    return CGRectMake(0, 0, size.width, size.height);
}

CGRect CGRectFitSizeWithContentMode(CGSize superSize, CGSize size, UIViewContentMode contentMode){
    switch (contentMode) {
            
        case UIViewContentModeTop:
            return CGRectMake((superSize.width - size.width) / 2.0f, 0, size.width, size.height);
            break;

        case UIViewContentModeLeft:
            return CGRectMake(0, (superSize.height - size.height) / 2.0f, size.width, size.height);
            break;
            
        case UIViewContentModeRight:
            return CGRectMake(superSize.width - size.width, (superSize.height - size.height) / 2.0, size.width, size.height);
            break;
            
        case UIViewContentModeBottom:
            return CGRectMake((superSize.width - size.width) / 2.0, superSize.height - size.height, size.width, size.height);
            break;
            
        case UIViewContentModeCenter:
            return CGRectMake((superSize.width - size.width) / 2.0, (superSize.height - size.height) / 2.0, size.width, size.height);
            break;
            
        case UIViewContentModeTopLeft:
            return CGZeroXYRectBySize(size);
            break;
            
        case UIViewContentModeTopRight:
            return CGRectMake(superSize.width - size.width, 0, size.width, size.height);
            break;
            
        case UIViewContentModeBottomLeft:
            return CGRectMake(0, superSize.height - size.height, size.width, size.height);
            break;
            
        case UIViewContentModeBottomRight:
            return CGRectMake(superSize.width - size.width, superSize.height - size.height, size.width, size.height);
            break;
            
        case UIViewContentModeRedraw:
        case UIViewContentModeScaleToFill:
            return CGZeroXYRectBySize(superSize);
            break;
        case UIViewContentModeScaleAspectFit:
        {
            CGFloat radio = size.width / size.height;
            if (size.width / superSize.width >= size.height / superSize.height) {
                CGFloat realHeight = superSize.width / radio;
                return CGRectMake(0, (superSize.height - realHeight) / 2.0, superSize.width, realHeight);
            }else{
                CGFloat realWidth = size.height * radio;
                return CGRectMake((superSize.width - realWidth) / 2.0, 0, realWidth, superSize.height);
            }
            break;
        }
        case UIViewContentModeScaleAspectFill:
        {
            CGFloat radio = size.width / size.height;
            if (size.width / superSize.width <= size.height / superSize.height) {
                CGFloat realHeight = superSize.width / radio;
                return CGRectMake(0, (superSize.height - realHeight) / 2.0, superSize.width, realHeight);
            }else{
                CGFloat realWidth = size.height * radio;
                return CGRectMake((superSize.width - realWidth) / 2.0, 0, realWidth, superSize.height);
            }
            break;
        }
        default:
            break;
    }
}



CGRect CGRectConvertToSizeSelfSize(CGRect rect, CGSize targetSize){
    
    CGRect newFrame;
    
    CGFloat newW,newH,newX,newY = 0;
    
    CGFloat SX = rect.origin.x;
    CGFloat SY = rect.origin.y;
    CGFloat SW = rect.size.width;
    CGFloat SH = rect.size.height;
    
    CGFloat PW = targetSize.width;
    CGFloat PH = targetSize.height;
    
    if (SY > 0) {
        newY = 0;
        if (SH + SY > PH) {
            newH = PH - SY;
        }else{
            newH = SH;
        }
    }else{
        newY = (SY)?-SY:0;
        if (SH + SY > PH) {
            newH = PH;
        }else{
            newH = SH + SY;
        }
    }
    
    
    if (SX > 0) {
        newX = 0;
        if (SW + SX > PW) {
            newW = PW - SX;
        }else{
            newW = SW;
        }
    }else{
        newX = (SX)?-SX:0;
        if (SW + SX > PW) {
            newW = PW;
        }else{
            newW = SW + SX;
        }
    }
    
    newFrame.origin = CGPointMake(newX, newY);
    newFrame.size = CGSizeMake(newW, newH);
    
    return newFrame;
    
}
@implementation KKTool
// 将时间差 转换为分秒
+(NSString*)transTimeIntervalString:(NSTimeInterval)timeInterval{
    NSInteger minutes = timeInterval/60;
    NSInteger seconds = (NSInteger)timeInterval%60;
    return [NSString stringWithFormat:@"距离可以解锁时间还有%2.2ld分 %2.2ld秒",minutes,seconds];
}


@end
