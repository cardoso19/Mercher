//
//  NSNumberCodable.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation

struct NSNumberCodable: Codable {
    
    //MARK: - Variables
    let value: NSNumber?
    
    //MARK: - Life Cycle
    init(value: NSNumber?) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        self.value = try NSNumber(value: Double(from: decoder))
    }
    
    func encode(to encoder: Encoder) throws {
        try value?.doubleValue.encode(to: encoder)
    }
}
