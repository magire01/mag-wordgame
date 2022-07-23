//
//  GameViewController.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class GameViewController: UIViewController {
    
    var data = ["one", "two", "three", "four", "five"]

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

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == wordTableView {
            return 5
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == wordTableView {
            let cell = wordTableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
            return cell

        } else {
            if indexPath.row == 0 {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "KeyboardCell") as! KeyboardCell
                return cell
            } else if indexPath.row == 1 {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "Keyboard2Cell") as! Keyboard2Cell
                return cell
            } else {
                let cell = keyboardTableView.dequeueReusableCell(withIdentifier: "Keyboard3Cell") as! Keyboard3Cell
                return cell
            }
            
        }
    }
}

