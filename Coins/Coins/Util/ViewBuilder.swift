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
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(titleColor, for: .normal)
        button.setAttributedTitle(attributeTitle, for: .normal)
        button.backgroundColor = bgColor
        return button
    }
}
