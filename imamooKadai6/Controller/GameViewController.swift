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
        gameModel.guessNumber = Int(guessSlider.value)
        aleartResult(gameModel.isMatch())
    }

    private func aleartResult(_ isMatch: Bool) {
        let alert = UIAlertController(title: "結果", message: gameModel.message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "再挑戦", style: .default, handler: {_ in
                self.gameModel.setRandomNumber()
                self.randomNumberLabel.text = String(self.gameModel.randomNumber)
            })
        )
        present(alert, animated: true, completion: nil)
    }
}
