//
//  CoinModel.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

struct CoinModel: Codable {
    var id: String?
    var symbol: String?
    var name: String?
    var image: String?
    var current_price: String?
    var market_cap: String?
    var market_cap_rank: String?
}
