//
//  Font.swift
//  Lollipop
//
//  Created by Kehinde Bankole on 19/11/2024.
//

import Foundation
import SwiftUI

enum Fonts : String {
    case regular = "WorkSans-Regular"
    case medium = "WorkSans-Medium"
    case semibold = "WorkSans-Semibold"
}
extension Font {
    static func regular(size : CGFloat = 16) -> Font{
        return .custom(Fonts.regular.rawValue, size: size)
    }
    
    static func medium(size : CGFloat = 16) -> Font{
        return .custom(Fonts.medium.rawValue, size: size)
    }
    
    static func semibold(size : CGFloat = 16) -> Font{
        return .custom(Fonts.semibold.rawValue, size: size)
    }
}
