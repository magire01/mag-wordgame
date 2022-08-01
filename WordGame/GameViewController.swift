//
//  GameViewController.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class GameViewController: UIViewController {
    
    var data = [
        CharacterModel.WordAttempt.init(word: [
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: "")]),
        CharacterModel.WordAttempt.init(word: [
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: "")]),
        CharacterModel.WordAttempt.init(word: [
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: "")]),
        CharacterModel.WordAttempt.init(word: [
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: "")]),
        CharacterModel.WordAttempt.init(word: [
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: ""),
            CharacterModel.CharacterValue(value: "", color: "")])
    ]
    
    var question = "werty".map { String($0) }
    var answer: [String] = []
    var isCorrect: Bool = false
    
    var characterCount: Int = 0
    
    var attemptCount: Int = 0

    
    @IBOutlet weak var wordTableView: UITableView!
    @IBOutlet weak var keyboardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordTableView.delegate = self
        wordTableView.dataSource = self
        wordTableView.register(UINib(nibName: "GameCell", bundle: nil), forCellReuseIdentifier: "GameCell")
        
        keyboardTableView.delegate = self
        keyboardTableView.dataSource = self
        keyboardTableView.register(UINib(nibName: "KeyboardCell", bundle: nil), forCellReuseIdentifier: "KeyboardCell")
        keyboardTableView.register(UINib(nibName: "Keyboard2Cell", bundle: nil), forCellReuseIdentifier: "Keyboard2Cell")
        keyboardTableView.register(UINib(nibName: "Keyboard3Cell", bundle: nil), forCellReuseIdentifier: "Keyboard3Cell")
    }
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource, HandleKeyboard1Delegate, HandleKeyboard3Delegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == wordTableView {
            return attemptCount + 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == wordTableView {
            let cell = wordTableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
            cell.char0Value = data[indexPath.row].word[0].value
            cell.char1Value = data[indexPath.row].word[1].value
            cell.char2Value = data[indexPath.row].word[2].value
            cell.char3Value = data[indexPath.row].word[3].value
            cell.char4Value = data[indexPath.row].word[4].value
            cell.char0Color = data[indexPath.row].word[0].color
            cell.char1Color = data[indexPath.row].word[1].color
            cell.char2Color = data[indexPath.row].word[2].color
            cell.char3Color = data[indexPath.row].word[3].color
            cell.char4Color = data[indexPath.row].word[4].color
            return cell

        } else {
            if indexPath.row == 0 {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "KeyboardCell") as! KeyboardCell
                cell.delegate = self
                return cell
            } else if indexPath.row == 1 {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "Keyboard2Cell") as! Keyboard2Cell
                return cell
            } else {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "Keyboard3Cell") as! Keyboard3Cell
                cell.delegate = self
                return cell
            }
        }
    }
    
    private func handleCharacter(questionCount: Int, letter: String) {
            data[attemptCount].word[questionCount].value = letter
    }
    
    func updateKeyboard1(with letter: String) {
        if characterCount < 5 {
            handleCharacter(questionCount: characterCount, letter: letter)
            characterCount = characterCount + 1
            answer.append(letter.lowercased())
            print(data[0])
            print(answer)
            wordTableView.reloadData()
        }
    }
    
    func deleteKey() {
        if characterCount > 0 {
            characterCount -= 1
            data[attemptCount].word[characterCount].value = ""
            answer.remove(at: characterCount)
            wordTableView.reloadData()
        }
        
    }
    
    func submitKey() {
        if characterCount == 5 {
            compareAnswer()
            answer = []
            characterCount = 0
            if !isCorrect {
                if attemptCount == 5 {
                    print("loser")
                }
                attemptCount = attemptCount + 1
            } else {
                //pop win alert
                let winAlert = UIAlertController(title: "Nice One!", message: "You Win!", preferredStyle: .alert)
                let playAgain = UIAlertAction(title: "Play Again", style: .default, handler:  { (action) -> Void in
                    self.restartGame()
                 })
                let quit = UIAlertAction(title: "Quit", style: .destructive, handler: { (action) -> Void in
                    self.dismiss(animated: true, completion: nil)
                })
                winAlert.addAction(playAgain)
                winAlert.addAction(quit)
                self.present(winAlert, animated: true, completion: nil)
            }
            wordTableView.reloadData()
        }
    }
    
    private func compareAnswer() {
        for i in 0...answer.count - 1  {
            if answer[i] == question[i] {
                data[attemptCount].word[i].color = "green"
                isCorrect = true
                print(answer[i])
            } else {
                isCorrect = false
            }
        }
        print("isCorrect: \(isCorrect)")
        
    }
    
    private func restartGame() {
        answer = []
        characterCount = 0
        attemptCount = 0
        data = [
            CharacterModel.WordAttempt.init(word: [
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: "")]),
            CharacterModel.WordAttempt.init(word: [
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: "")]),
            CharacterModel.WordAttempt.init(word: [
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: "")]),
            CharacterModel.WordAttempt.init(word: [
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: "")]),
            CharacterModel.WordAttempt.init(word: [
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: ""),
                CharacterModel.CharacterValue(value: "", color: "")])
        ]
        wordTableView.reloadData()
    }
}

