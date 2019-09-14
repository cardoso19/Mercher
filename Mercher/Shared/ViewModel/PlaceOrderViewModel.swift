//
//  PlaceOrderViewModel.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol PlaceOrderViewModelLogic {
    var listName: String? { get }
    init(listName: String?)
}

class PlaceOrderViewModel: PlaceOrderViewModelLogic {
    
    //MARK: - Variables
    var listName: String?
    
    //MARK: - Life Cycle
    required init(listName: String?) {
        self.listName = listName
    }
}
