//
//  ViewController.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var playerStats = [PlayerStats]()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBAction func newGameButtonTouched(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func statsButtonTouched(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StatsViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func settingsButtonTouched(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.titleLabel.textColor = .white
        newGameButton.layer.cornerRadius = 20
        newGameButton.layer.borderWidth = 3
        newGameButton.layer.borderColor = CGColor(red: 58, green: 175, blue: 169, alpha: 1)
        statsButton.layer.cornerRadius = 20
        statsButton.layer.borderWidth = 3
        statsButton.layer.borderColor = CGColor(red: 58, green: 175, blue: 169, alpha: 1)
        settingsButton.layer.cornerRadius = 20
        settingsButton.layer.borderWidth = 3
        settingsButton.layer.borderColor = CGColor(red: 58, green: 175, blue: 169, alpha: 1)
        
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    // Core Data
//    func getWinHistory() {
//        do {
//            playerStats = try context.fetch(PlayerStats.fetchRequest())
//            DispatchQueue.main.async { [self] in
//                for stats in playerStats {
//                    if let stats = stats as? PlayerStats {
//                        print("stat: \(stats.win)")
//                        print("stat: \(stats.date)")
//                    }
//                }
//            }
//        } catch {
//            //error
//            print("error get")
//        }
//    }
//    
//    func createWinHistory(gameResult: String) {
//        let newResult = PlayerStats(context: context)
//        newResult.win = gameResult
//        newResult.date = Date()
//        
//        do {
//            try context.save()
//        } catch {
//            print("error Update")
//        }
//    }

}

