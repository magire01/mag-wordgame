//
//  KeybardModel.swift
//  WordGame
//
//  Created by Mark Gire on 8/5/22.
//

import Foundation

//struct KeyboardModel: Codable {
//    var firstRow: [KeyboardColor]
//    var secondRow: [KeyboardColor]
//    var thirdRow: [KeyboardColor]
//
//    struct KeyboardColor: Codable {
//        var value: String
//        var color: String
//    }
//}

class KeyboardModel {
    var value: String
    var color: String
    
    init(value: String, color: String) {
        self.value = value
        self.color = color
    }
}

