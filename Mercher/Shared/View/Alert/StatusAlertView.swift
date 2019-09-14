//
//  StatusAlertView.swift
//  Basket
//
//  Created by Matheus Cardoso kuhn on 13/09/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit

public enum StatusType {
    case error
    case info
    case success
    case warning
    
    var icon: UIImage? {
        switch self {
        case .error:
            return UIImage(named: "error")
        case .info:
            return UIImage(named: "info")
        case .success:
            return UIImage(named: "success")
        case .warning:
            return UIImage(named: "warning")
        }
    }
}

protocol StatusAlertDelegate {
    func didTouchUpInsideAction(of tag: Int)
}

public class StatusAlertView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    
    //MARK: - Variables
    var delegate: StatusAlertDelegate?
    private var isTransitionAnimated: Bool = false
    
    //MARK: - Life Cycle
    public init(type: StatusType, title: String?, message: String?, actionTitle: String?) {
        super.init(frame: .zero)
        xib()
        alpha = 0.0
        iconImageView.image = type.icon
        set(title: title)
        set(message: message)
        set(actionTitle: actionTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - IBActions
    @IBAction func pressedAction(_ sender: UIButton) {
        delegate?.didTouchUpInsideAction(of: self.tag)
        if isTransitionAnimated {
            UIView.animate(withDuration: 0.25,
                           animations: {
                            self.alpha = 0.0
            }, completion: { _ in
                self.removeFromSuperview()
            })
        } else {
            removeFromSuperview()
        }
    }
    
    //MARK: - Content
    private func set(title: String?) {
        titleLabel.isHidden = title == nil
        titleLabel.text = title
    }
    
    private func set(message: String?) {
        messageLabel.isHidden = message == nil
        messageLabel.text = message
    }
    
    private func set(actionTitle: String?) {
        actionButton.isHidden = actionTitle == nil
        if let actionTitle = actionTitle {
            let attributedTitle = NSAttributedString(string: actionTitle,
                                                     attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                                  .foregroundColor: UIColor.red])
            actionButton.setAttributedTitle(attributedTitle, for: .normal)
        }
    }
    
    //MARK: - Presentation
    public func present(on view: UIView, animated: Bool) {
        isTransitionAnimated = animated
        view.addSubview(self)
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.alpha = 1.0
            }
        } else {
            alpha = 1.0
        }
    }
}
