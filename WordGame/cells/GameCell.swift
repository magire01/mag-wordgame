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
    
    var blank: String = ""
    
    var char0Value: String? {
          didSet {
              firstCharLabel.text = char0Value
          }
     }
    var char0Color: String? {
          didSet {
              firstCharLabel.textColor = setColor(colorString: char0Color ?? "black")
          }
     }
    
    var char1Value: String? {
          didSet {
              secondCharLabel.text = char1Value
          }
     }
    var char1Color: String? {
          didSet {
              secondCharLabel.textColor = setColor(colorString: char1Color ?? "black")
          }
     }
    
    var char2Value: String? {
          didSet {
              thirdCharLabel.text = char2Value
          }
     }
    var char2Color: String? {
          didSet {
              thirdCharLabel.textColor = setColor(colorString: char2Color ?? "black")
          }
     }
    
    var char3Value: String? {
          didSet {
              fourthCharLabel.text = char3Value
          }
     }
    var char3Color: String? {
          didSet {
              fourthCharLabel.textColor = setColor(colorString: char3Color ?? "black")
          }
     }
    
    var char4Value: String? {
          didSet {
              fifthCharLabel.text = char4Value
          }
     }
    var char4Color: String? {
          didSet {
              fifthCharLabel.textColor = setColor(colorString: char4Color ?? "black")
          }
     }
    
    func setColor(colorString: String) -> UIColor {
        switch(colorString) {
        case "green":
            return .green
        case "yellow":
            return .orange
        case "red":
            return .red
        default:
            return .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstCharLabel.text = blank
        secondCharLabel.text = blank
        thirdCharLabel.text = blank
        fourthCharLabel.text = blank
        fifthCharLabel.text = blank
        
        firstCharLabel.textColor = setColor(colorString: char0Color ?? "black")
        secondCharLabel.textColor = setColor(colorString: char1Color ?? "black")
        thirdCharLabel.textColor = setColor(colorString: char2Color ?? "black")
        fourthCharLabel.textColor = setColor(colorString: char3Color ?? "black")
        fifthCharLabel.textColor = setColor(colorString: char4Color ?? "black")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
