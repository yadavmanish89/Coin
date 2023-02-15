//
//  UIColor.swift
//  Coins
//
//  Created by manish yadav on 2/14/23.
//

import Foundation
import UIKit

extension UIFont {
    static var subTitleFont: UIFont {
        return UIFont(name: "Helvetic Neue", size: 18.0) ?? UIFont.systemFont(ofSize: 18.0)
    }
    static var titleFont: UIFont {
        return UIFont(name: "Helvetic Neue", size: 22.0) ?? UIFont.systemFont(ofSize: 22.0)
    }
    static var largeTitleFont: UIFont {
        return UIFont(name: "Helvetic Neue", size: 28.0) ?? UIFont.systemFont(ofSize: 28.0)
    }
    static var extraLargeTitleFont: UIFont {
        return UIFont(name: "Helvetic Neue", size: 34.0) ?? UIFont.systemFont(ofSize: 34.0)
    }
}
