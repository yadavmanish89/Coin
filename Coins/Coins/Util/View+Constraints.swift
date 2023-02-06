//
//  View+Constraints.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation
import UIKit

extension UIView {
    
    /// Add constraint to view, if anyparam sent nil, then it will be skipped otherwise default value 0
    func pinToSuperView(superView: UIView,
                        top: CGFloat? = 0,
                        leading: CGFloat? = 0,
                        trailing: CGFloat? = 0,
                        bottom: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailing).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom).isActive = true
        }
    }

    func pinToSuperView(superView: UIView,
                        proportionalHeight: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            heightAnchor.constraint(equalTo: superView.heightAnchor,
                                    multiplier: proportionalHeight)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
