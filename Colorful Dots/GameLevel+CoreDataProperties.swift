//
//  GameLevel+CoreDataProperties.swift
//  Colorful Dots
//
//  Created by Noah Grubbs on 3/27/22.
//
//

import Foundation
import CoreData

@objc(GameLevel)
public class GameLevel: NSManagedObject {

    @NSManaged public var id: Int16
    @NSManaged public var stars: Int16
    @NSManaged public var time: Float
    @NSManaged public var score: Int32
    @NSManaged public var unlocked: Bool

}


