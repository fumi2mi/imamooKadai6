//
//  GameModel.swift
//  imamooKadai6
//
//  Created by Fumitaka Imamura on 2021/07/21.
//

import Foundation

struct GameModel {
    var randomNumber = 1
    var guessNumber = 1
    var message: String {
        return (isMatch() ? "あたり!\n" : "はずれ!\n") + "あなたの値: \(guessNumber)"
    }

    mutating func setRandomNumber() {
        randomNumber = Int.random(in: 1...100)
    }

    func isMatch() -> Bool {
        return randomNumber == guessNumber
    }
}
