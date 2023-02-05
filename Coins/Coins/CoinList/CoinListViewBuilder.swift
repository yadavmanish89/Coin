//
//  CoinListViewBuilder.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation
import UIKit

class CoinListViewBuilder {
    static func buildCoinListView() -> UIViewController? {
        let networkManager = NetworkManager()
        let coinListNetworkManager = CoinListNetworkManager(networkManager: networkManager)
        let viewModel = CoinListViewModel(coinListNetworkManager: coinListNetworkManager)
        let tableView = ViewBuilder.buildTableView()
        let viewController = CoinListViewController(tableView: tableView,
                                                    viewModel: viewModel)
        return viewController
    }
}
