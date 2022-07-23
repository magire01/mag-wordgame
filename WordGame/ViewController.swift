//
//  ViewController.swift
//  WordGame
//
//  Created by Mark Gire on 7/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func newGameButtonTouched(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
        self.present(vc.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

