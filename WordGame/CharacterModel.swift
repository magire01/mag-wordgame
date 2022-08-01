//
//  CharacterModel.swift
//  WordGame
//
//  Created by Mark Gire on 7/24/22.
//

import Foundation

struct CharacterModel: Codable {
    var attempt: [WordAttempt]
    
    struct WordAttempt: Codable {
        var word: [CharacterValue]
    }
    
    struct CharacterValue: Codable {
        var value: String
        var color: String
    }
        
}
