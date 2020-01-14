//
//  DisplayView.swift
//  CountOnMe
//
//  Created by Oscar RENIER on 30/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

// MARK: - Class used to wrapp the view inside the storyboard
class WrapperDisplayView: UIView {

    var contentView: DisplayView

    required init?(coder aDecoder: NSCoder) {
        contentView = DisplayView.loadViewFromNib()
        super.init(coder: aDecoder)
        addContentViewWithConstraints(contentView)
    }
}

/// View that contains the displayed text
class DisplayView: UIView {

    /// Outlet of the current displayed text
    @IBOutlet weak var textLabel: UILabel!

    /// Method that concatenates a given string to the label's text
    func concatDisplayedText(with text: String) {
        textLabel.text! += text
    }

    // MARK: - Loading the View
    static func loadViewFromNib() -> DisplayView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing:self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! DisplayView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
