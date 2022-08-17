//
//  PlayerStats+CoreDataProperties.swift
//  WordGame
//
//  Created by Mark Gire on 8/14/22.
//
//

import Foundation
import CoreData


extension PlayerStats {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerStats> {
        return NSFetchRequest<PlayerStats>(entityName: "PlayerStats")
    }

    @NSManaged public var date: Date?
    @NSManaged public var win: String?

}

extension PlayerStats : Identifiable {

}
