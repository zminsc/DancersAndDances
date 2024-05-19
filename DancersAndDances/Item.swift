//
//  Item.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/18/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
