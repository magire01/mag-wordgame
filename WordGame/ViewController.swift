//
//  ViewController.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBAction func newGameButtonTouched(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
        self.present(vc.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.titleLabel.textColor = .white
        newGameButton.layer.cornerRadius = 20
        newGameButton.layer.borderWidth = 3
        newGameButton.layer.borderColor = CGColor(red: 58, green: 175, blue: 169, alpha: 1)
        statsButton.layer.cornerRadius = 20
        statsButton.layer.borderWidth = 3
        statsButton.layer.borderColor = CGColor(red: 58, green: 175, blue: 169, alpha: 1)
        settingsButton.layer.cornerRadius = 20
        settingsButton.layer.borderWidth = 3
        settingsButton.layer.borderColor = CGColor(red: 58, green: 175, blue: 169, alpha: 1)


    }


}

