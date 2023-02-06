//
//  CoinDetailViewController.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import UIKit

class CoinDetailViewController: UIViewController {
    var viewModel: CoinDetailViewModel
    
    var headerView: UIView = {
        let view = UIView()
        return view
    }()
    var imageView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.largeTitleFont()
        nameLabel.setContentCompressionResistancePriority(.required,
                                            for: .horizontal)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    var price: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.titleFont()
        priceLabel.setContentHuggingPriority(.required,
                                             for: .horizontal)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    init(viewModel: CoinDetailViewModel) {
       self.viewModel = viewModel
       super.init(nibName: nil, bundle: nil)
   }
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addImageView()
        setUpStackView()
        loadImage()
        populateData()
    }
    
    private func setUpStackView() {
        let low24Hr = viewModel.getLow24Hr()
        let high24Hr = viewModel.getHigh24Hr()
        let marketRank = viewModel.getHigh24Hr()
        let vStackView = UIStackView(arrangedSubviews: [
            getHorizontalStackWith(caption: "Market Rank", value: marketRank),
            getHorizontalStackWith(caption: "24 Hour Low", value: low24Hr),
            getHorizontalStackWith(caption: "24 Hour High", value: high24Hr)
        ])
        vStackView.axis = .vertical
        vStackView.distribution = .fillProportionally
        self.view.addSubview(vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    private func getHorizontalStackWith(caption: String, value: String) -> UIStackView {
        let captionLabel = UILabel()
        captionLabel.text = caption
        let valueLabel = UILabel()
        valueLabel.text = value
        let hStackView = UIStackView(arrangedSubviews: [captionLabel, valueLabel])
        return hStackView
    }
    
    private func addImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
//        headerView.backgroundColor = .lightGray
        view.addSubview(headerView)
        view.addSubview(imageView)
        headerView.pinToSuperView(superView: self.view,
                                 proportionalHeight: 2.0/7.0)

        let nameSymbolPriceStackView = embedNameSymbolPriceInVStackView()
        self.view.addSubview(nameSymbolPriceStackView)
        nameSymbolPriceStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //        nameSymbolPriceStackView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0.0),
            nameSymbolPriceStackView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            nameSymbolPriceStackView.heightAnchor.constraint(equalTo:
                                                                headerView.heightAnchor,
                                                             multiplier: 1.0/2.0),

            nameSymbolPriceStackView.topAnchor.constraint(equalTo:
                                                            self.view.safeAreaLayoutGuide.topAnchor, constant: -20.0)])
    }
    private func embedNameSymbolPriceInVStackView() -> UIStackView {
        let vStackView = UIStackView(arrangedSubviews: [
            name, imageView, price
        ])
        vStackView.axis = .vertical
        vStackView.distribution = .equalCentering
        vStackView.spacing = 2
        return vStackView
    }
    func loadImage(){
        self.imageView.downloadImageFrom(urlString: viewModel.getImageUrl())
    }
    func populateData(){
        self.price.text = viewModel.getCurrentPrice()
        self.name.text = viewModel.getName()
    }
}
