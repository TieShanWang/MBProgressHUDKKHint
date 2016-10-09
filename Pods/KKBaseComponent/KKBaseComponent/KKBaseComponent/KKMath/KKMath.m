//
//  KKMath.m
//  KKPoint
//
//  Created by KING on 16/9/1.
//  Copyright © 2016年 KING. All rights reserved.
//

#import "KKMath.h"

#import <AVFoundation/AVFoundation.h>

CGRect KKMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect){
    return AVMakeRectWithAspectRatioInsideRect(aspectRatio, boundingRect);
}

void KKLogTransform(CGAffineTransform form){
    printf("\na = %f \nb = %f\nc = %f\nd = %f\ntx = %f\nty = %f\n",form.a,form.b,form.c,form.d,form.tx,form.ty);
}

CGFloat KKTransToMinTwoPI(CGFloat angle){
    
    CGFloat resultAngle = angle;
    
    // 简化为360度内
    if (resultAngle > 2 * M_PI) {
        // 相除结果
        CGFloat tmp = resultAngle / (2 * M_PI);
        // 取整数
        CGFloat z = floor(tmp);
        // 取小数 * 2 * M_PI
        resultAngle = (tmp - z) * (2 * M_PI);
    }
    
    return resultAngle;
}


CGFloat KKDisTwoPoint(CGPoint p1, CGPoint p2){
    return sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
}

// 参考点为原点
CGFloat KKAngleAtPoint(CGPoint point){

    CGFloat x = point.x;
    CGFloat y = point.y;
    
    CGFloat abx = fabs(point.x);
    CGFloat aby = fabs(point.y);
    
    CGFloat angle = 0;
    
    if (x == 0 || y == 0) {
        if (x == 0 && (y == 0)) {
            angle = 0;
        }else if (x == 0 && (y != 0) ){
            angle = (y > 0)? M_PI / 2.0 : M_PI * 1.5;
        }else if(y == 0 && (x != 0)){
            angle = (x > 0)? 0 : M_PI;
        }
        return angle;
    }
    
    if (x > 0 && y > 0) {
        // 第一象限
        angle = atan(aby / abx);
    }else if (x > 0 && y < 0){
        // 第四象限
        angle =  2 * M_PI - atan(aby / abx);
    }else if (x < 0 && y > 0){
        // 第二象限
        angle = M_PI / 2.0 + atan(abx / aby);
    }else if(x < 0 && y < 0){
        // 第三象限
        angle = M_PI + atan( aby / abx);
    }
    return angle;
}

CGFloat KKDistancePointToLine(CGPoint lineP1, CGPoint lineP2, CGPoint p){
    
    CGFloat A,B,C = 0;
    
    A = lineP2.y - lineP1.y;
    B = lineP1.x - lineP2.x;
    C = lineP2.x * lineP1.y - lineP1.x * lineP2.y;
    
    //    [self getLint:&A B:&B C:&C Point1:point1 point2:point2];
    
    CGFloat dist = 0;
    
    // a^2 +  b^2
    CGFloat fz = sqrt( A * A + B * B);
    
    // ax + by + c
    CGFloat fm = A * p.x + B * p.y + C;
    
    dist = fz ? fabs(fm / fz) : 0;
    
    return dist;
}

void KKGetLine(CGFloat * A, CGFloat * B, CGFloat * C, CGPoint lineP1, CGPoint lineP2){

    CGFloat a,b,c = 0;
    
    a = lineP2.y - lineP1.y;
    b = lineP1.x - lineP2.x;
    c = lineP2.x * lineP1.y - lineP1.x * lineP2.y;
    
    A = &a;
    B = &b;
    C = &c;
}

CGPoint KKPointAddPoint(CGPoint p1, CGPoint p2){
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

CGPoint KKPointRelatePoint(CGPoint baseP, CGPoint relativeP){
    return CGPointMake(relativeP.x - baseP.x, relativeP.y - baseP.y);
}

CGPoint KKCenterAtFrame(CGRect frame){
    return CGPointMake(frame.origin.x + frame.size.width / 2.0, frame.origin.y + frame.size.height / 2.0);
}

CGAffineTransform KKCMGetTransformForSVG(CGRect frame, CGAffineTransform transform){
    
    CGAffineTransform newTransform = transform;
    
    // 原始左上角
    CGPoint oriTopLeft = frame.origin;
    
    // 原始中心
    CGPoint oriCenter = KKCenterAtFrame(frame);
    
    // 现在中心
    UIView * view = [[UIView alloc]initWithFrame:frame];
    view.transform = newTransform;
    CGPoint curCenter = KKCenterAtFrame(view.frame);
    
    // 现在左上角q
    CGPoint offset = KKPointRelatePoint(oriCenter, oriTopLeft);
    CGAffineTransform tmpTransform = newTransform;
    tmpTransform.tx = 0;
    tmpTransform.ty = 0;
    CGPoint newOffset =  CGPointApplyAffineTransform(offset, tmpTransform);
    CGPoint curTopLeft = KKPointAddPoint(curCenter ,newOffset);
    
    CGFloat tx = curTopLeft.x;
    CGFloat ty = curTopLeft.y;
    
    newTransform.tx = tx;
    newTransform.ty = ty;
    
    return newTransform;
    
}


