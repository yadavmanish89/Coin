//
//  NetworkError.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .parsingError:
            return "Parsing Error"
        case .badResponse:
            return "Bad Response from server"
        case .emptyValues:
            return "No value Found"
        }
    }
    case invalidURL, parsingError, badResponse, emptyValues
}
