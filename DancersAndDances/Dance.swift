//
//  Dance.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/18/24.
//

import Foundation
import SwiftData

@Model
final class Dance {
    var name: String
    @Relationship(inverse: \Dancer.dances) var dancers = [Dancer]()
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Dance(name: "Soldier"),
        Dance(name: "Dai"),
        Dance(name: "Straightsword-Fribbon"),
        Dance(name: "Long Fabric"),
    ]
}
