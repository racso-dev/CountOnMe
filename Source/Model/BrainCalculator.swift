//
//  BrainCalculator.swift
//  CountOnMe
//
//  Created by Oscar RENIER on 04/12/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class BrainCalculator {

    /// Removes the plus operator if any is present in the very begining of the expression
    private func removePlusOperator(expression: String) -> String {

        var newExpression = expression
        var index = 0

        for char in newExpression {
            if char == "+" && index == 0 {
                newExpression.remove(at: newExpression.firstIndex(of: char)!)
            }
            index += 1
        }
        return newExpression
    }

    /// Method that returns True if tere is any division by zero otherwise it returns false
    private func seekForDivisionByZero(expression: String) -> Bool {

        var divIndex = -10
        var zeroIndex = -10
        var index = 0

        for char in expression {
            if char == "/" {
                divIndex = index
            }
            if char == "0" {
                zeroIndex = index
            }
            if (zeroIndex - divIndex == 1) {
                return true
            }
            index += 1
        }
        return false
    }

    private func formatExpressionAsDouble(expression: String) -> String {
        let strings = expression.split(separator: " ").map { (element) -> String in
            guard let nbInt = Int(element) else { return String(element) }
            let double = Double(nbInt)
            return String(double)
        }
        let new = strings.joined()
        return new
    }

    /// Formating a given expression to a readable expression for NSExpression
    private func formatExpression(expression: String) -> String? {

        var newExpression = formatExpressionAsDouble(expression: expression)
        newExpression = newExpression.replacingOccurrences(of: "÷", with: "/")
        newExpression = newExpression.replacingOccurrences(of: "x", with: "*")
        newExpression = removePlusOperator(expression: newExpression)
        guard !seekForDivisionByZero(expression: newExpression) else { return nil }
        return newExpression
    }

    /// Method that computes the current expression whenever equal button is pressed
    func getResultOf(expression: String) -> String {
        guard let formatedExpression = formatExpression(expression: expression) else { return "Error" }
        let expression = NSExpression(format: formatedExpression)
        guard let mathValue = expression.expressionValue(with: nil, context: nil) as? NSNumber else { return "0" }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        guard let value = formatter.string(from: mathValue) else { return "0" }
        return value
    }
}
