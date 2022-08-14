//
//  GameViewController.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class GameViewController: UIViewController {
    
    var wordList: [String] = WordController().wordModel ?? []
    
    var randomInt: Int?
    
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
    
    var keyboardModel: [KeyboardModel]?
    var keyboardKeys = [
        KeyboardModel.init(value: "q", color: "gray"),
        KeyboardModel.init(value: "w", color: "gray"),
        KeyboardModel.init(value: "e", color: "gray"),
        KeyboardModel.init(value: "r", color: "gray"),
        KeyboardModel.init(value: "t", color: "gray"),
        KeyboardModel.init(value: "y", color: "gray"),
        KeyboardModel.init(value: "u", color: "gray"),
        KeyboardModel.init(value: "i", color: "gray"),
        KeyboardModel.init(value: "o", color: "gray"),
        KeyboardModel.init(value: "p", color: "gray"),
        KeyboardModel.init(value: "a", color: "gray"),
        KeyboardModel.init(value: "s", color: "gray"),
        KeyboardModel.init(value: "d", color: "gray"),
        KeyboardModel.init(value: "f", color: "gray"),
        KeyboardModel.init(value: "g", color: "gray"),
        KeyboardModel.init(value: "h", color: "gray"),
        KeyboardModel.init(value: "j", color: "gray"),
        KeyboardModel.init(value: "k", color: "gray"),
        KeyboardModel.init(value: "l", color: "gray"),
        KeyboardModel.init(value: "z", color: "gray"),
        KeyboardModel.init(value: "x", color: "gray"),
        KeyboardModel.init(value: "c", color: "gray"),
        KeyboardModel.init(value: "v", color: "gray"),
        KeyboardModel.init(value: "b", color: "gray"),
        KeyboardModel.init(value: "n", color: "gray"),
        KeyboardModel.init(value: "m", color: "gray")
    ]
    
    lazy var question = wordList[randomInt!].map { String($0) }
    var answer: [String] = []

    var isCorrect: Bool = false
    var characterCount: Int = 0
    var attemptCount: Int = 0

    @IBOutlet weak var wordTableView: UITableView!
    @IBOutlet weak var keyboardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        wordTableView.delegate = self
        wordTableView.dataSource = self
        wordTableView.register(UINib(nibName: "GameCell", bundle: nil), forCellReuseIdentifier: "GameCell")
        
        keyboardTableView.delegate = self
        keyboardTableView.dataSource = self
        keyboardTableView.register(UINib(nibName: "KeyboardCell", bundle: nil), forCellReuseIdentifier: "KeyboardCell")
        keyboardTableView.register(UINib(nibName: "Keyboard2Cell", bundle: nil), forCellReuseIdentifier: "Keyboard2Cell")
        keyboardTableView.register(UINib(nibName: "Keyboard3Cell", bundle: nil), forCellReuseIdentifier: "Keyboard3Cell")
        
        self.randomInt = Int.random(in: 0..<wordList.count - 1)
        question = wordList[randomInt!].map { String($0) }
        
    }
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource, HandleKeyboard1Delegate, HandleKeyboard2Delegate, HandleKeyboard3Delegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == wordTableView {
//            return attemptCount + 1
            return 5
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
                cell.qButtonColor = keyboardKeys[0].color
                cell.wButtonColor = keyboardKeys[1].color
                cell.eButtonColor = keyboardKeys[2].color
                cell.rButtonColor = keyboardKeys[3].color
                cell.tButtonColor = keyboardKeys[4].color
                cell.yButtonColor = keyboardKeys[5].color
                cell.uButtonColor = keyboardKeys[6].color
                cell.iButtonColor = keyboardKeys[7].color
                cell.oButtonColor = keyboardKeys[8].color
                cell.pButtonColor = keyboardKeys[9].color
                
                return cell
            } else if indexPath.row == 1 {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "Keyboard2Cell") as! Keyboard2Cell
                cell.delegate = self
                cell.aButtonColor = keyboardKeys[10].color
                cell.sButtonColor = keyboardKeys[11].color
                cell.dButtonColor = keyboardKeys[12].color
                cell.fButtonColor = keyboardKeys[13].color
                cell.gButtonColor = keyboardKeys[14].color
                cell.hButtonColor = keyboardKeys[15].color
                cell.jButtonColor = keyboardKeys[16].color
                cell.kButtonColor = keyboardKeys[17].color
                cell.lButtonColor = keyboardKeys[18].color
                return cell
            } else {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "Keyboard3Cell") as! Keyboard3Cell
                cell.delegate = self
                cell.zButtonColor = keyboardKeys[19].color
                cell.xButtonColor = keyboardKeys[20].color
                cell.cButtonColor = keyboardKeys[21].color
                cell.vButtonColor = keyboardKeys[22].color
                cell.bButtonColor = keyboardKeys[23].color
                cell.nButtonColor = keyboardKeys[24].color
                cell.mButtonColor = keyboardKeys[25].color
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == wordTableView {
            return 80
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func updateKeyboard1(with letter: String) {
        if characterCount < 5 {
            data[attemptCount].word[characterCount].value = letter
            characterCount = characterCount + 1
            answer.append(letter.lowercased())
            refreshRow()
        }
    }
    
    func refreshRow() {
        let indexPosition = IndexPath(item: attemptCount, section: 0)
        wordTableView.reloadRows(at: [indexPosition], with: .none)
    }
    
    func deleteKey() {
        if characterCount > 0 {
            characterCount -= 1
            data[attemptCount].word[characterCount].value = ""
            answer.remove(at: characterCount)
            refreshRow()
        }
    }
    
    func submitKey() {
        // if question joined is in the array of words.. continue, if not, error
        let joinedAnswer = answer.joined(separator: "")
        if characterCount == 5 {
            if wordList.contains(joinedAnswer) {
                compareAnswer()
                answer = []
                characterCount = 0
                refreshRow()
                completeGame()
            } else {
                self.showToast(message: "Not A Word", font: .systemFont(ofSize: 15.0))
            }
        }
    }
    
    private func compareAnswer() {
        for i in 0...answer.count - 1  {
            if answer[i] == question[i] {
                data[attemptCount].word[i].color = "green"
                keyboardKeys.first(where: {$0.value == answer[i]})?.color = "green"
            } else  if question.contains(answer[i]) {
                data[attemptCount].word[i].color = "yellow"
                if !keyboardKeys.contains(where: {$0.value == answer[i] && $0.color == "green"}) {
                    keyboardKeys.first(where: {$0.value == answer[i]})?.color = "yellow"
                }
            } else if !question.contains(answer[i]) {
                data[attemptCount].word[i].color = "red"
                keyboardKeys.first(where: {$0.value == answer[i]})?.color = "red"
            } else {
                data[attemptCount].word[i].color = "black"
                keyboardKeys.first(where: {$0.value == answer[i]})?.color = "gray"
            }
        }
        keyboardTableView.reloadData()
        
        for i in 0...answer.count - 1  {
            if answer[i] == question[i] {
                isCorrect = true
            } else {
                isCorrect = false
                break
            }
        }
    }
    
    private func completeGame() {
        if !isCorrect {
            if attemptCount == 4 {
                //pop win alert
                let loseAlert = UIAlertController(title: "You Lose!", message: "The correct word was: \(question.joined())", preferredStyle: .alert)
                let playAgain = UIAlertAction(title: "Play Again", style: .default, handler:  { (action) -> Void in
                    self.restartGame()
                 })
                let quit = UIAlertAction(title: "Quit", style: .destructive, handler: { (action) -> Void in
                    self.dismiss(animated: true, completion: nil)
                })
                loseAlert.addAction(playAgain)
                loseAlert.addAction(quit)
                self.present(loseAlert, animated: true, completion: nil)
            } else {
                attemptCount += 1
                wordTableView.reloadData()
            }
            
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
    }
    
    private func restartGame() {
        self.randomInt = Int.random(in: 0..<wordList.count - 1)
        question = wordList[randomInt!].map { String($0) }
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
        keyboardKeys = [
            KeyboardModel.init(value: "q", color: "gray"),
            KeyboardModel.init(value: "w", color: "gray"),
            KeyboardModel.init(value: "e", color: "gray"),
            KeyboardModel.init(value: "r", color: "gray"),
            KeyboardModel.init(value: "t", color: "gray"),
            KeyboardModel.init(value: "y", color: "gray"),
            KeyboardModel.init(value: "u", color: "gray"),
            KeyboardModel.init(value: "i", color: "gray"),
            KeyboardModel.init(value: "o", color: "gray"),
            KeyboardModel.init(value: "p", color: "gray"),
            KeyboardModel.init(value: "a", color: "gray"),
            KeyboardModel.init(value: "s", color: "gray"),
            KeyboardModel.init(value: "d", color: "gray"),
            KeyboardModel.init(value: "f", color: "gray"),
            KeyboardModel.init(value: "g", color: "gray"),
            KeyboardModel.init(value: "h", color: "gray"),
            KeyboardModel.init(value: "j", color: "gray"),
            KeyboardModel.init(value: "k", color: "gray"),
            KeyboardModel.init(value: "l", color: "gray"),
            KeyboardModel.init(value: "z", color: "gray"),
            KeyboardModel.init(value: "x", color: "gray"),
            KeyboardModel.init(value: "c", color: "gray"),
            KeyboardModel.init(value: "v", color: "gray"),
            KeyboardModel.init(value: "b", color: "gray"),
            KeyboardModel.init(value: "n", color: "gray"),
            KeyboardModel.init(value: "m", color: "gray")
        ]
        keyboardTableView.reloadData() 
    }
}

extension GameViewController {
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-400, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
