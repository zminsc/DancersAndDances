//
//  DanceDancer.swift
//  DancersAndDances
//
//  Created by Steven Chang on 5/21/24.
//

import Foundation
import SwiftData

@Model
final class DanceDancer {
    var dance: Dance
    var dancer: Dancer
    
    init(dance: Dance, dancer: Dancer) {
        self.dance = dance
        self.dancer = dancer
    }
    
    static let sampleData = [
        DanceDancer(dance: Dance.sampleData[0], dancer: Dancer.sampleData[1]),
        DanceDancer(dance: Dance.sampleData[0], dancer: Dancer.sampleData[3]),
        DanceDancer(dance: Dance.sampleData[1], dancer: Dancer.sampleData[0]),
        DanceDancer(dance: Dance.sampleData[1], dancer: Dancer.sampleData[1]),
        DanceDancer(dance: Dance.sampleData[2], dancer: Dancer.sampleData[2]),
        DanceDancer(dance: Dance.sampleData[3], dancer: Dancer.sampleData[2]),
    ]
}
