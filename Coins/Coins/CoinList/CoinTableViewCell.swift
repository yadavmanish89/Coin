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
        backgroundColor = .red
                addSubview(name)
                NSLayoutConstraint.activate([
                    name.topAnchor.constraint(equalTo: topAnchor),
                    name.bottomAnchor.constraint(equalTo: bottomAnchor),
                    name.rightAnchor.constraint(equalTo: rightAnchor),
                    name.widthAnchor.constraint(equalTo: heightAnchor)
                ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setData() {
        self.name.text = dataModel?.name
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
