//
//  Keyboard2Cell.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

protocol HandleKeyboard2Delegate {
    func updateKeyboard1(with letter: String)
}

class Keyboard2Cell: UITableViewCell {

    @IBOutlet weak var aButton: UIButton!{
        didSet {
            self.aButton.layer.borderWidth = 2
            self.aButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var sButton: UIButton!{
        didSet {
            self.sButton.layer.borderWidth = 2
            self.sButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var dButton: UIButton!{
        didSet {
            self.dButton.layer.borderWidth = 2
            self.dButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var fButton: UIButton!{
        didSet {
            self.fButton.layer.borderWidth = 2
            self.fButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var gButton: UIButton!{
        didSet {
            self.gButton.layer.borderWidth = 2
            self.gButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var hButton: UIButton!{
        didSet {
            self.hButton.layer.borderWidth = 2
            self.hButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var jButton: UIButton!{
        didSet {
            self.jButton.layer.borderWidth = 2
            self.jButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var kButton: UIButton!{
        didSet {
            self.kButton.layer.borderWidth = 2
            self.kButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var lButton: UIButton!{
        didSet {
            self.lButton.layer.borderWidth = 2
            self.lButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    var aButtonColor: String? {
          didSet {
              self.aButton.backgroundColor = setColor(colorString: aButtonColor ?? "gray")
          }
     }
    var sButtonColor: String? {
          didSet {
              self.sButton.backgroundColor = setColor(colorString: sButtonColor ?? "gray")
          }
     }
    var dButtonColor: String? {
          didSet {
              self.dButton.backgroundColor = setColor(colorString: dButtonColor ?? "gray")
          }
     }
    var fButtonColor: String? {
          didSet {
              self.fButton.backgroundColor = setColor(colorString: fButtonColor ?? "gray")
          }
     }
    var gButtonColor: String? {
          didSet {
              self.gButton.backgroundColor = setColor(colorString: gButtonColor ?? "gray")
          }
     }
    var hButtonColor: String? {
          didSet {
              self.hButton.backgroundColor = setColor(colorString: hButtonColor ?? "gray")
          }
     }
    var jButtonColor: String? {
          didSet {
              self.jButton.backgroundColor = setColor(colorString: jButtonColor ?? "gray")
          }
     }
    var kButtonColor: String? {
          didSet {
              self.kButton.backgroundColor = setColor(colorString: kButtonColor ?? "gray")
          }
     }
    var lButtonColor: String? {
          didSet {
              self.lButton.backgroundColor = setColor(colorString: lButtonColor ?? "gray")
          }
     }
    
    func setColor(colorString: String) -> UIColor {
        switch(colorString) {
        case "green":
            return UIColor.LetterColor.green
        case "yellow":
            return UIColor.LetterColor.yellow
        case "red":
            return UIColor.LetterColor.wrong
        case "gray":
            return UIColor.LetterColor.notUsed
        default:
            return .black
        }
    }
    
    
    @IBAction func aButtonPressed(_ sender: Any) {
        handleLetter(letter: "A")
    }
    @IBAction func sButtonPressed(_ sender: Any) {
        handleLetter(letter: "S")
    }
    @IBAction func dButtonPressed(_ sender: Any) {
        handleLetter(letter: "D")
    }
    @IBAction func fButtonPressed(_ sender: Any) {
        handleLetter(letter: "F")
    }
    @IBAction func gButtonPressed(_ sender: Any) {
        handleLetter(letter: "G")
    }
    @IBAction func hButtonPressed(_ sender: Any) {
        handleLetter(letter: "H")
    }
    @IBAction func jButtonPressed(_ sender: Any) {
        handleLetter(letter: "J")
    }
    @IBAction func kButtonPressed(_ sender: Any) {
        handleLetter(letter: "K")
    }
    @IBAction func lButtonPressed(_ sender: Any) {
        handleLetter(letter: "L")
    }
    var delegate: HandleKeyboard2Delegate?

    private func handleLetter(letter: String) {
        delegate?.updateKeyboard1(with: letter)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
