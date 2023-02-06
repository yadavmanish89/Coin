//
//  CoinModel.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

struct Ping: Codable {
    var gecko_says: String?
}

struct CoinModel: Codable {
    var id: String
    var symbol: String
    var name: String
    var image: String
    var current_price: Double
    var market_cap: Double
    var market_cap_rank: Int
}
