//
//  NetworkManager.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Decodable>(request: RequestProtocol,
                               completion: @escaping(Result<T, NetworkError>) -> Void)
}

class NetworkManager: NetworkProtocol {
    func request<T>(request: RequestProtocol, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        
        guard let url = URL(string: request.url) else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.httpHeaders
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let data = data else {
                completion(.failure(.badResponse))
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let responseModel = try jsonDecoder.decode(T.self, from: data)
                completion(.success(responseModel))
            } catch(let err) {
                debugPrint("Errow while parsing:\(err.localizedDescription)")
                completion(.failure(.parsingError))
            }
            debugPrint("Response")
        }.resume()
         //
    }
}
