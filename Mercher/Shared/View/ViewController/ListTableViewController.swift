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
        navigationItem.title = NSLocalizedString("My Lists", comment: "")
        configDataSourceAndDelegate()
        render()
        viewModel.mockLists()
        observerCellForRow()
        observerDidSelectCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Order", let destination = segue.destination as? PlaceOrderViewController {
            destination.viewModel = PlaceOrderViewModel(listName: sender as? String)
        }
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
            // Localization
            cell.labelDueDateTitle.text = NSLocalizedString("Due Date", comment: "")
            cell.labelDelayByTitle.text = NSLocalizedString("Delay By", comment: "")
            cell.labelLastUpdateTitle.text = NSLocalizedString("Last Update", comment: "")
            cell.labelTotalItemsTitle.text = NSLocalizedString("Total Items", comment: "")
            cell.labelPayableAmountTitle.text = NSLocalizedString("Payable Amount", comment: "")
            cell.buttonPlaceHorder.setTitle(NSLocalizedString("Place Order", comment: ""), for: .normal)
            
            // Data Source
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
            cell.labelPayableAmountValue.textColor = data.color.value
            cell.labelListName.text = data.name.value
            cell.labelDueDateValue.text = self.viewModel.described(date: data.dueDate.value)
            cell.labelDelayByValue.text = self.viewModel.described(days: data.delayBy)
            cell.labelLastUpdateValue.text = self.viewModel.described(date: data.lastUpdate.value)
            cell.labelTotalItemsValue.text = self.viewModel.described(totalItems: data.totalItems)
            cell.labelPayableAmountValue.text = self.viewModel.described(amount: data.paybleAmount.value)
            cell.buttonPlaceHorder.rx.controlEvent(.touchUpInside).subscribe({ _ in
                self.performSegue(withIdentifier: "Order", sender: self.viewModel.lists.value[index].name.value)
            }).disposed(by: self.disposeBag)
        }.disposed(by: disposeBag)
    }
}

//MARK: - Whitelabel
extension ListTableViewController: Whitelabel {
    func render() {
        
    }
}
