//
//  TableViewCell.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

protocol HandleKeyboard1Delegate {
    func updateKeyboard1(with letter: String)
}

class KeyboardCell: UITableViewCell {
    
    var delegate: HandleKeyboard1Delegate?
    
    @IBOutlet weak var qButton: UIButton! {
        didSet {
            self.qButton.layer.borderWidth = 2
            self.qButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var wButton: UIButton!{
        didSet {
            self.wButton.layer.borderWidth = 2
            self.wButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var eButton: UIButton!{
        didSet {
            self.eButton.layer.borderWidth = 2
            self.eButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var rButton: UIButton!{
        didSet {
            self.rButton.layer.borderWidth = 2
            self.rButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var tButton: UIButton!{
        didSet {
            self.tButton.layer.borderWidth = 2
            self.tButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var yButton: UIButton!{
        didSet {
            self.yButton.layer.borderWidth = 2
            self.yButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var uButton: UIButton!{
        didSet {
            self.uButton.layer.borderWidth = 2
            self.uButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var iButton: UIButton!{
        didSet {
            self.iButton.layer.borderWidth = 2
            self.iButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var oButton: UIButton!{
        didSet {
            self.oButton.layer.borderWidth = 2
            self.oButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var pButton: UIButton!{
        didSet {
            self.pButton.layer.borderWidth = 2
            self.pButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    var qButtonColor: String? {
          didSet {
              self.qButton.backgroundColor = setColor(colorString: qButtonColor ?? "gray")
          }
     }
    var wButtonColor: String? {
          didSet {
              self.wButton.backgroundColor = setColor(colorString: wButtonColor ?? "gray")
          }
     }
    var eButtonColor: String? {
          didSet {
              self.eButton.backgroundColor = setColor(colorString: eButtonColor ?? "gray")
          }
     }
    var rButtonColor: String? {
          didSet {
              self.rButton.backgroundColor = setColor(colorString: rButtonColor ?? "gray")
          }
     }
    var tButtonColor: String? {
          didSet {
              self.tButton.backgroundColor = setColor(colorString: tButtonColor ?? "gray")
          }
     }
    var yButtonColor: String? {
          didSet {
              self.yButton.backgroundColor = setColor(colorString: yButtonColor ?? "gray")
          }
     }
    var uButtonColor: String? {
          didSet {
              self.uButton.backgroundColor = setColor(colorString: uButtonColor ?? "gray")
          }
     }
    var iButtonColor: String? {
          didSet {
              self.iButton.backgroundColor = setColor(colorString: iButtonColor ?? "gray")
          }
     }
    var oButtonColor: String? {
          didSet {
              self.oButton.backgroundColor = setColor(colorString: oButtonColor ?? "gray")
          }
     }
    var pButtonColor: String? {
          didSet {
              self.pButton.backgroundColor = setColor(colorString: pButtonColor ?? "gray")
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
    
    @IBAction func qPressed(_ sender: Any) {
        handleLetter(letter: "Q")
    }
    
    @IBAction func wPressed(_ sender: Any) {
        handleLetter(letter: "W")
    }

    @IBAction func ePressed(_ sender: Any) {
        handleLetter(letter: "E")
    }
    
    @IBAction func rPressed(_ sender: Any) {
        handleLetter(letter: "R")
    }
    
    @IBAction func tPressed(_ sender: Any) {
        handleLetter(letter: "T")
    }
    
    @IBAction func yPressed(_ sender: Any) {
        handleLetter(letter: "Y")
    }
    
    @IBAction func uPressed(_ sender: Any) {
        handleLetter(letter: "U")
    }
    
    @IBAction func iPressed(_ sender: Any) {
        handleLetter(letter: "I")
    }
    
    @IBAction func oPressed(_ sender: Any) {
        handleLetter(letter: "O")
    }
    
    @IBAction func pPressed(_ sender: Any) {
        handleLetter(letter: "P")
    }
    
    private func handleLetter(letter: String) {
        delegate?.updateKeyboard1(with: letter)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
