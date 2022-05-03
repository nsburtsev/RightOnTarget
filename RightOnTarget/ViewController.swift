//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Нюргун on 25.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // сущность "Игра"
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // создаем генератор случайных чисел
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        // создаем сущность игра
        game = Game(valueGenerator: generator, rounds: 5)
        // обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    // MARK: - Взаимодействие View - Model
    
    // проверка выбранного пользователем числа
    @IBAction func checkNumber() {
        // высчитываем очки за раунд
        game.currentRound.calculateScore(with: Int(slider.value))
        // проверяем окончена ли игра
        if game.isGameEnded{
            // показываем окно с итогами
            showAlertWith(score: game.score)
            // начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }
        // обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    // MARK: - Обновление View
    
    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    // отображение всплывающего окна со счетом
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

