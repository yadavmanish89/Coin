//
//  CoinDetailViewController.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import UIKit

class CoinDetailViewController: UIViewController {
    var viewModel: CoinDetailViewModel
    var imageView = UIImageView(image: UIImage(named: "mountains"))
    var contentView = UIView()
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
            vStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
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
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .green
        view.addSubview(imageView)
        imageView.pinToSuperView(superView: self.view,
                                 proportionalHeight: 2.0/7.0)
    }
}
