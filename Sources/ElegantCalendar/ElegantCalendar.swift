//
//  File.swift
//  
//
//  Created by Max Kuznetsov on 2/6/24.
//

import Foundation
import CoreGraphics
import CoreText

public struct ElegantCalendar {
    
    public enum CalendarFonts: String, CaseIterable {
        case andaleMono = "Andale_Mono"
        case bookerly = "Bookerly"
        case sansMono = "cofosansmonovf-Trial"
        case homemadeApple = "HomemadeApple-Regular"
        case sfPro = "SF-Pro-Text-Regular"
        
        public var ext: String {
            switch self {
            case .andaleMono, .bookerly, .sansMono, .homemadeApple: return "ttf"
            case .sfPro: return "otf"
            }
        }
    }
    
    public static func registerFonts() {
        CalendarFonts.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: $0.ext)
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider) else {
                fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?

        print(font)
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

