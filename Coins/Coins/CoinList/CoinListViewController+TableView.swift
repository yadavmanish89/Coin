//
//  CoinListViewController+TableView.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import Foundation
import UIKit

extension CoinListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? CoinTableViewCell else {
            return UITableViewCell()
        }
        let dataModel = CoinModel(id: "23",
                                  symbol: "23",
                                  name: "Name:\(indexPath.row)",
                                  image: "",
                                  current_price: "",
                                  market_cap: "",
                                  market_cap_rank: "")

        
        cell.dataModel = dataModel
        return cell
    }
    
}
