//
//  CoinDetailViewController.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import UIKit

class CoinDetailViewController: UIViewController {
    var viewModel: CoinDetailViewModel
    init(viewModel: CoinDetailViewModel) {
       self.viewModel = viewModel
       super.init(nibName: nil, bundle: nil)
   }
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
    
    
}
