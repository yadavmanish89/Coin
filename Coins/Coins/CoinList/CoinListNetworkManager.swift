//
//  CoinListNetworkManager.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

protocol CoinListNetworkProtocol {
    func fetchCoinList(request: RequestProtocol, completion: @escaping (Result<[CoinModel], NetworkError>) -> Void)
}

class CoinListNetworkManager: CoinListNetworkProtocol {
    private let networkManager: NetworkProtocol
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    func fetchCoinList(request: RequestProtocol, completion: @escaping (Result<[CoinModel], NetworkError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
}
