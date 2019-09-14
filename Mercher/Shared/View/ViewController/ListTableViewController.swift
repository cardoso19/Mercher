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
    private let viewModel: ListViewModelLogic = ListViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configDataSourceAndDelegate()
        registerTableViewCell()
        render()
        viewModel.requestList()
        observerCellForRow()
        observerDidSelectCell()
    }
    
    private func prepareLayout() {
        navigationItem.title = NSLocalizedString("My Lists", comment: "")
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
    
    func registerTableViewCell() {
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "List")
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
            
            // Layout
            cell.viewList.add(cornerRadius: 6.0)
            cell.imageViewUser.add(cornerRadius: self.viewModel.halfWidth(of: cell.imageViewUser.bounds))
            cell.viewListDetail.add(cornerRadius: 6.0, on: [.bottomLeft, .bottomRight])
            cell.viewList.backgroundColor = .white
            
            // Data Source
            cell.viewList.addGradient(with: [data.color.value.cgColor, data.color.value.withAlphaComponent(0.7).cgColor],
                                      locations: [0.0, 1.0],
                                      startPoint: .zero,
                                      endPoint: CGPoint(x: 1.0, y: 0.0))
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
