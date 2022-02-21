//
//  ViewController.swift
//  RestaurantList
//
//  Created by Jonathan Go on 21.02.22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    var viewModel: RestaurantListViewModel!
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        //tv.dataSource = self
        //tv.delegate = self
        tv.register(RestaurantCell.self, forCellReuseIdentifier: RestaurantCell.reuseIdentifier)
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
       
        setupViews()
        setupHeirarchy()
        setupLayout()
        
        viewModel.fetchRestaurantViewModels().observeOn(MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: RestaurantCell.reuseIdentifier)) { index, viewModel, cell in
            cell.textLabel?.text =  viewModel.displayText
        }.disposed(by: disposeBag)

    }

    private func setupViews() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        //tableView.contentInsetAdjustmentBehavior = .never
        tableView.setContentOffset(.init(x: 0, y: -1), animated: false)
    }
    
    private func setupHeirarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

