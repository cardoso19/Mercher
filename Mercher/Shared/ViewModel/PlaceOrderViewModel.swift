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

class PlaceOrderViewModel {
    
    //MARK: - Variables
    let listName: String?
    
    //MARK: - Life Cycle
    init(listName: String?) {
        self.listName = listName
    }
}
