//
//  CoinDetailViewBuilder.swift
//  Coins
//
//  Created by manish yadav on 2/14/23.
//

import Foundation
import UIKit

class CoinDetailViewBuilder {
    static func buildCoinDetailView(dataModel: CoinModel) -> UIViewController {
        let viewModel = CoinDetailViewModel(dataModel: dataModel)
        let viewController = CoinDetailViewController(viewModel: viewModel)
        return viewController
    }
}
