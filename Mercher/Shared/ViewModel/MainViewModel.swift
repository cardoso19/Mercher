//
//  MainViewModel.swift
//  Basket
//
//  Created by Davi Bispo de Oliveira Alves on 08/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    
    //MARK: State Variables
    struct State {
        let productCollection: BehaviorRelay = BehaviorRelay<[Product]>(value: [Product(name: "Pão"),Product(name: "Queijo"),Product(name: "Presunto"),Product(name: "Geleia"),Product(name: "Linguiça"),Product(name: "Farofa")])
    }
    
    //MARK: Variables
    let state: State = State()
    
    //MARK: Functions
    
}
