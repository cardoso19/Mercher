//
//  DateCodable.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation

struct DateCodable: Codable {
    
    //MARK: - Variables
    let value: Date?
    
    //MARK: - Life Cycle
    init(value: Date?) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        self.value = try String(from: decoder).convertToDate(ofFormat: "yyyy-MM-dd")
    }
    
    func encode(to encoder: Encoder) throws {
        try value?.convertToString(onFormat: "yyyy-MM-dd").encode(to: encoder)
    }
}
