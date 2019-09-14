//
//  ProductsViewModel.swift
//  Basket
//
//  Created by Davi Bispo de Oliveira Alves on 08/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ProductsViewModelLogic {
    var products: BehaviorRelay<[Product]> { get }
    func requestProducts()
}

class ProductsViewModel: ProductsViewModelLogic {
    
    //MARK: Variables
    var products: BehaviorRelay<[Product]> = BehaviorRelay(value: [])
    
    //MARK: - Request
    func requestProducts() {
        let newProducts = [Product(identifier: Identifier<Product>(value: 0),
                                   name: Name<Product>(value: "Pão"),
                                   urlIcon: nil,
                                   value: NSNumberCodable(value: 1.0),
                                   quantity: 1),
                           Product(identifier: Identifier<Product>(value: 1),
                                   name: Name<Product>(value: "Queijo"),
                                   urlIcon: nil,
                                   value: NSNumberCodable(value: 1.0),
                                   quantity: 1),
                           Product(identifier: Identifier<Product>(value: 2),
                                   name: Name<Product>(value: "Presunto"),
                                   urlIcon: nil,
                                   value: NSNumberCodable(value: 1.0),
                                   quantity: 1),
                           Product(identifier: Identifier<Product>(value: 3),
                                   name: Name<Product>(value: "Geleia"),
                                   urlIcon: nil,
                                   value: NSNumberCodable(value: 1.0),
                                   quantity: 1),
                           Product(identifier: Identifier<Product>(value: 4),
                                   name: Name<Product>(value: "Linguiça"),
                                   urlIcon: nil,
                                   value: NSNumberCodable(value: 1.0),
                                   quantity: 1),
                           Product(identifier: Identifier<Product>(value: 5),
                                   name: Name<Product>(value: "Farofa"),
                                   urlIcon: nil,
                                   value: NSNumberCodable(value: 1.0),
                                   quantity: 1)]
        products.accept(newProducts)
    }
}
