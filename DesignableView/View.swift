//
//  View.swift
//  DesignableView
//
//  Created by Xzx 's iMac on 16/4/13.
//  Copyright © 2016年 TouchSpring. All rights reserved.
//

import UIKit

//protocol BorderAble {
//  var lineColor: UIColor {get}
//  var lineWidth: CGFloat {get}
//  
//  var enabledTopLine: Bool {get}
//  var enabledLeftLine: Bool {get}
//  var enabledBottomLine: Bool {get}
//  var enabledRightLine: Bool {get}
//  
//  var leftTextInset: CGFloat {get}
//  var rightTextInset: CGFloat {get}
//}
//
//extension BorderAble where Self: View {
// 
//  @IBInspectable var lineColor: UIColor = UIColor.borderColor()
//  @IBInspectable var lineWidth: CGFloat = 1 / UIScreen.mainScreen().scale
//  
//  @IBInspectable var enabledTopLine: Bool = true
//  @IBInspectable var enabledLeftLine: Bool = false
//  @IBInspectable var enabledBottomLine: Bool = true
//  @IBInspectable var enabledRightLine: Bool = false
//  
//  @IBInspectable var leftTextInset: CGFloat = 20
//  @IBInspectable var rightTextInset: CGFloat = 20
//}

//enum llll: BorderAble {
//  @IBInspectable var lineColor: UIColor = UIColor.borderColor()
//  @IBInspectable var lineWidth: CGFloat = 1 / UIScreen.mainScreen().scale
//  
//  @IBInspectable var enabledTopLine: Bool = true
//  @IBInspectable var enabledLeftLine: Bool = false
//  @IBInspectable var enabledBottomLine: Bool = true
//  @IBInspectable var enabledRightLine: Bool = false
//  
//  @IBInspectable var leftTextInset: CGFloat = 20
//  @IBInspectable var rightTextInset: CGFloat = 20
//}

class View: UIView {

  @IBInspectable var lineColor: UIColor = UIColor.borderColor()
  @IBInspectable var lineWidth: CGFloat = 1 / UIScreen.mainScreen().scale
  
  @IBInspectable var enabledTopLine: Bool = true
  @IBInspectable var enabledLeftLine: Bool = false
  @IBInspectable var enabledBottomLine: Bool = true
  @IBInspectable var enabledRightLine: Bool = false
  
  @IBInspectable var leftTextInset: CGFloat = 20
  @IBInspectable var rightTextInset: CGFloat = 20
  
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
//  @IBInspectable var borderWidth: CGFloat = 0 {
//    didSet {
//      layer.borderWidth = borderWidth
//    }
//  }
//  @IBInspectable var borderColor: UIColor? {
//    didSet {
//      layer.borderColor = borderColor?.CGColor
//    }
//  }
  
  override func drawRect(rect: CGRect) {
    super.drawRect(rect)
    
    lineColor.setStroke()
    
    let context = UIGraphicsGetCurrentContext()
    
    CGContextSetLineWidth(context, lineWidth)
    
    if enabledTopLine {
      CGContextMoveToPoint(context, 0, 0)
      CGContextAddLineToPoint(context, CGRectGetWidth(rect), 0)
      CGContextStrokePath(context)
    }
    
    if enabledLeftLine {
      let y = CGRectGetHeight(rect)
      CGContextMoveToPoint(context, 0, 0)
      CGContextAddLineToPoint(context, 0, y)
      CGContextStrokePath(context)
    }
    
    if enabledBottomLine {
      let y = CGRectGetHeight(rect)
      CGContextMoveToPoint(context, 0, y)
      CGContextAddLineToPoint(context, CGRectGetWidth(rect), y)
      CGContextStrokePath(context)
    }
    
    if enabledRightLine {
      let x = CGRectGetWidth(rect)
      let y = CGRectGetHeight(rect)
      CGContextMoveToPoint(context, x, 0)
      CGContextAddLineToPoint(context, x, y)
      CGContextStrokePath(context)
    }
  }
}
