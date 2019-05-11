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

class ListViewModel {
    
    //MARK: - Lists
    let cornerRadius: CGFloat = 6.0
    let cornersDetail: [UIView.Corner] = [.bottomLeft, .bottomRight]
    let gradientLocations: [NSNumber] = [0.0, 1.0]
    let gradientStartPoint = CGPoint(x: 0.0, y: 0.0)
    let gradientEndPoint = CGPoint(x: 1.0, y: 0.0)
    var lists: BehaviorRelay<[List]> = BehaviorRelay(value: [])
    
    func described(date: Date?) -> String? {
        return date?.convertToString(onFormat: "d MMM yyyy")
    }
    
    func described(days: Int) -> String {
        return String(format: "%.2d", days) + " days"
    }
    
    func described(totalItems: Int) -> String {
        return "\(totalItems)"
    }
    
    func described(amount: NSNumber?) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: amount ?? 0.0) ?? "$\(amount?.doubleValue ?? 0)"
    }
    
    func gradient(with color: UIColor) -> [CGColor] {
        return [color.cgColor, color.withAlphaComponent(0.7).cgColor]
    }
    
    func mockLists() {
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
                              name: Name<List>(value: "List \(index)"),
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
}
