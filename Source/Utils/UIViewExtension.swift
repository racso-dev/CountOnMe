//
//  UIViewExtension.swift
//  CountOnMe
//
//  Created by Oscar RENIER on 04/12/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

extension UIView {
    func addContentViewWithConstraints(_ contentView: UIView) {
        contentView.frame = bounds
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false

        contentView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        contentView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
