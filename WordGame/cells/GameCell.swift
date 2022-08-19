//
//  GameCell.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet weak var firstCharLabel: UILabel!
    @IBOutlet weak var secondCharLabel: UILabel!
    @IBOutlet weak var thirdCharLabel: UILabel!
    @IBOutlet weak var fourthCharLabel: UILabel!
    @IBOutlet weak var fifthCharLabel: UILabel!
    
    @IBOutlet weak var firstCharView: UIView!
    @IBOutlet weak var secondCharView: UIView!
    @IBOutlet weak var thirdCharView: UIView!
    @IBOutlet weak var fourthCharView: UIView!
    @IBOutlet weak var fifthCharView: UIView!
    
    
    var blank: String = ""
    
    var char0Value: String? {
          didSet {
              firstCharLabel.text = char0Value
          }
     }
    var char0Color: String? {
          didSet {
              firstCharLabel.backgroundColor = setColor(colorString: char0Color ?? "black")
          }
     }
    
    var char1Value: String? {
          didSet {
              secondCharLabel.text = char1Value
          }
     }
    var char1Color: String? {
          didSet {
              secondCharLabel.backgroundColor = setColor(colorString: char1Color ?? "black")
          }
     }
    
    var char2Value: String? {
          didSet {
              thirdCharLabel.text = char2Value
          }
     }
    var char2Color: String? {
          didSet {
              thirdCharLabel.backgroundColor = setColor(colorString: char2Color ?? "black")
          }
     }
    
    var char3Value: String? {
          didSet {
              fourthCharLabel.text = char3Value
          }
     }
    var char3Color: String? {
          didSet {
              fourthCharLabel.backgroundColor = setColor(colorString: char3Color ?? "black")
          }
     }
    
    var char4Value: String? {
          didSet {
              fifthCharLabel.text = char4Value
          }
     }
    var char4Color: String? {
          didSet {
              fifthCharLabel.backgroundColor = setColor(colorString: char4Color ?? "black")
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
        default:
            return UIColor.LetterColor.notUsed
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstCharLabel.text = blank
        secondCharLabel.text = blank
        thirdCharLabel.text = blank
        fourthCharLabel.text = blank
        fifthCharLabel.text = blank
        
        firstCharLabel.textColor = .white
        secondCharLabel.textColor = .white
        thirdCharLabel.textColor = .white
        fourthCharLabel.textColor = .white
        fifthCharLabel.textColor = .white
        
        firstCharLabel.layer.borderWidth = 1
        firstCharLabel.layer.borderColor = UIColor.black.cgColor
        firstCharLabel.textAlignment = .center
        
        secondCharLabel.layer.borderWidth = 1
        secondCharLabel.layer.borderColor = UIColor.black.cgColor
        secondCharLabel.textAlignment = .center
        
        thirdCharLabel.layer.borderWidth = 1
        thirdCharLabel.layer.borderColor = UIColor.black.cgColor
        thirdCharLabel.textAlignment = .center
        
        fourthCharLabel.layer.borderWidth = 1
        fourthCharLabel.layer.borderColor = UIColor.black.cgColor
        fourthCharLabel.textAlignment = .center
        
        fifthCharLabel.layer.borderWidth = 1
        fifthCharLabel.layer.borderColor = UIColor.black.cgColor
        fifthCharLabel.textAlignment = .center
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
