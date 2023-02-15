//
//  UIColor.swift
//  Coins
//
//  Created by manish yadav on 2/14/23.
//

import Foundation
import UIKit
extension UIImageView {
    func downloadImageFrom(urlString: String) {
        if let url = URL(string: urlString) {
            print("Image download----\(urlString)")
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }.resume()
        }
    }
}
