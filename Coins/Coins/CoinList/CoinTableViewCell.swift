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
    var coinImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.titleFont()
        nameLabel.textColor = UIColor.themeColor()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .vertical)
        return nameLabel
    }()
    var symbol: UILabel = {
        let symbolLabel = UILabel()
        symbolLabel.font = UIFont.subTitleFont()
        symbolLabel.textColor = UIColor.lightTextColor()
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        return symbolLabel
    }()

    var priceUpDownImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    var price: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textAlignment = .right
        priceLabel.font = UIFont.titleFont()
        priceLabel.textColor = UIColor.themeColor()
        priceLabel.backgroundColor = .clear
        priceLabel.setContentHuggingPriority(.required,
                                             for: .horizontal)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addNameLabel()
        self.backgroundColor = .clear
    }
    
    private func addNameLabel() {
        addSubview(coinImageView)
        
        let nameSymbolStackView = embedNameSymbolInVStackView()
        addSubview(nameSymbolStackView)
        nameSymbolStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(priceUpDownImageView)
        addSubview(price)
        
        NSLayoutConstraint.activate([
            
            coinImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            coinImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coinImageView.widthAnchor.constraint(equalToConstant: 40),
            coinImageView.heightAnchor.constraint(equalToConstant: 40),

            nameSymbolStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            nameSymbolStackView.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 10.0),
            nameSymbolStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0),
            nameSymbolStackView.trailingAnchor.constraint(equalTo: priceUpDownImageView.leadingAnchor, constant: 10.0),

            
            priceUpDownImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceUpDownImageView.widthAnchor.constraint(equalToConstant: 40.0),
            priceUpDownImageView.heightAnchor.constraint(equalToConstant: 40.0),
            priceUpDownImageView.trailingAnchor.constraint(equalTo: price.leadingAnchor, constant: -5.0),

            price.centerYAnchor.constraint(equalTo: centerYAnchor),
            price.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0)
        ])
    }
    
    private func embedNameSymbolInVStackView() -> UIStackView {
        let vStackView = UIStackView(arrangedSubviews: [
            name, symbol
        ])
        vStackView.axis = .vertical
        vStackView.distribution = .equalCentering
        return vStackView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setData() {
        if let dataModel = dataModel {
            self.name.text = dataModel.name
            self.symbol.text = dataModel.symbol
            let currentPrice = String(format: "%.2f", dataModel.current_price)
            self.price.text = currentPrice
            self.coinImageView.image = UIImage(named: "btc")
            self.priceUpDownImageView.image = dataModel.price_change_24h > 0 ? UIImage(named: "uparrow") : UIImage(named: "downarrow")
            self.coinImageView.downloadImageFrom(urlString: dataModel.image)
        }
    }
}
