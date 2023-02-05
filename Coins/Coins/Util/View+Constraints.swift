//
//  View+Constraints.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation
import UIKit

extension UIView {
    func pinToSuperView(superView: UIView,
                        top: CGFloat = 0,
                        leading: CGFloat = 0,
                        trailing: CGFloat = 0,
                        bottom: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            topAnchor.constraint(equalTo: superView.topAnchor, constant: top),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailing),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
