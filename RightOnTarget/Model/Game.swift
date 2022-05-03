//
//  Game.swift
//  RightOnTarget
//
//  Created by Нюргун on 01.05.2022.
//

import UIKit

protocol GameProtocol {
    // количество заработанных очков
    var score: Int { get }
    // текущий раунд
    var currentRound: GameRoundProtocol! { get }
    // проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    // генератор случайного значени
    var secretValueGenerator: GeneratorProtocol { get }
    // начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // начинает новый раунд (обновляет загадочное число)
    func startNewRound()
}

class Game: GameProtocol {
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append( currentRound )
    }
    
    // загадать и вернуть новое случайное значение
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.getRandomValue()
    }
}
