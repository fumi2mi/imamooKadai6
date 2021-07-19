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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomNumberLabel()
    }

    @IBAction private func judgementButtonPressed(_ sender: UIButton) {
        let isMatch = judgeMatch()
        print(isMatch)
    }
    
    private func setRandomNumberLabel() {
        let randomNuber = Int.random(in: 1...100)
        randomNumberLabel.text = String(randomNuber)
    }
    
    private func judgeMatch() -> Bool {
        guard let randomNumber = Int(randomNumberLabel.text ?? "") else {
            return false
        }
        let guessNumber = Int(guessSlider.value)
        return randomNumber == guessNumber
    }
}

