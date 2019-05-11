//
//  List.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit

class List: Codable {
    
    //MARK: - Variables
    var identifier: Identifier<List>
    var name: Name<List>
    var color: ColorCodable
    var urlImageUser: String?
    var dueDate: DateCodable
    var delayBy: Int
    var lastUpdate: DateCodable
    var totalItems: Int
    var paybleAmount: NSNumberCodable
    
    //MARK: - Life Cycle
    init(identifier: Identifier<List>, name: Name<List>, color: ColorCodable, urlImageUser: String?, dueDate: DateCodable, delayBy: Int, lastUpdate: DateCodable, totalItems: Int, paybleAmount: NSNumberCodable) {
        self.identifier = identifier
        self.name = name
        self.color = color
        self.urlImageUser = urlImageUser
        self.dueDate = dueDate
        self.delayBy = delayBy
        self.lastUpdate = lastUpdate
        self.totalItems = totalItems
        self.paybleAmount = paybleAmount
    }
}
