//
//  Name.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation

struct Name<T>: Codable {
    
    //MARK: - Variables
    let value: String
    
    //MARK: - Life Cycle
    init(value: String) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        self.value = try String(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
