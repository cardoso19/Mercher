//
//  ListViewModel.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol ListViewModelLogic {
    var lists: BehaviorRelay<[List]> { get }
    var isLoaderVisible: BehaviorRelay<Bool> { get }
    var noContent: BehaviorRelay<Bool> { get }
    func described(date: Date?) -> String?
    func described(days: Int) -> String
    func described(totalItems: Int) -> String
    func described(amount: NSNumber) -> String?
    func requestList()
    func halfWidth(of rect: CGRect) -> CGFloat
}

class ListViewModel: ListViewModelLogic {
    
    //MARK: - Variables
    var lists: BehaviorRelay<[List]> = BehaviorRelay(value: [])
    var isLoaderVisible: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var noContent: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    //MARK: - Presenter
    func described(date: Date?) -> String? {
        return date?.convertToString(onFormat: "d MMM yyyy")
    }
    
    func described(days: Int) -> String {
        let dayText: String!
        if days == 1 {
            dayText = NSLocalizedString("Day", comment: "")
        } else {
            dayText = NSLocalizedString("Days", comment: "")
        }
        return String(format: "%.2d %@", days, dayText) 
    }
    
    func described(totalItems: Int) -> String {
        return "\(totalItems)"
    }
    
    func described(amount: NSNumber) -> String? {
        return amount.localizedCurrency()
    }
    
    //MARK: - Request
    func requestList() {
        var lists: [List] = []
        for index in 0...3 {
            let color: ColorCodable!
            switch index {
            case 0:
                color = ColorCodable(value: #colorLiteral(red: 0.2196078431, green: 0.7803921569, blue: 0.7607843137, alpha: 1))
            case 1:
                color = ColorCodable(value: #colorLiteral(red: 0.6392156863, green: 0.5450980392, blue: 0.9215686275, alpha: 1))
            case 2:
                color = ColorCodable(value: #colorLiteral(red: 1, green: 0.8549019608, blue: 0.1725490196, alpha: 1))
            case 3:
                color = ColorCodable(value: #colorLiteral(red: 0.9450980392, green: 0.4352941176, blue: 0.6274509804, alpha: 1))
            default:
                color = ColorCodable(value: #colorLiteral(red: 0.2196078431, green: 0.7803921569, blue: 0.7607843137, alpha: 1))
            }
            lists.append(List(identifier: Identifier<List>(value: index),
                              name: Name<List>(value: "List Name of Number \(index)"),
                              color: color,
                              urlImageUser: nil,
                              dueDate: DateCodable(value: Date().dateByAdding(days: 30)),
                              delayBy: 9 + index,
                              lastUpdate: DateCodable(value: Date()),
                              totalItems: 40 * (index + 1),
                              paybleAmount: NSNumberCodable(value: NSNumber(value: 127 * (index + 1)))))
        }
        self.lists.accept(lists)
    }
    
    //MARK: - Business
    func halfWidth(of rect: CGRect) -> CGFloat {
        return rect.width / 2
    }
}
