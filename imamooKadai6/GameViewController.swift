//
//  ViewController.swift
//  imamooKadai6
//
//  Created by Fumitaka Imamura on 2021/07/19.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet private weak var randomNumberLabel: UILabel!
    @IBOutlet private weak var guessSlider: UISlider!

    private var randomNumber = 50
    private var guessNumber = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomNumberLabel()
        guessSlider.value = (guessSlider.maximumValue + guessSlider.minimumValue) / 2
    }

    @IBAction private func judgementButtonPressed(_ sender: UIButton) {
        let isMatch = judgeMatch()
        aleartResult(isMatch)
    }
    
    private func setRandomNumberLabel() {
        randomNumber = Int.random(in: 1...100)
        randomNumberLabel.text = String(randomNumber)
    }
    
    private func judgeMatch() -> Bool {
        guard let randomNumber = Int(randomNumberLabel.text ?? "") else {
            return false
        }
        guessNumber = Int(guessSlider.value)
        return randomNumber == guessNumber
    }
    
    private func aleartResult(_ isMatch: Bool) {
        let title = "結果"
        let message = (isMatch ? "あたり!" : "はずれ!") + "\nあなたの値: \(guessNumber)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "再挑戦", style: .default, handler: {action in
                self.setRandomNumberLabel()
            })
        )
        present(alert, animated: true, completion: nil)
    }
}

