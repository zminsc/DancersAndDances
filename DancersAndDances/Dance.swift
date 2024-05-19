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
    var dancers = [Dancer]()
    
    init(name: String) {
        self.name = name
    }
}
