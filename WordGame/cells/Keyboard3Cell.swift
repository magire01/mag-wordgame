//
//  Keyboard3Cell.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

protocol DeleteAndSubmitDelegate {
    func deleteKey()
    func submitKey()
}

protocol HandleKeyboard3Delegate {
    func updateKeyboard1(with: String)
    func deleteKey()
    func submitKey()
}

class Keyboard3Cell: UITableViewCell {
    
    @IBOutlet weak var zButton: UIButton!{
        didSet {
            self.zButton.layer.borderWidth = 2
            self.zButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var xButton: UIButton!{
        didSet {
            self.xButton.layer.borderWidth = 2
            self.xButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var cButton: UIButton!{
        didSet {
            self.cButton.layer.borderWidth = 2
            self.cButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var vButton: UIButton!{
        didSet {
            self.vButton.layer.borderWidth = 2
            self.vButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var bButton: UIButton!{
        didSet {
            self.bButton.layer.borderWidth = 2
            self.bButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var nButton: UIButton!{
        didSet {
            self.nButton.layer.borderWidth = 2
            self.nButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var mButton: UIButton!{
        didSet {
            self.mButton.layer.borderWidth = 2
            self.mButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @IBOutlet weak var deleteButton: UIButton!{
        didSet {
            let deleteImage = UIImage(named: "delete")?.withRenderingMode(.alwaysTemplate)
            self.deleteButton.imageView?.contentMode = .scaleAspectFit
            self.deleteButton.setImage(deleteImage, for: .normal)
            self.deleteButton.backgroundColor = UIColor.LetterColor.delete
            self.deleteButton.tintColor = .white
            self.deleteButton.layer.borderWidth = 1
            self.deleteButton.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var submitButton: UIButton!{
        didSet {
            let submitImage = UIImage(named: "submit")?.withRenderingMode(.alwaysTemplate)
            self.submitButton.imageView?.contentMode = .scaleAspectFit
            self.submitButton.setImage(submitImage, for: .normal)
            self.submitButton.backgroundColor = UIColor.LetterColor.submit
            self.submitButton.tintColor = .white
            self.submitButton.layer.borderWidth = 1
            self.submitButton.layer.cornerRadius = 20
        }
    }
    
    
    
    @IBAction func deleteTextTouched(_ sender: Any) {
        delegate?.deleteKey()
    }
    
    @IBAction func submitButtonTouched(_ sender: Any) {
        delegate?.submitKey()
    }
    
    @IBAction func zPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "Z")
    }
    @IBAction func xButtonPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "X")

    }
    @IBAction func cButtonPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "C")

    }
    @IBAction func vButtonPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "V")

    }
    @IBAction func bButtonPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "B")

    }
    @IBAction func nButtonPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "N")

    }
    @IBAction func mButtonPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "M")

    }
    
    
    
    
    var delegate: HandleKeyboard3Delegate?
    
    var zButtonColor: String? {
          didSet {
              self.zButton.backgroundColor = setColor(colorString: zButtonColor ?? "gray")
          }
     }
    var xButtonColor: String? {
          didSet {
              self.xButton.backgroundColor = setColor(colorString: xButtonColor ?? "gray")
          }
     }
    var cButtonColor: String? {
          didSet {
              self.cButton.backgroundColor = setColor(colorString: cButtonColor ?? "gray")
          }
     }
    var vButtonColor: String? {
          didSet {
              self.vButton.backgroundColor = setColor(colorString: vButtonColor ?? "gray")
          }
     }
    var bButtonColor: String? {
          didSet {
              self.bButton.backgroundColor = setColor(colorString: bButtonColor ?? "gray")
          }
     }
    var nButtonColor: String? {
          didSet {
              self.nButton.backgroundColor = setColor(colorString: nButtonColor ?? "gray")
          }
     }
    var mButtonColor: String? {
          didSet {
              self.mButton.backgroundColor = setColor(colorString: mButtonColor ?? "gray")
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
