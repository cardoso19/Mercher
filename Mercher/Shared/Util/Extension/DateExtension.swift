//
//  DateExtension.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToString(onFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func dateByAdding(days: Int) -> Date {
        var dateComp = DateComponents()
        dateComp.day = days
        return Calendar.current.date(byAdding: dateComp, to: self)!
    }
}
