//
//  GameModel.swift
//  imamooKadai6
//
//  Created by Fumitaka Imamura on 2021/07/21.
//

import Foundation

struct GameModel {
    private(set) var randomNumber = 1
    
    mutating func setRandomNumber() {
        randomNumber = Int.random(in: 1...100)
    }

    func isMatch(guessNumber: Int) -> Bool {
        return randomNumber == guessNumber
    }
}
