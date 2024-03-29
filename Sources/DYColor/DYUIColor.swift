//
//  DYUIColor.swift
//  
//
//  Created by 방유빈 on 2024/03/10.
//

import UIKit

@available(iOS 14.0, *)
public struct DYUIColor {
    private let lightColor: UIColor
    private let darkColor: UIColor
    
    public var dynamicColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .dark ? darkColor : lightColor
        }
    }
    
    public init(lightColor: UIColor, darkColor: UIColor) {
        self.lightColor = lightColor
        self.darkColor = darkColor
    }
    
    public init(lightColor: UIColor) {
        self.lightColor = lightColor
        self.darkColor = lightColor.adjusted(brightness: 1.0, saturation: 0.7)
    }
    
    public func getLightColor() -> UIColor {
        return lightColor
    }
    
    public func getDarkColor() -> UIColor {
        return darkColor
    }
}

