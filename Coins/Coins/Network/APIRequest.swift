//
//  APIRequest.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

protocol RequestProtocol {
    var url: String { get }
    var queryString: String { get }
    var httpHeaders: [String : String]? { get }
    var method: String { get }
}

/* https://pro-api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false
 */
enum APIRequest: RequestProtocol {
    case coinList(String, String) // vs_currency, per_page
    var baseURL: String {
        return "https://api.coingecko.com/api/v3/"
    }
    var endPoint: String {
        return "coins/markets"
    }
    var url: String {
        switch self {
        case .coinList:
            return "\(baseURL)\(endPoint)?\(queryString)"
        }
    }
    var queryString: String {
        switch self {
            case .coinList(let currency, let perPage):
            return getQueryString(currency: currency,
                                  perPage: perPage)
        }
    }
    var httpHeaders: [String: String]? {
        switch self {
        case .coinList:
            return ["Accept": "application/json"]
        }
    }
    var method: String {
        return "GET"
    }
    
    private func getQueryString(currency: String, perPage: String) -> String {
        return "vs_currency=\(currency)&per_page=\(perPage)"
    }
}
