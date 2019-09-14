//
//  List.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit

struct List: Codable {
    
    var identifier: Identifier<List>
    var name: Name<List>
    var color: ColorCodable
    var urlImageUser: String?
    var dueDate: DateCodable
    var delayBy: Int
    var lastUpdate: DateCodable
    var totalItems: Int
    var paybleAmount: NSNumberCodable
}
