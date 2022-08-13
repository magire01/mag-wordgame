//
//  WordController.swift
//  WordGame
//
//  Created by Mark Gire on 8/13/22.
//

import Foundation

public class WordController {
    
    var wordModel: [String]?
    
    init() {
        loadJson()
    }
    
    func loadJson() {
        if let url = Bundle.main.url(forResource: "words", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([String].self, from: data)
                self.wordModel = jsonData
            } catch {
                print("error:\(error)")
            }
        }    }
}


