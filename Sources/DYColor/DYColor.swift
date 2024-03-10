import SwiftUI

@available(iOS 14.0, *)
public struct DYColor {
    private let lightColor: Color
    private let darkColor: Color
    
    public var dynamicColor: Color {
        switch UITraitCollection.current.userInterfaceStyle {
        case .unspecified, .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
    
    public init(lightColor: Color, darkColor: Color) {
        self.lightColor = lightColor
        self.darkColor = darkColor
    }
    
    public init(lightColor: Color) {
        self.lightColor = lightColor
        self.darkColor = lightColor.adjusted(brightness: 1.0, saturation: 0.7)
    }
    
    public func getLightColor() -> Color {
        return lightColor
    }
    
    public func getDarkColor() -> Color {
        return darkColor
    }
}

