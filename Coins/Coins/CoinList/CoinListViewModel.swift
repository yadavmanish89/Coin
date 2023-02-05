//
//  CoinListViewModel.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

class CoinListViewModel {
    private var dataModel = [CoinModel]()
    let coinListNetworkManager: CoinListNetworkManager
    init(coinListNetworkManager: CoinListNetworkManager) {
        self.coinListNetworkManager = coinListNetworkManager
    }
    /// To update UI on successful response
    var updateUI: (() -> ())?
    /// To present error alert
    var showError: ((String) -> ())?
    /// Fetch list of coins
    /// - Parameter request: Contains url for fetch coinList
    func fetchCoinList(request: RequestProtocol) {
        self.coinListNetworkManager.fetchCoinList(request: request) { result in
            switch result {
            case .success(let modelArray):
                self.dataModel = modelArray
                self.updateUI?()
                debugPrint("Success:\(modelArray.count)")
            case .failure(_):
                debugPrint("Error")
            }
        }
    }
    /// Return ModelObject for index
    /// - Parameter index: row index of cell
    /// - Returns: Model object to be populated
    func itemAtIndexPath(index: Int) -> CoinModel {
        return self.dataModel[index]
    }
    /// Return number of records for table
    func numberOfRows() -> Int {
        return self.dataModel.count
    }
    /// Create url for fetching coinlList
    /// - Returns: API request having url for CoinList
    func getCoinListRequest() -> RequestProtocol {
        return APIRequest.coinList
    }
}
