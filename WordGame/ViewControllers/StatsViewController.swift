//
//  StatsViewController.swift
//  WordGame
//
//  Created by Mark Gire on 8/14/22.
//

import UIKit

class StatsViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var playerStats = [PlayerStats]()
    @IBOutlet weak var winNumberLabel: UILabel!
    @IBOutlet weak var totalGamesLabel: UILabel!
    @IBOutlet weak var winPercentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getWinHistory()
    }
    
    func getWinHistory() {
        var winNumber = 0
        var totalGames = 0
        
        do {
            playerStats = try context.fetch(PlayerStats.fetchRequest())
            DispatchQueue.main.async { [self] in
                for stats in playerStats {
                    if stats.win == "win" {
                        winNumber = winNumber + 1
                    }
                    totalGames = totalGames + 1
                }
                let winPercentage = round(Double(winNumber)/Double(totalGames) * 100)
                winNumberLabel.text = "Wins: \(winNumber)"
                totalGamesLabel.text = "Total Games: \(totalGames)"
                winPercentageLabel.text = "Win %: \(winPercentage)"
            }
        } catch {
            //error
            print("error get")
        }
    }
}
