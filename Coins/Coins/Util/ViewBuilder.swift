//
//  ViewBuilder.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation
import UIKit

class ViewBuilder {
    static func buildTableView() -> UITableView {
        let tableView: UITableView = UITableView()
        return tableView
    }
    
    static func getButton(title: String,
                          titleColor: UIColor,
                          font: UIFont,
                          bgColor: UIColor) -> UIButton {
        let attributeTitle = NSMutableAttributedString(string: title)
        let attributes = [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: font
        ]
        attributeTitle.addAttributes(attributes, range: NSRange(location: 0, length: attributeTitle.length))
        let button = UIButton(type: .custom)
        button.setAttributedTitle(attributeTitle, for: .normal)
        button.backgroundColor = bgColor
        return button
    }
    
    static func getLabel(text: String,
                         textColor: UIColor,
                         font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        return label
    }
    
    static func getImageView(image: UIImage? = nil) -> UIImageView {
        let imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .white
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }
}
