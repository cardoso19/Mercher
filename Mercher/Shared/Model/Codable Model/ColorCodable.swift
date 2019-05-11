//
//  ColorCodable.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit

struct ColorCodable: Codable {
    
    //MARK: - Variables
    let value: UIColor?
    
    //MARK: - Life Cycle
    init(value: UIColor?) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        self.value = try UIColor(hexString: String(from: decoder))
    }
    
    func encode(to encoder: Encoder) throws {
        try value?.convertToHexString().encode(to: encoder)
    }
}
