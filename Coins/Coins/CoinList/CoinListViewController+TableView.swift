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
        self.viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? CoinTableViewCell else {
            return UITableViewCell()
        }
        cell.dataModel = self.viewModel?.itemAtIndexPath(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedModel = self.viewModel?.itemAtIndexPath(index: indexPath.row) {
            self.pushDetailViewController(dataModel: selectedModel)
        }
    }
}
