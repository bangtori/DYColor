//
//  UIColor+Extension.swift
//
//
//  Created by 방유빈 on 2024/03/10.
//

import UIKit

@available(iOS 14.0, *)
public extension UIColor {
    /// #FFFFFF와 같이 16진수 hexString color를 쓸 수 있음.
    convenience init(hex: String, alpha: Double = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func adjusted(brightness: Double, saturation: Double) -> UIColor {
        var hue: CGFloat = 0
        var saturationValue: CGFloat = 0
        var brightnessValue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getHue(&hue, saturation: &saturationValue, brightness: &brightnessValue, alpha: &alpha)
        
        saturationValue *= CGFloat(saturation)
        brightnessValue *= CGFloat(brightness)
        
        return UIColor(hue: hue, saturation: saturationValue, brightness: brightnessValue, alpha: alpha)
    }
}
