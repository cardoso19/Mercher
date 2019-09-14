//
//  PlaceOrderViewController.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PlaceOrderViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableViewProducts: UITableView!
    @IBOutlet weak var tableViewCartSummary: UITableView!
    @IBOutlet weak var labelCartSummary: UILabel!
    @IBOutlet weak var labelTotalAmountTitle: UILabel!
    @IBOutlet weak var labelTotalAmountValue: UILabel!
    @IBOutlet weak var buttonPlaceOrder: UIButton!
    
    //MARK: - Variables
    var viewModel: PlaceOrderViewModelLogic!
    let disposeBag = DisposeBag()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel.listName
        render()
        localizeLabels()
    }
    
    func localizeLabels() {
        labelCartSummary.text = NSLocalizedString("Cart Summary", comment: "")
        labelTotalAmountTitle.text = NSLocalizedString("Total Amount", comment: "")
        buttonPlaceOrder.setTitle(NSLocalizedString("Place Order", comment: ""), for: .normal)
    }
    
}

//MARK: - Whitelabel
extension PlaceOrderViewController: Whitelabel {
    func render() {
        
    }
}
