//
//  GameLevelSet.swift
//  Colorful Dots
//
//  Created by Noah Grubbs on 3/27/22.
//

import Foundation

class GameLevelSet {
    var id: Int = 0
    var stars: Int = 0
    var time: Float = -1
    var score: Int = 0
    var unlocked: Bool = false
    static func getHardCodedCollection() -> [GameLevelSet]
    {
        var sets = [GameLevelSet]()
        for i in 1...15
        {
            let item = GameLevelSet()
            item.id = i
            if i == 1{
                item.unlocked = true
            }
            sets.append(item)
        }
        return sets
    }
}
