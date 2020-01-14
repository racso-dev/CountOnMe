//
//  GetExpression.swift
//  CountOnMe
//
//  Created by Oscar RENIER on 30/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class GetExpression {

    var expressionIsCorrect: Bool {
           return elements.last != "+" && elements.last != "-"
       }

       var expressionHaveEnoughElement: Bool {
           return elements.count >= 3
       }

       var canAddOperator: Bool {
           return elements.last != "+" && elements.last != "-"
       }

       var expressionHaveResult: Bool {
           return displayView.text.firstIndex(of: "=") != nil
       }

}
