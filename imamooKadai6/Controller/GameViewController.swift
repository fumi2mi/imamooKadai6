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

    var gameModel = GameModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel.setRandomNumber()
        randomNumberLabel.text = String(gameModel.randomNumber)
        guessSlider.value = (guessSlider.maximumValue + guessSlider.minimumValue) / 2
    }

    @IBAction private func judgementButtonPressed(_ sender: UIButton) {
        let guessNumber = Int(guessSlider.value)
        let result = gameModel.isMatch(guessNumber: guessNumber)
        let firstLine = result ? "あたり!" : "はずれ!"
        aleartResult(message: "\(firstLine)\nあなたの値: \(guessNumber)")
    }

    private func aleartResult(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] _ in
                self?.retry()
            })
        )
        present(alert, animated: true, completion: nil)
    }
    
    private func retry() {
        gameModel.setRandomNumber()
        randomNumberLabel.text = String(gameModel.randomNumber)
    }
}
