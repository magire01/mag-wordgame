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
    
    var blank: String = "-"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstCharLabel.text = blank
        secondCharLabel.text = blank
        thirdCharLabel.text = blank
        fourthCharLabel.text = blank
        fifthCharLabel.text = blank
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
