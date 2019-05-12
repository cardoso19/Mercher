//
//  ListTableViewController.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ListTableViewController: UITableViewController {

    //MARK: - Variables
    let viewModel = ListViewModel()
    let disposeBag = DisposeBag()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configDataSourceAndDelegate()
        render()
        viewModel.mockLists()
        observerCellForRow()
        observerDidSelectCell()
    }
    
    func configDataSourceAndDelegate() {
        tableView.delegate = nil
        tableView.dataSource = nil
    }

    //MARK: - UITableViewDelegate
    func observerDidSelectCell() {
        tableView.rx.itemSelected.subscribe { selectedIndexPath in
            self.performSegue(withIdentifier: "Products", sender: nil)
        }.disposed(by: disposeBag)
    }
    
    // MARK: - UITableViewDataSource
    func observerCellForRow() {
        viewModel.lists.bind(to: tableView.rx.items(cellIdentifier: "List", cellType: ListTableViewCell.self)) { index, data, cell in
            cell.viewList.add(cornerRadius: self.viewModel.cornerRadius)
            cell.imageViewUser.add(cornerRadius: self.viewModel.roudedCorner(on: cell.imageViewUser.bounds))
            cell.viewListDetail.add(cornerRadius: self.viewModel.cornerRadius, on: self.viewModel.cornersDetail)
            cell.viewList.backgroundColor = .white
            if let color = data.color.value {
                cell.viewList.addGradient(with: self.viewModel.gradient(with: color),
                                          locations: self.viewModel.gradientLocations,
                                          startPoint: self.viewModel.gradientStartPoint,
                                          endPoint: self.viewModel.gradientEndPoint)
            }
            cell.labelPaybleAmountValue.textColor = data.color.value
            cell.labelListName.text = data.name.value
            cell.labelDueDateValue.text = self.viewModel.described(date: data.dueDate.value)
            cell.labelDelayByValue.text = self.viewModel.described(days: data.delayBy)
            cell.labelLastUpdateValue.text = self.viewModel.described(date: data.lastUpdate.value)
            cell.labelTotalItemsValue.text = self.viewModel.described(totalItems: data.totalItems)
            cell.labelPaybleAmountValue.text = self.viewModel.described(amount: data.paybleAmount.value)
        }.disposed(by: disposeBag)
    }
}

//MARK: - Whitelabel
extension ListTableViewController: Whitelabel {
    func render() {
        
    }
}
