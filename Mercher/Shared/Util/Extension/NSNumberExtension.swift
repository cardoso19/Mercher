//
//  NSNumberExtension.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 13/09/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation

extension NSNumber {
    
    func localizedCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: self)
    }
}
