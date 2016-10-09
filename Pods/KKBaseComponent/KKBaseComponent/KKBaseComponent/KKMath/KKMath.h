//
//  KKMath.h
//  KKPoint
//
//  Created by KING on 16/9/1.
//  Copyright © 2016年 KING. All rights reserved.
//


#ifndef KK_Math
#define KK_Math

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  log the special transform with form like this:
 *  a = *
 *  b = *
 *  c = *
 *  d = *
 *  tx = *
 *  ty = *
 *
 *  @param transform to be log
 */
void KKLogTransform(CGAffineTransform transform);

/**
 *  get the center of special frame
 *
 *  @param frame to be cul
 *
 *  @return center
 */
CGPoint KKCenterAtFrame(CGRect frame);

/**
 *  point add point
 *  {point1.x + point2.x, point1.y + point2.y}
 *
 *  @param p1 first point
 *  @param p2 second point
 *
 *  @return sum of two points
 */
CGPoint KKPointAddPoint(CGPoint p1, CGPoint p2);

/**
 *  The baseP point as the origin point, get the position of relativeP
 *
 *  @param baseP     which to be the orgin point
 *  @param relativeP relativeP
 *
 *  @return relative point
 */
CGPoint KKPointRelatePoint(CGPoint baseP, CGPoint relativeP);

/**
 *  To get a matrix of SVG format
 *
 *  @param frame            the origin frame
 *  @param currentTransform the transform
 *
 *  @return CGAffineTransform
 */
CGAffineTransform KKCMGetTransformForSVG(CGRect frame, CGAffineTransform transform);

/**
 *  see AVMakeRectWithAspectRatioInsideRect
 */
CGRect KKMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect) NS_AVAILABLE(10_7, 4_0);

/**
 *  distance of two points
 *
 *  @param p1 the first point
 *  @param p2 the second point
 *
 *  @return distance of the special two points
 */
CGFloat KKDisTwoPoint(CGPoint p1, CGPoint p2);

/**
 *  Will develop Angle reduction to less than 360 degrees
 *
 *  @param angle angle
 *
 *  @return angle less the 360 degrees
 */
CGFloat KKTransToMinTwoPI(CGFloat angle);

/**
 *  The specified point relative to the origin of the Angle
 *
 *  @param point The specified point
 *
 *  @return Angle
 */
CGFloat KKAngleAtPoint(CGPoint point);

/**
 *  Point to the straight line distance, Point lineP1 and point lineP2 decided to straight line
 *
 *  @param lineP1 a point of a line
 *  @param lineP2 a point of a line
 *  @param p      A point outside the line
 *
 *  @return distance
 */
CGFloat KKDistancePointToLine(CGPoint lineP1, CGPoint lineP2, CGPoint p);


/**
 *  According to two points to ensure a linear equations
 *  the A,B,C is Ax + By + c = 0
 *
 *  @param A      A
 *  @param B      B
 *  @param C      C
 *  @param lineP1 a point of a line
 *  @param lineP2 a point of a line
 */
void KKGetLine(CGFloat * A, CGFloat * B, CGFloat * C, CGPoint lineP1, CGPoint lineP2);

#endif

