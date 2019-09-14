//
//  Product.swift
//  Basket
//
//  Created by Davi Bispo de Oliveira Alves on 08/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation

struct Product: Codable {
    
    let identifier: Identifier<Product>
    let name: Name<Product>
    let urlIcon: String?
    let value: NSNumberCodable
    var quantity: Int
}
