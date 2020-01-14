//
//  OperatorsView.swift
//  CountOnMe
//
//  Created by Oscar RENIER on 30/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

// MARK: - Class used to wrapp the view inside the storyboard
class WrapperOperatorsView: UIView {

    var contentView: OperatorsView

    required init?(coder aDecoder: NSCoder) {
        contentView = OperatorsView.loadViewFromNib()
        super.init(coder: aDecoder)
        addContentViewWithConstraints(contentView)
    }
}

// MARK: - Delegate protocol to communicate with the controller
protocol OperatorsViewDelegate: class {
    func tappedOperatorButton(_ sender: UIButton)
}

/// View that contains all the operators
class OperatorsView: UIStackView {

    /// Delegate used to notify the controller whenever an operator button is tapped
    weak var delegate: OperatorsViewDelegate?

    /// Method called whenever an operator button is tapped
    @IBAction func tappedOpertorButton(_ sender: UIButton) {
        delegate?.tappedOperatorButton(sender)
    }

    // MARK: - Loading the View
    static func loadViewFromNib() -> OperatorsView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing:self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! OperatorsView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
