//
//  KeyboardMainCell.swift
//  WordGame
//
//  Created by Mark Gire on 8/17/22.
//

import UIKit

class KeyboardMainCell: UITableViewCell {

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
    var firstKey = 0
    var lastKey = 0
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
