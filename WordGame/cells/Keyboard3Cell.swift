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
    
    @IBAction func deleteTextTouched(_ sender: Any) {
        delegate?.deleteKey()
    }
    
    @IBAction func submitButtonTouched(_ sender: Any) {
        delegate?.submitKey()
    }
    
    @IBAction func zPressed(_ sender: Any) {
        delegate?.updateKeyboard1(with: "Z")
    }
    
    var delegate: HandleKeyboard3Delegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
