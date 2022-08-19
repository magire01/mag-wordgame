//
//  StyleColors.swift
//  WordGame
//
//  Created by Mark Gire on 8/18/22.
//

import UIKit
import Foundation


extension UIColor {
    struct LetterColor {
        static var green: UIColor { return UIColor(red: 0.1882, green: 0.8392, blue: 0.0078, alpha: 1.0) }
        static var yellow: UIColor { return UIColor(red: 0.898, green: 0.7765, blue: 0, alpha: 1.0) }
        static var wrong: UIColor { return UIColor(red: 0.6196, green: 0.0431, blue: 0.051, alpha: 1.0) }
        static var notUsed: UIColor { return UIColor(red: 0.4706, green: 0.498, blue: 0.5176, alpha: 1.0) }
    }
}
