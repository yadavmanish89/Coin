//
//  CoinTableViewCell.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    var dataModel: CoinModel? {
        didSet {
            self.setData()
        }
    }
    var image: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    var price: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addNameLabel()
    }
    
    private func addNameLabel() {
        name.textAlignment = .left
        price.textAlignment = .left
        price.backgroundColor = .yellow
        name.backgroundColor = .green
        addSubview(name)
        addSubview(price)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor),
            name.leadingAnchor.constraint(equalTo: leadingAnchor),
            name.bottomAnchor.constraint(equalTo: bottomAnchor),
            name.trailingAnchor.constraint(equalTo: price.leadingAnchor),
            
            price.topAnchor.constraint(equalTo: topAnchor),
            price.widthAnchor.constraint(equalToConstant: 100.0),
            price.bottomAnchor.constraint(equalTo: bottomAnchor),
            price.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setData() {
        if let dataModel = dataModel {
            self.name.text = dataModel.name
            self.price.text = "\(dataModel.current_price)"
        }
    }
}
