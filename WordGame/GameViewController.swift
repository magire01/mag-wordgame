//
//  GameViewController.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class GameViewController: UIViewController {
    
    var data = [
        CharacterModel(character0: "", character1: "", character2: "", character3: "", character4: ""),
        CharacterModel(character0: "", character1: "", character2: "", character3: "", character4: ""),
        CharacterModel(character0: "", character1: "", character2: "", character3: "", character4: ""),
        CharacterModel(character0: "", character1: "", character2: "", character3: "", character4: ""),
        CharacterModel(character0: "", character1: "", character2: "", character3: "", character4: "")
    ]
    
    var question: String = "werty"
    var answer: String = ""
    
    var characterCount: Int = 0
    
    var attemptCount: Int = 1

    
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
            return attemptCount
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == wordTableView {
            let cell = wordTableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
            cell.firstChar = data[indexPath.row].character0
            cell.secondChar = data[indexPath.row].character1
            cell.thirdChar = data[indexPath.row].character2
            cell.fourthChar = data[indexPath.row].character3
            cell.fifthChar = data[indexPath.row].character4
            
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
        switch (characterCount) {
        case 0:
            data[attemptCount - 1].character0 = letter
        case 1:
            data[attemptCount - 1].character1 = letter
        case 2:
            data[attemptCount - 1].character2 = letter
        case 3:
            data[attemptCount - 1].character3 = letter
        case 4:
            data[attemptCount - 1].character4 = letter
        default:
            break
            
        }
        wordTableView.reloadData()
    }
    
    func updateKeyboard1(with letter: String) {
        handleCharacter(questionCount: characterCount, letter: letter)
        characterCount = characterCount + 1
        answer = answer + letter
    }
    
    func deleteKey() {
        if characterCount > 0 {
            characterCount = characterCount - 1
        }
        switch(characterCount) {
        case 0:
            data[attemptCount - 1].character0 = ""
        case 1:
            data[attemptCount - 1].character1 = ""
        case 2:
            data[attemptCount - 1].character2 = ""
        case 3:
            data[attemptCount - 1].character3 = ""
        case 4:
            data[attemptCount - 1].character4 = ""
        default:
            break
        }
        wordTableView.reloadData()
        print(self.characterCount)
        
    }
    
    func submitKey() {
        if question == answer.lowercased() {
            print("you win")
        } else {
            attemptCount = attemptCount + 1
            answer = ""
            characterCount = 0
        }
        print(answer.lowercased())
        
        wordTableView.reloadData()
    }
}

