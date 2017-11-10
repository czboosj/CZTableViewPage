//
//  Ex.swift
//  CZTableViewPage
//
//  Created by boosj on 2017/11/7.
//  Copyright © 2017年 boosjcz. All rights reserved.
//

import UIKit
extension UIColor{
    // 应该是莫个版本系统的函数名冲突,造成没效果问题,加个2
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        
        // printLog("测试随机数\(r):\(g) :\(b)")
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}

