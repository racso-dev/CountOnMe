//
//  GetExpressionTests.swift
//  CountOnMeTests
//
//  Created by Oscar RENIER on 21/12/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class GetExpressionTests: XCTestCase {

    func testGivenExpressionCanAddOperator_WhenTheLastElementIsAnOperator_ThenItShouldReturnFalse() {

        let getExpression = GetExpression()

        getExpression.setText(text: "42 -")
        XCTAssertFalse(getExpression.canAddOperator)

        getExpression.setText(text: "42 +")
        XCTAssertFalse(getExpression.canAddOperator)

        getExpression.setText(text: "42 x")
        XCTAssertFalse(getExpression.canAddOperator)

        getExpression.setText(text: "42 ÷")
        XCTAssertFalse(getExpression.canAddOperator)
    }

    func testGivenExpressionCanAddOperator_WhenTheLastElementIsNotAnOperator_ThenItShouldReturnTrue() {

        let getExpression = GetExpression()

        getExpression.setText(text: "42 - 42")
        XCTAssertTrue(getExpression.canAddOperator)

        getExpression.setText(text: "42 + 42")
        XCTAssertTrue(getExpression.canAddOperator)

        getExpression.setText(text: "42 x 42")
        XCTAssertTrue(getExpression.canAddOperator)

        getExpression.setText(text: "42 ÷ 42")
        XCTAssertTrue(getExpression.canAddOperator)
    }

    func testGivenExpressionHaveEnoughElements_WhenThereAreTwoElementsOrLess_ThenItShouldReturnFalse() {

        let getExpression = GetExpression()

        getExpression.setText(text: "")
        XCTAssertFalse(getExpression.expressionHaveEnoughElement)

        getExpression.setText(text: "42")
        XCTAssertFalse(getExpression.expressionHaveEnoughElement)

        getExpression.setText(text: "42 +")
        XCTAssertFalse(getExpression.expressionHaveEnoughElement)
    }

    func testGivenExpressionHaveEnoughElements_WhenThereAreThreeElementsOrMore_ThenItShouldReturnTrue() {

        let getExpression = GetExpression()

        getExpression.setText(text: "42 + 42")
        XCTAssertTrue(getExpression.expressionHaveEnoughElement)

        getExpression.setText(text: "42 + 42 - 42")
        XCTAssertTrue(getExpression.expressionHaveEnoughElement)

        getExpression.setText(text: "42 + 42 x 42")
        XCTAssertTrue(getExpression.expressionHaveEnoughElement)
    }

    func testGivenExpressionHaveResult_WhenThereIsAnEqualSign_ThenItShouldReturnTrue() {

        let getExpression = GetExpression()

        getExpression.setTextWithEqual(text: "42 + 42")
        XCTAssertTrue(getExpression.expressionHaveResult)
    }

    func testGivenExpressionHaveResult_WhenThereIsNoEqualSign_ThenItShouldReturnFalse() {

        let getExpression = GetExpression()

        getExpression.setText(text: "42 + 42")
        XCTAssertFalse(getExpression.expressionHaveResult)
    }

}
