//
//  UIColor+Extension.swift
//  DgApp
//
//  Created by 柯秉钧 on 16/8/19.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit

extension UIColor
{
	/**
     根据RGB生成颜色
     
     - parameter r: red
     - parameter g: green
     - parameter b: blue
     
     - returns: 颜色
     */
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
		self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
	}

	/**
     根据RGB生成颜色
     
     - parameter r: red
     - parameter g: green
     - parameter b: blue
     - parameter alpha: 透明度
     
     - returns: 颜色
     */
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
		self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
	}

	/**
     生成灰色
     
     - parameter gray: 灰色
     
     - returns: 颜色
     */
	convenience init(gray: CGFloat) {
		self.init(red: gray / 255.0, green: gray / 255.0, blue: gray / 255.0, alpha: 1)
	}


	func toHexString() -> String {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0

		getRed(&r, green: &g, blue: &b, alpha: &a)

		let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0

		return NSString(format: "#%06x", rgb) as String
	}
}
