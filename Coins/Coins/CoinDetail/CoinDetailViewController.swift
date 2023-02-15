//
//  CoinDetailViewController.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import UIKit

class CoinDetailViewController: UIViewController {
    var viewModel: CoinDetailViewModel
    
    let titleView: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = .themeColor
        titleLabel.font = UIFont.largeTitleFont
        return titleLabel
    }()
    var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        return view
    }()
    var imageView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .white
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.largeTitleFont
        nameLabel.setContentCompressionResistancePriority(.required,
                                            for: .horizontal)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    var price: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textAlignment = .center
//        priceLabel.font = UIFont.extraLargeTitleFont()
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
        addHeaderView()
        setUpStackView()
        loadImage()
        populateData()
        addBackButton()
    }
    func addBackButton() {
        
        let insets = UIEdgeInsets(
            top: 0.0,
            left: -20.0,
            bottom: 0,
            right: 20.0)
        let backButton = UIButton(type: .custom)
        backButton.addTarget(self,
                             action: #selector(backButtonTap),
                             for: .touchUpInside)
        let buttonImage = UIImage(named: "chevronleft")?.withTintColor(.themeColor)
        backButton.setImage(buttonImage,
                            for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        let leftBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    @objc private func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    private func getHorizontalStackWith(caption: String, value: String) -> UIStackView {
        let captionLabel = ViewBuilder.getLabel(text: caption,
                                                textColor: .textColor,
                                                font:  UIFont.largeTitleFont)
        let valueLabel = ViewBuilder.getLabel(text: value,
                                                textColor: .textColor,
                                                font:  UIFont.largeTitleFont)
        let hStackView = UIStackView(arrangedSubviews: [captionLabel, valueLabel])
        return hStackView
    }
    private func getSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = .separatorColor
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        return view
    }
    private func addHeaderView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        view.addSubview(imageView)
        headerView.pinToSuperView(superView: self.view,
                                 proportionalHeight: 4.0/11.0)

        let nameSymbolPriceStackView = embedImagePriceInVStackView()
        self.view.addSubview(nameSymbolPriceStackView)
        nameSymbolPriceStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameSymbolPriceStackView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            nameSymbolPriceStackView.heightAnchor.constraint(equalTo:
                                                                headerView.heightAnchor,
                                                             multiplier: 5.0/11.0),

            nameSymbolPriceStackView.topAnchor.constraint(equalTo:
                                                            self.view.safeAreaLayoutGuide.topAnchor)])
    }
    private func embedImagePriceInVStackView() -> UIStackView {
        let vStackView = UIStackView(arrangedSubviews: [
            imageView, price
        ])
        vStackView.axis = .vertical
        vStackView.distribution = .equalCentering
        vStackView.spacing = 2
        return vStackView
    }
    private func setUpStackView() {
        let changeIn24Hour = changeIn24HourView()
        let low24Hr = viewModel.getLow24Hr()
        let high24Hr = viewModel.getHigh24Hr()
        let marketRank = viewModel.getMarketRank()
        let totalVolume = viewModel.getTotalVolume()
        let marketCap = viewModel.getMarketCap()
        let vStackView = UIStackView(arrangedSubviews: [
            changeIn24Hour,
            getSeparatorView(),
            getHorizontalStackWith(caption: "Rank", value: marketRank),
            getSeparatorView(),
            getHorizontalStackWith(caption: "24 Hour Low", value: low24Hr),
            getSeparatorView(),
            getHorizontalStackWith(caption: "24 Hour High", value: high24Hr),
            getSeparatorView(),
            getHorizontalStackWith(caption: "Volume", value: totalVolume),
            getSeparatorView(),
            getHorizontalStackWith(caption: "Market Cap", value: marketCap),
            getSeparatorView()

        ])
        vStackView.axis = .vertical
        vStackView.distribution = .fillProportionally
        vStackView.spacing = 15.0
        self.view.addSubview(vStackView)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0)])
        
        let buySellStackView = buySellStackView()
        buySellStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buySellStackView)
        NSLayoutConstraint.activate([
            buySellStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buySellStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            buySellStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0),
        buySellStackView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    func loadImage(){
        self.imageView.downloadImageFrom(urlString: viewModel.getImageUrl())

        imageView.layer.cornerRadius = imageView.frame.height/2.0
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print("did.. layout:\(imageView.frame.height)")
//
//        imageView.layer.cornerRadius = imageView.frame.height/2.0
//        imageView.clipsToBounds = true
//        imageView.layer.masksToBounds = true
//    }
    func populateData(){
        self.navigationItem.titleView = titleView
        self.titleView.text = viewModel.getName()
        self.price.addAttributedText(
            text: "$ \(viewModel.getCurrentPrice())",
            font: UIFont.extraLargeTitleFont,
            textColor: .themeColor,
            lineSpacing: 20.0
        )
        self.name.text = viewModel.getName()
    }
    
    private func changeIn24HourView() -> UIStackView {
        
        let captionLabel = ViewBuilder.getLabel(text: "Change in 24 hour",
                                                textColor: .themeColor,
                                                font: .titleFont)
        captionLabel.setContentCompressionResistancePriority(.required,
                                                             for: .horizontal)
        let priceChangeIn24Hour = viewModel.getPriceChange24Hr()
        let priceChangeImage = priceChangeIn24Hour > 0 ? UIImage(named: "upgreen") : UIImage(named: "downred")
        let changeImageView = ViewBuilder.getImageView(image: priceChangeImage)
        let value = String(format: "%.3f",viewModel.getPriceChange24Hr())
        let valueLabel = ViewBuilder.getLabel(
            text: value,
            textColor: .textColor,
            font: .titleFont)
        valueLabel.setContentCompressionResistancePriority(.required,
                                                             for: .horizontal)

        let hStackView = UIStackView(arrangedSubviews: [
            captionLabel,
            changeImageView,
            valueLabel
        ])
        hStackView.axis = .horizontal
        hStackView.distribution = .fillProportionally
        hStackView.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        return hStackView
    }
    
    private func buySellStackView() -> UIStackView {
        let buyButton = ViewBuilder.getButton(title: "Buy",
                                              titleColor: .textColor,
                                              font: .largeTitleFont,
                                              bgColor: .themeColor)
        buyButton.setContentCompressionResistancePriority(.required,
                                                          for: .horizontal)
        buyButton.setContentHuggingPriority(.defaultLow,
                                            for: .horizontal)
        let sellButton = ViewBuilder.getButton(title: "Sell",
                                               titleColor: .textColor,
                                               font: .largeTitleFont,
                                               bgColor: .themeColor)
        sellButton.setContentCompressionResistancePriority(.required,
                                                          for: .horizontal)
        sellButton.setContentHuggingPriority(.defaultLow,
                                            for: .horizontal)
        let hStackView = UIStackView(arrangedSubviews: [buyButton, sellButton])
        hStackView.spacing = 20.0
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        return hStackView
    }
}
