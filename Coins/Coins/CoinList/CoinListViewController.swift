//
//  CoinListViewController.swift
//  Coins
//
//  Created by manish yadav on 2/5/23.
//

import UIKit

class CoinListViewController: UIViewController {
    private var tableView: UITableView
    var viewModel: CoinListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
        bindViewModel()
        loadData()
    }
     init(tableView: UITableView, viewModel: CoinListViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        let titleImageView = UIImageView(image: UIImage(named: "coinflip"))
        titleImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleImageView
//        self.title = "CoinFlip"
        self.tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: "CoinCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.pinToSuperView(superView: self.view)
    }
    
    private func bindViewModel() {
        self.viewModel?.updateUI = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        self.viewModel?.showError = { [weak self] errorMessage in
            print("Show error message:\(errorMessage)")
            //Reloading Tableview even if error case so tableview can update id ant steal data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    private func loadData() {
        self.viewModel?.fetchCoinList(request: APIRequest.coinList("usd","100"))
    }
    
    func pushDetailViewController(dataModel: CoinModel) {
        let detailViewController = CoinDetailViewBuilder.buildCoinDetailView(dataModel: dataModel)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

