//
//  UILabel.swift
//  Coins
//
//  Created by manish yadav on 2/6/23.
//

import Foundation
import UIKit
extension UILabel {
    func addAttributedText(text: String,
                           font: UIFont,
                           textColor: UIColor,
                           lineSpacing: CGFloat = 0) {
        let attributeString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5.0//lineSpacing

        let attributes = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]

        attributeString.addAttributes(attributes, range: NSRange(location: 0, length: attributeString.length))
        self.attributedText = attributeString
    }
}
