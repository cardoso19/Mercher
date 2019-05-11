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
        let productCollection: BehaviorRelay = BehaviorRelay<[Product]>(value: [Product(identifier: Identifier<Product>(value: 0),
                                                                                        name: Name<Product>(value: "Pão")),
                                                                                Product(identifier: Identifier<Product>(value: 1),
                                                                                        name: Name<Product>(value: "Queijo")),
                                                                                Product(identifier: Identifier<Product>(value: 2),
                                                                                        name: Name<Product>(value: "Presunto")),
                                                                                Product(identifier: Identifier<Product>(value: 3),
                                                                                        name: Name<Product>(value: "Geleia")),
                                                                                Product(identifier: Identifier<Product>(value: 4),
                                                                                        name: Name<Product>(value: "Linguiça")),
                                                                                Product(identifier: Identifier<Product>(value: 5),
                                                                                        name: Name<Product>(value: "Farofa"))])
    }
    
    //MARK: Variables
    let state: State = State()
    
    //MARK: Functions
    
}
