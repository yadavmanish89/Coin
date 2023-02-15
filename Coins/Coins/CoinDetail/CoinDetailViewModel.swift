//
//  CoinDetailViewModel.swift
//  Coins
//
//  Created by manish yadav on 2/14/23.
//

import Foundation

class CoinDetailViewModel {
    private var dataModel: CoinModel!
    init(dataModel: CoinModel) {
        self.dataModel = dataModel
    }
    
    func getLow24Hr() -> String {
        return "\(dataModel.low_24h)"
    }
    func getHigh24Hr() -> String {
        return "\(dataModel.high_24h)"
    }
    func getMarketRank() -> String {
        return "\(dataModel.market_cap_rank)"
    }
    func getTotalVolume() -> String {
        return "\(dataModel.total_volume)"
    }
    func getMarketCap() -> String {
        return "\(dataModel.market_cap)"
    }
    func getImageUrl() -> String {
        return dataModel.image
    }
    func getName() -> String {
        return dataModel.name
    }
    func getCurrentPrice() -> String {
        return "\(dataModel.current_price)"
    }
    func getPriceChange24Hr() -> Double {
        return dataModel.price_change_24h
    }
}
