//
//  Dancer.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/18/24.
//

import Foundation
import SwiftData

@Model
final class Dancer {
    var name: String
    var dances = [Dance]()
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Dancer(name: "Alice"),
        Dancer(name: "Bob"),
        Dancer(name: "Carol"),
        Dancer(name: "Dan"),
    ]
}
