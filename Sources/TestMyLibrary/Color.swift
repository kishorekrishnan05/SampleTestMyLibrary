//
//  File.swift
//  
//
//  Created by Kishore on 23/08/22.
//

import Foundation
import UIKit

extension UIColor {

    func aspectRatioImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }

    open class var colorDarkblue: UIColor {
        return "#0c2340".hexStringToUIColor()
    }
    open class var colorGray: UIColor {
        return "#666666".hexStringToUIColor()
    }
    
    open class var colorGhostWhite: UIColor {
        return "#f9f9f9".hexStringToUIColor()
    }

    open class var colorPinkRed: UIColor {
        return "#D50032".hexStringToUIColor()
    }

    open class var colorBlue: UIColor {
        return "#0033A0".hexStringToUIColor()
    }

    open class var colorFordGray: UIColor {
        return "#979797".hexStringToUIColor()
    }

    open class var colorSeatGray: UIColor {
        return "#999999".hexStringToUIColor()
    }

    

    open class var shadowBottomColor: UIColor {
        return self.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
    }

    open class var shadowColor: UIColor {
        return self.init(red: 0.05, green: 0.2, blue: 0.13, alpha: 0.4)
    }
}

extension String {
    func hexStringToUIColor() -> UIColor {
        var cString: String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
