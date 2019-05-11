//
//  Identifier.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation

struct Identifier<T>: Codable {
    
    //MARK: - Variables
    let value: Int
    
    //MARK: - Life Cycle
    init(value: Int) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        self.value = try Int(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
