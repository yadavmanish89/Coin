//
//  APIRequest.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

protocol RequestProtocol {
    var url: String { get }
    var httpHeaders: [String : String]? { get }
    var method: String { get }
}

let baseURL = "https://pro-api.coingecko.com/api/v3/"
// coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false'
enum APIRequest: RequestProtocol {
    case coinList
    case coinDetail(String)
    
    var url: String {
        switch self {
        case .coinList:
            return "\(baseURL)/resource/s3k6-pzi2.json"
        case .coinDetail(let id):
            return "\(baseURL)/resource/f9bf-2cp4.json?dbn=\(id)"
        }
    }
    var httpHeaders: [String: String]? {
        return nil
    }
    var method: String {
        return "GET"
    }
}
