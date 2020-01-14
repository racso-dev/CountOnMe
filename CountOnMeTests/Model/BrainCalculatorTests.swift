//
//  BrainCalculatorTests.swift
//  CountOnMeTests
//
//  Created by Oscar RENIER on 23/12/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

protocol SringFormatter {

}

class BrainCalculatorTests: XCTestCase {

    func testGetResultOfExpression_WhenExpressionIsBasic_ThenResultShouldBeComputed() {

        let brain = BrainCalculator()

        XCTAssertEqual(brain.getResultOf(expression: "42 - 42"), "0")
        XCTAssertEqual(brain.getResultOf(expression: "42 + 42"), "84")
        XCTAssertEqual(brain.getResultOf(expression: "42 x 42"), "1764")
        XCTAssertEqual(brain.getResultOf(expression: "42 ÷ 42"), "1")
        XCTAssertEqual(brain.getResultOf(expression: "0"), "0")
    }

    func testGetResultOfExpression_WhenExpressionIsHard_ThenResultShouldBeComputed() {

        let brain = BrainCalculator()

        XCTAssertEqual(brain.getResultOf(expression: "42 - 42 x 42 + 42 ÷ 42"), "-1721")
        XCTAssertEqual(brain.getResultOf(expression: "42 + 42 ÷ 42 + 42 x 42"), "1807")
        XCTAssertEqual(brain.getResultOf(expression: "42 x 42"), "1764")
        XCTAssertEqual(brain.getResultOf(expression: "42 ÷ 42"), "1")
        XCTAssertEqual(brain.getResultOf(expression: "0"), "0")
    }

    func testGetResultOfEpression_WhenExpressionIsWeirdlyFormated_ThenResultShouldBeComputed() {
        let brain = BrainCalculator()

        XCTAssertEqual(brain.getResultOf(expression: "+ 42 - 42"), "0")
    }

    func testGetResultOfExpression_WhenExpressionIsNotWellFormated_ThenResultShouldBeZero() {

        let brain = BrainCalculator()

        XCTAssertEqual(brain.getResultOf(expression: "non_formated_data"), "0")
    }

    func testGetResultOfExpression_WhenExpressionContainsTooLongNumbers_ThenResultShouldBeZero() {

        let brain = BrainCalculator()

        XCTAssertEqual(brain.getResultOf(expression: "42424242424242424242424242424242 x 4242424242424242424242424242424242"), "0")
        XCTAssertEqual(brain.getResultOf(expression: "42424242424242424242424242424242 ÷ 424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242"), "0")
        XCTAssertEqual(brain.getResultOf(expression: "42424242424242424242424242424242 + 424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242"), "0")
        XCTAssertEqual(brain.getResultOf(expression: "42424242424242424242424242424242 - 424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242"), "-0")
    }

    func testGetResultOfEpression_WhenExpressionContainsDivisionByZero_ThenResultShouldBeError() {
        let brain = BrainCalculator()

        XCTAssertEqual(brain.getResultOf(expression: "42 ÷ 0"), "Error")
        XCTAssertEqual(brain.getResultOf(expression: "24 + 42 ÷ 0 x 42"), "Error")
        XCTAssertEqual(brain.getResultOf(expression: "24 x 42 ÷ 0 x 42"), "Error")
        XCTAssertEqual(brain.getResultOf(expression: "24 ÷ 42 ÷ 0 x 42"), "Error")
    }
}
