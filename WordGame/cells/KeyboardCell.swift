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
