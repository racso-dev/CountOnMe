//
//  ComposeView.swift
//  CountOnMe
//
//  Created by Oscar RENIER on 30/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

// MARK: - Class used to wrapp the view inside the storyboard
class WrapperComposeView: UIView {

    var contentView: ComposeView

    required init?(coder aDecoder: NSCoder) {
        contentView = ComposeView.loadViewFromNib()
        super.init(coder: aDecoder)
        addContentViewWithConstraints(contentView)
    }
}

// MARK: - Delegate protocol to communicate with the controller
protocol ComposeViewDelegate: class {
    func tappedNumberButton(_ sender: UIButton)
}

/// View that contains all the number to compose expressions
class ComposeView: UIStackView {

    /// Delegate used to notify the controller whenever a number button is tapped
    weak var delegate: ComposeViewDelegate?

    /// Method called whenever a number button is tapped
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        delegate?.tappedNumberButton(sender)
    }

    // MARK: - Loading the View
    static func loadViewFromNib() -> ComposeView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing:self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! ComposeView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
