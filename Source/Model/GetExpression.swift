//
//  GetExpression.swift
//  CountOnMe
//
//  Created by Oscar RENIER on 30/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class GetExpression {

    /// The current expression to analyze
    private var text = ""

    /// The text being parsed into usable expressions
    private var elements: [String] {
        return text.split(separator: " ").map({ "\($0)" })
    }

    /// All operators
    private var operators = ["-", "+", "x", "÷", "="]

    /// Called whenever equal button is pressed
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    /// Called whenever an operator is pressed to check that the last element of the current expression is not an operator
    var canAddOperator: Bool {
        for ope in operators where elements.last == ope {
            return false
        }
        return true
    }

    /// Called to check if the current expression is a result or not
    var expressionHaveResult: Bool {
        return text.firstIndex(of: "=") != nil
    }

    /// Called to set the processed text
    func setText(text: String) {
        self.text = text
    }

    /// Called to set the processed text as a result
    func setTextWithEqual(text: String) {
        self.text = text + "="
    }
}
