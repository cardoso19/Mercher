//
//  UIViewExtension.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 11/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit

extension UIView {
    
    func xib() {
        let bundle  = Bundle(for: type(of: self))
        guard
            let nibName = type(of: self).description().components(separatedBy: ".").last,
            let view = UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: self, options: nil).first as? UIView
            else {
                return
        }
        switch bounds {
        case .zero:
            frame = view.bounds
        default:
            view.frame = bounds
        }
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        view.layoutIfNeeded()
    }
    
    enum Corner {
        case topRight
        case topLeft
        case bottomRight
        case bottomLeft
    }
    
    func add(cornerRadius: CGFloat, on corners: [Corner]? = nil) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        guard let corners = corners else { return }
        var cornerMasks: [CACornerMask] = []
        for corner in corners {
            switch corner {
            case .topRight:
                cornerMasks.append(.layerMaxXMinYCorner)
            case .topLeft:
                cornerMasks.append(.layerMinXMinYCorner)
            case .bottomRight:
                cornerMasks.append(.layerMaxXMaxYCorner)
            case .bottomLeft:
                cornerMasks.append(.layerMinXMaxYCorner)
            }
        }
        self.layer.maskedCorners = CACornerMask(cornerMasks)
    }
    
    func addGradient(with colors: [CGColor], locations: [NSNumber]?, startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.zPosition = -1
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.addSublayer(gradientLayer)
    }
}
