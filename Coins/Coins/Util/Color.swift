//
//  UIColor.swift
//  Coins
//
//  Created by manish yadav on 2/14/23.
//

import Foundation
import UIKit

extension UIColor {
    static var backgroundColor: UIColor {
        return UIColor(red: 250.0/255.0,
                       green: 250.0/255.0,
                       blue: 250.0/255.0,
                       alpha: 1.0)
    }
    
    static var themeColor: UIColor {
        return UIColor(red: 255.0/255.0,
                       green: 187.0/255.0,
                       blue: 0.0,
                       alpha: 1.0)
    }
    static var lightTextColor: UIColor {
        return UIColor(red: 50.0/255.0,
                       green: 50.0/255.0,
                       blue: 50.0/255.0,
                       alpha: 1.0)
    }
    static var textColor: UIColor {
        return UIColor(red: 10.0/255.0,
                       green: 10.0/255.0,
                       blue: 10.0/255.0,
                       alpha: 1.0)
    }
    static var separatorColor: UIColor {
        return UIColor(red: 150.0/255.0,
                       green: 150.0/255.0,
                       blue: 150.0/255.0,
                       alpha: 1.0)
    }
}
