//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// Class used to check to validity of input
    let getExpression = GetExpression()
    let brain = BrainCalculator()

    // All outlets subviews
    @IBOutlet weak var displayView: WrapperDisplayView!
    @IBOutlet weak var composeView: WrapperComposeView!
    @IBOutlet weak var operatorsView: WrapperOperatorsView!

    /// Called when user tries to input two operators in a row
    func presentErrorController() {

        let alertVC = UIAlertController(title: "Action impossible", message: "Un opérateur ne peut uniquement être suivi d'un nombre !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)

    }

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        composeView.contentView.delegate = self
        operatorsView.contentView.delegate = self
    }

}

extension ViewController: ComposeViewDelegate {

    /// Called whenever a number button is tapped from the composeView
    func tappedNumberButton(_ sender: UIButton) {
        guard let textButton = sender.title(for: .normal) else { return }

        // Trick to not display a chain of zero
        if displayView.contentView.textLabel.text! == "0" {
            displayView.contentView.textLabel.text = ""
        }
        // Trick that makes impossible concatenation of new inputs when result has been computed
        if getExpression.expressionHaveResult {
            displayView.contentView.textLabel.text = ""
        }
        if textButton == "AC" {
            displayView.contentView.textLabel.text = "0"
        } else {
            self.displayView.contentView.concatDisplayedText(with: textButton)
            self.getExpression.setText(text: displayView.contentView.textLabel.text!)
        }
    }

}

extension ViewController: OperatorsViewDelegate {

    /// Called whenever an operator button is tapped from the operatorsView
    func tappedOperatorButton(_ sender: UIButton) {

        getExpression.setText(text: displayView.contentView.textLabel.text!)
        if getExpression.canAddOperator {

            switch sender.titleLabel?.text {
            case "+": displayView.contentView.concatDisplayedText(with: " + ")
            case "-": displayView.contentView.concatDisplayedText(with: " - ")
            case "x": displayView.contentView.concatDisplayedText(with: " x ")
            case "÷": displayView.contentView.concatDisplayedText(with: " ÷ ")
            case "=":
                if !getExpression.expressionHaveResult {
                    let expressionToEvaluate = displayView.contentView.textLabel.text!

                    let result = brain.getResultOf(expression: expressionToEvaluate)
                    if (result == "") {

                        displayView.contentView.textLabel.text = ""

                    } else {

                        displayView.contentView.textLabel.text = result

                    }
                    getExpression.setTextWithEqual(text: displayView.contentView.textLabel.text!)
                }

            default:
                break

            }

        } else {

            presentErrorController()

        }
    }

}
